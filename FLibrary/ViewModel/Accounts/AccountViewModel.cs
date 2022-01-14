using Dapper;
using FLibrary.Helper;
using FLibrary.Helper.Base;
using FLibrary.Model;
using FLibrary.View.Account;
using FLibrary.ViewModel.Base;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.SQLite;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using BCrypt.Net;

namespace FLibrary.ViewModel.Accounts
{
    public class AccountViewModel: BindableBase
    {
        #region [Collections]
        private ObservableCollection<Account> _Account;

        public ObservableCollection<Account> Accounts
        {
            get { return _Account; }
            set { _Account = value; OnPropertyChanged(); }
        }
        #endregion

        #region [Commands]
        public ICommand AddNewAccountCMD { get { return new CommandHelper(AddNewAccount); } }
        public ICommand EditAccountCMD { get { return new CommandHelper<Account>((u) => u != null, ((u) => EditAccount(u))); } }
        public ICommand DeleteAccountCMD { get { return new CommandHelper<Account>((u) => u != null, ((u) => DeleteAccount(u))); } }
        public ICommand SearchAccountCMD { get { return new CommandHelper(SearchAccount); } }
        public ICommand SaveCMD { get { return new CommandHelper(Save); } }
        public ICommand UpdateCMD { get { return new CommandHelper(Update); } }
        public ICommand DeleteCMD { get { return new CommandHelper(Delete); } }
        public ICommand CancelCMD { get { return new CommandHelper(() => { (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog(); }); } }

        #endregion

        private Account _currentAccount;
        public Account CurrentAccount
        {
            get { return _currentAccount; }
            set { _currentAccount = value; }
        }
        private Account _selectAccount;
        public Account SelectAccount
        {
            get { return _selectAccount; }
            set { _selectAccount = value; }
        }

        private String _contentSearch = String.Empty;
        public String ContentSearch
        {
            get { return _contentSearch; }
            set { _contentSearch = value; OnPropertyChanged(); }
        }

        private string _confirmNewPassword;
        public string ConfirmNewPassword
        {
            get { return _confirmNewPassword; }   
            set { _confirmNewPassword = value; OnPropertyChanged();}
        }
        private string _newPassword;
        public string NewPassword
        {
            get { return _newPassword; }  
            set { _newPassword = value; OnPropertyChanged(); }
        }
        private string _currentPassword;
        public string CurrentPassword
        {
            get { return _currentPassword; } 
            set { _currentPassword = value; OnPropertyChanged(); }
        }

        public SQLiteConnection DBServices = new DbHelper().GetConnection();


        public AccountViewModel()
        {
            CurrentAccount = new Account();
            LoadAccount();
        }

        public void LoadAccount()
        {
            string query = "Select * From Account";
            var data = DBServices.Query<Account>(query);

            if (data != null)
                Accounts = new ObservableCollection<Account>(data);
            else
                Accounts?.Clear();
        }
        public void AddNewAccount() => (App.Current.MainWindow.DataContext as MainViewModel).OpenDiaLog(new AccountAdd());

        public void EditAccount(Account Account)
        {
            SelectAccount = Account;
            (App.Current.MainWindow.DataContext as MainViewModel).OpenDiaLog(new AccountEdit());
        }
        public void DeleteAccount(Account Account)
        {
            SelectAccount = Account;
            (App.Current.MainWindow.DataContext as MainViewModel).OpenDiaLog(new AccountDelete());
        }

        void SearchAccount()
        {
            try
            {
                if (String.IsNullOrEmpty(_contentSearch.Trim()))
                {
                    LoadAccount();
                    return;
                }
                string query = "Select * From Account Where AccountName LIKE @contentSearch";
                var data = DBServices.Query<Account>(query, new { contentSearch = $@"%{ContentSearch}%" });
                if (data != null)
                    Accounts = new ObservableCollection<Account>(data);
                else
                    Accounts?.Clear();
            }
            catch (Exception ex)
            {
                (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
                MessageBox.Show(ex.Message.ToString(), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void Save()
        {
            try
            {
                string password = BCrypt.Net.BCrypt.HashPassword(CurrentAccount.Password);

                CurrentAccount.Password = password;

                string sql = SQLGenerator.CreateSQLInsertFromObject(CurrentAccount);
                DBServices.Execute(sql, CurrentAccount);

                string query = "SELECT MAX(Id) FROM Account";
                var Id = DBServices.ExecuteScalar<int>(query);

                CurrentAccount.Id = Id.ToString();

                Accounts.Add(CurrentAccount);

                (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
                CurrentAccount = new Account();
            }
            catch (Exception ex)
            {
                (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
                MessageBox.Show(ex.Message.ToString(), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void Update()
        {
            try
            {
                if(!string.IsNullOrEmpty(NewPassword) && !string.IsNullOrEmpty(ConfirmNewPassword) && !string.IsNullOrEmpty(CurrentPassword))
                {
                    string query = "SELECT Password FROM Account where Email=@email";
                    var password = DBServices.ExecuteScalar<string>(query, new { email = $@"{SelectAccount.Email}" });
                    if (!BCrypt.Net.BCrypt.Verify(CurrentPassword, password))
                    {
                        MessageBox.Show("Password Incorrect, try later!", "Warning", MessageBoxButton.OK, MessageBoxImage.Warning);
                        return;
                    }
                    if(NewPassword != ConfirmNewPassword)
                    {
                        MessageBox.Show("New Password not match, try later!", "Warning", MessageBoxButton.OK, MessageBoxImage.Warning);
                        return;
                    }

                    string newPassword = BCrypt.Net.BCrypt.HashPassword(NewPassword);

                    SelectAccount.Password = newPassword;

                    string sql = SQLGenerator.CreateSQLUpdateFromObject(SelectAccount);
                    DBServices.Execute(sql, SelectAccount);
                    (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
                }
                else
                {
                    string sql = SQLGenerator.CreateSQLUpdateFromObject(SelectAccount);
                    MessageBox.Show(sql);
                    DBServices.Execute(sql, SelectAccount);
                    (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
                }
            }
            catch (Exception ex)
            {
                (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
                MessageBox.Show(ex.Message.ToString(),"Error" , MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void Delete()
        {
            try
            {
                if(SelectAccount.Email == "admin@gmail.com")
                {
                    (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
                    MessageBox.Show("Error", "You cannot delete default account", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }
                string sql = SQLGenerator.CreateSQLDeleteFromObject(SelectAccount);
                DBServices.Execute(sql, SelectAccount);
                Accounts.Remove(SelectAccount);
                (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
            }
            catch (Exception ex)
            {
                (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
                MessageBox.Show(ex.Message.ToString(), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
