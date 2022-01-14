using FLibrary.ViewModel.Base;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FLibrary.Model;
using System.Data.SQLite;
using FLibrary.Helper;
using Dapper;
using System.Windows;
using System.Dynamic;
using System.Windows.Input;
using FLibrary.View.Book;
using MaterialDesignThemes.Wpf;
using FLibrary.Helper.Base;
using System.Windows.Controls;

namespace FLibrary.ViewModel.Books
{
    public class BookViewModel : BindableBase
    {
        #region [Collections]
        private ObservableCollection<Book> _books;

        public ObservableCollection<Book> Books
        {
            get { return _books; }
            set { _books = value; OnPropertyChanged(); }
        }
        #endregion

        #region
        private ObservableCollection<Author> _authors;

        public ObservableCollection<Author> Authors
        {
            get { return _authors; }
            set { _authors = value; OnPropertyChanged(); }
        }
        #endregion

        #region
        private ObservableCollection<Category> _cagegories;

        public ObservableCollection<Category> Categories
        {
            get { return _cagegories; }
            set { _cagegories = value; OnPropertyChanged(); }
        }
        #endregion

        #region [Commands]
        public ICommand AddNewBookCMD { get { return new CommandHelper(AddNewBook); } }
        public ICommand EditBookCMD { get { return new CommandHelper<Book>((u) => u != null, ((u) => EditBook(u))); } }
        public ICommand DeleteBookCMD { get { return new CommandHelper<Book>((u) => u != null, ((u) => DeleteBook(u))); } }
        public ICommand SearchBookCMD { get { return new CommandHelper(SearchBook); } }
        public ICommand SaveCMD { get { return new CommandHelper(Save); } }
        public ICommand UpdateCMD { get { return new CommandHelper(Update); } }
        public ICommand DeleteCMD { get { return new CommandHelper(Delete); } }
        public ICommand CancelCMD { get { return new CommandHelper(() => { (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog(); }); } }
        #endregion

        private Book _currentBook;
        public Book CurrentBook
        {
            get { return _currentBook; }
            set { _currentBook = value; }
        }

        private Book _selectBook;
        public Book SelectBook
        {
            get { return _selectBook; }
            set { _selectBook = value; }
        }

        private String _contentSearch = String.Empty;
        public String ContentSearch
        {
            get { return _contentSearch; }
            set { _contentSearch = value; OnPropertyChanged(); }
        }



        public SQLiteConnection DBServices = new DbHelper().GetConnection();

        public BookViewModel() {
            CurrentBook = new Book();
            LoadBook();
            LoadAuthor();
            LoadCategories();
        }


        public void LoadBook()
        {
            string query = "Select * From Book";
            var data = DBServices.Query<Book>(query);
            if (data != null)
                Books = new ObservableCollection<Book>(data);
            else
                Books?.Clear();
        }
        public void LoadAuthor()
        {
            string query = "Select * From Author";
            var data = DBServices.Query<Author>(query);
            if(data != null)
                Authors = new ObservableCollection<Author>(data);
            else
                Authors?.Clear();
        }
        public void LoadCategories()
        {
            string query = "Select * From Category";
            var data = DBServices.Query<Category>(query);
            if (data != null)
                Categories = new ObservableCollection<Category>(data);
            else
                Categories?.Clear();
        }
        void SearchBook()
        {
            if (String.IsNullOrEmpty(_contentSearch.Trim()))
            {
                LoadBook();
                return;
            }
            string query = "Select * From Book Where Title LIKE '" + _contentSearch+ "%'";
            var data = DBServices.Query<Book>(query);
            if (data != null)
                Books = new ObservableCollection<Book>(data);
            else
                Books?.Clear();
        }

        public void Save()
        {

            string sql = SQLGenerator.CreateSQLInsertFromObject(CurrentBook);
            DBServices.Execute(sql, CurrentBook);

            string query = "SELECT MAX(Id) FROM Book";
            var Id = DBServices.ExecuteScalar<int>(query);

            CurrentBook.Id = Id.ToString();

            Books.Add(CurrentBook);
            (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
            CurrentBook = new Book();
        }
        public void Update()
        {
            string sql = SQLGenerator.CreateSQLUpdateFromObject(SelectBook);
            DBServices.Execute(sql, SelectBook);
            (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
        }
        public void Delete()
        {
            string sql = SQLGenerator.CreateSQLDeleteFromObject(SelectBook);
            DBServices.Execute(sql, SelectBook);
            Books.Remove(SelectBook);
            (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
        }

        public void AddNewBook() => (App.Current.MainWindow.DataContext as MainViewModel).OpenDiaLog(new BookAdd());
        public void EditBook(Book book)
        {
            SelectBook = book;
            (App.Current.MainWindow.DataContext as MainViewModel).OpenDiaLog(new BookEdit());
        }
        public void DeleteBook(Book book)
        {
            SelectBook = book;
            (App.Current.MainWindow.DataContext as MainViewModel).OpenDiaLog(new BookDelete());
        }

    }
}
