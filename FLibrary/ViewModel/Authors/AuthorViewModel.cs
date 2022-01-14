using Dapper;
using FLibrary.Helper;
using FLibrary.Helper.Base;
using FLibrary.Model;
using FLibrary.View.Author;
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

namespace FLibrary.ViewModel.Authors
{
    public class AuthorViewModel: BindableBase
    {
        #region [Collections]
        private ObservableCollection<Author> _author;

        public ObservableCollection<Author> Authors
        {
            get { return _author; }
            set { _author = value; OnPropertyChanged(); }
        }
        #endregion

        #region [Commands]
        public ICommand AddNewAuthorCMD { get { return new CommandHelper(AddNewAuthor); } }
        public ICommand EditAuthorCMD { get { return new CommandHelper<Author>((u) => u != null, ((u) => EditAuthor(u))); } }
        public ICommand DeleteAuthorCMD { get { return new CommandHelper<Author>((u) => u != null, ((u) => DeleteAuthor(u))); } }
        public ICommand SearchAuthorCMD { get { return new CommandHelper(SearchAuthor); } }
        public ICommand SaveCMD { get { return new CommandHelper(Save); } }
        public ICommand UpdateCMD { get { return new CommandHelper(Update); } }
        public ICommand DeleteCMD { get { return new CommandHelper(Delete); } }
        public ICommand CancelCMD { get { return new CommandHelper(() => { (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog(); }); } }

        #endregion

        private Author _currentAuthor;
        public Author CurrentAuthor
        {
            get { return _currentAuthor; }
            set { _currentAuthor = value; }
        }
        private Author _selectAuthor;
        public Author SelectAuthor
        {
            get { return _selectAuthor; }
            set { _selectAuthor = value; }
        }

        private String _contentSearch = String.Empty;
        public String ContentSearch
        {
            get { return _contentSearch; }
            set { _contentSearch = value; OnPropertyChanged(); }
        }

        public SQLiteConnection DBServices = new DbHelper().GetConnection();


        public AuthorViewModel()
        {
            CurrentAuthor = new Author();
            LoadAuthor();
        }

        public void LoadAuthor()
        {
            string query = "Select * From Author";
            var data = DBServices.Query<Author>(query);

            if (data != null)
                Authors = new ObservableCollection<Author>(data);
            else
                Authors?.Clear();
        }
        public void AddNewAuthor() => (App.Current.MainWindow.DataContext as MainViewModel).OpenDiaLog(new AuthorAdd());

        public void EditAuthor(Author Author)
        {
            SelectAuthor = Author;
            (App.Current.MainWindow.DataContext as MainViewModel).OpenDiaLog(new AuthorEdit());
        }
        public void DeleteAuthor(Author Author)
        {
            SelectAuthor = Author;
            (App.Current.MainWindow.DataContext as MainViewModel).OpenDiaLog(new AuthorDelete());
        }

        void SearchAuthor()
        {
            try
            {
                if (String.IsNullOrEmpty(_contentSearch.Trim()))
                {
                    LoadAuthor();
                    return;
                }
                string query = "Select * From Author Where AuthorName LIKE @contentSearch";
                var data = DBServices.Query<Author>(query, new { contentSearch = $@"%{ContentSearch}%" });
                if (data != null)
                    Authors = new ObservableCollection<Author>(data);
                else
                    Authors?.Clear();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error", ex.Message.ToString(), MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void Save()
        {
            try
            {
                string sql = SQLGenerator.CreateSQLInsertFromObject(CurrentAuthor);
                DBServices.Execute(sql, CurrentAuthor);

                string query = "SELECT MAX(Id) FROM Author";
                var Id = DBServices.ExecuteScalar<int>(query);

                CurrentAuthor.Id = Id.ToString();

                Authors.Add(CurrentAuthor);

                (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
                CurrentAuthor = new Author();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error", ex.Message.ToString(), MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void Update()
        {
            try
            {
                string sql = SQLGenerator.CreateSQLUpdateFromObject(SelectAuthor);
                DBServices.Execute(sql, SelectAuthor);
                (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error", ex.Message.ToString(), MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void Delete()
        {
            try
            {
                string sql = SQLGenerator.CreateSQLDeleteFromObject(SelectAuthor);
                DBServices.Execute(sql, SelectAuthor);
                Authors.Remove(SelectAuthor);
                (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error", ex.Message.ToString(), MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
