using FLibrary.ViewModel.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using FLibrary.Model;
using FLibrary.Helper;
using System.Data.SQLite;
using Dapper;

namespace FLibrary.ViewModel
{
    public class LoginViewModel: BaseViewModel
    {
        #region
        private Account _currentAccount;
        public Account CurrentAccount
        {
            get { return _currentAccount; }
            set { _currentAccount = value; }
        }
        #endregion
        public WindowState WindowState
        {
            get { return _windowState; }
            set { _windowState = value; OnPropertyChanged(); }
        }

        private WindowState _windowState = WindowState.Normal;
        
        #region commands

        public ICommand MinimizedWindowCMD { get { return new CommandHelper(MinimizedWindow); } }
        public ICommand CloseWindowCMD { get { return new CommandHelper(CloseWindow); } }
        public ICommand DragMoveCMD { get { return new CommandHelper<Window>((w) => w != null, ((p) => { try { p.DragMove(); } catch { } })); } }
        #endregion

        public bool IsLogin { get; set; }
        public ICommand LoginCMD { get; set; }

        public SQLiteConnection DBServices = new DbHelper().GetConnection();
        public LoginViewModel()
        {
            CurrentAccount = new Account();
            IsLogin = false;
            LoginCMD = new RelayCommand<Window>((p) => { return true; }, (p) =>
            {
                login(p);
            });
        }
        void login(Window p)
        {
            if (p == null)
            {
                return;
            }
            if(string.IsNullOrEmpty(CurrentAccount.Email) || string.IsNullOrEmpty(CurrentAccount.Password))
            {
                MessageBox.Show("Enter your account to login!","Error",MessageBoxButton.OK,MessageBoxImage.Warning);
                return;
            }
            else
            {
                string isValidQuery = "SELECT EXISTS(SELECT 1 FROM Account WHERE Email=@email)";
                int isValid = DBServices.ExecuteScalar<int>(isValidQuery, new { email = $@"{CurrentAccount.Email}" });

                if (isValid == 0)
                {
                    MessageBox.Show("Invalid Account, try later!", "Warning", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                string queryPassword = "SELECT Password FROM Account where Email=@email";
                var password = DBServices.ExecuteScalar<string>(queryPassword, new { email = $@"{CurrentAccount.Email}" });
                if (!BCrypt.Net.BCrypt.Verify(CurrentAccount.Password, password))
                {
                    MessageBox.Show("Password Incorrect, try later!", "Warning", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }
                string queryName = "SELECT Name FROM Account where Email=@email";
                var userName = DBServices.ExecuteScalar<string>(queryName, new { email = $@"{CurrentAccount.Email}" });
                CurrentAccount.Name = userName;
   
                IsLogin = true;
                p.Close();
            }

        }
        public void MinimizedWindow() => WindowState = WindowState.Minimized;
        public void CloseWindow() => Environment.Exit(0);
    }
}
