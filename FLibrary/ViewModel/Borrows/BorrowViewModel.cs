using Dapper;
using FLibrary.Helper;
using FLibrary.Helper.Base;
using FLibrary.Model;
using FLibrary.View.Book;
using FLibrary.View.Borrow;
using FLibrary.ViewModel.Base;
using FLibrary.ViewModel.Books;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.SQLite;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace FLibrary.ViewModel.Borrows
{
    public class BorrowViewModel : BindableBase
    {
        #region [Collections]
        private ObservableCollection<Borrow> _borrows;

        public ObservableCollection<Borrow> Borrows
        {
            get { return _borrows; }
            set { _borrows = value; OnPropertyChanged(); }
        }
        #endregion

        #region [Collections]
        private ObservableCollection<Book> _books;

        public ObservableCollection<Book> Books
        {
            get { return _books; }
            set { _books = value; OnPropertyChanged(); }
        }
        #endregion

        #region [Collections]
        private ObservableCollection<Member> _members;

        public ObservableCollection<Member> Members
        {
            get { return _members; }
            set { _members = value; OnPropertyChanged(); }
        }
        #endregion

        #region
        public ICommand AddNewBorrowCMD { get { return new CommandHelper(AddNewBorrow); } }
        public ICommand EditBorrowCMD { get { return new CommandHelper<Borrow>((u) => u != null, ((u) => EditBorrow(u))); } }
        public ICommand DeleteBorrowCMD { get { return new CommandHelper<Borrow>((u) => u != null, ((u) => DeleteBorrow(u))); } }
        public ICommand ReturnBorrowCMD { get { return new CommandHelper<Borrow>((u) => u != null, ((u) => ReturnBorrow(u))); } }
        public ICommand SaveCMD { get { return new CommandHelper(Save); } }
        public ICommand SearchBorrowCMD { get { return new CommandHelper(SearchBorrow); } }
        public ICommand UpdateCMD { get { return new CommandHelper(Update); } }
        public ICommand DeleteCMD { get { return new CommandHelper(Delete); } }
        public ICommand ReturnCMD { get { return new CommandHelper(Return); } }
        public ICommand CancelCMD { get { return new CommandHelper(() => { (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog(); }); } }
        #endregion


        private Borrow _currentBoroow;
        public Borrow CurrentBorrow
        {
            get { return _currentBoroow; }
            set { _currentBoroow = value; }
        }

        private Borrow _selectBorrow;
        public Borrow SelectBorrow
        {
            get { return _selectBorrow; }
            set { _selectBorrow = value; }
        }
        private DateTime _dueDate = DateTime.Now.Date;
        public DateTime DueDate
        {
            get { return _dueDate; }
            set { _dueDate = value; OnPropertyChanged(); }
        }

        private String _contentSearch = String.Empty;
        public String ContentSearch
        {
            get { return _contentSearch; }
            set { _contentSearch = value; OnPropertyChanged(); }
        }

        public SQLiteConnection DBServices = new DbHelper().GetConnection();


        public BorrowViewModel()
        {
            CurrentBorrow = new Borrow();
            LoadBorrow();
            LoadBook();
            LoadMember();
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
        public void LoadMember()
        {
            string query = "Select * From Member";
            var data = DBServices.Query<Member>(query);
            if (data != null)
                Members = new ObservableCollection<Member>(data);
            else
                Members?.Clear();
        }
        public void LoadBorrow()
        {
            string query = "Select * From Borrow Where IsReturn='0'";
            var data = DBServices.Query<Borrow>(query);
            if (data != null)
                Borrows = new ObservableCollection<Borrow>(data);
            else
                Borrows?.Clear();
        }

        void SearchBorrow()
        {
            if (String.IsNullOrEmpty(_contentSearch.Trim()))
            {
                LoadBorrow();
                return;
            }
            string query = "Select * From Borrow Where IsReturn='0' And MemberName LIKE '" + _contentSearch + "%'";
            var data = DBServices.Query<Borrow>(query);
            if (data != null)
                Borrows = new ObservableCollection<Borrow>(data);
            else
                Borrows?.Clear();
        }

        public void Save()
        {
            try
            {
                string user_sql = "Select * From Member Where Id = '" + CurrentBorrow.MemberId + "'";
                var user = DBServices.Query<Member>(user_sql).FirstOrDefault();
                if (user != null)
                {
                    CurrentBorrow.MemberName = user.Name;
                }
                string book_sql = "Select * From Book Where Id = '" + CurrentBorrow.BookId + "'";
                var book = DBServices.Query<Book>(book_sql).FirstOrDefault();
                if (book != null)
                {
                    CurrentBorrow.BookName = book.Title;
                }
                CurrentBorrow.BorrowDate = DateTime.Now;
                CurrentBorrow.DueDate = DueDate;

                if (book.Quantity < CurrentBorrow.Total)
                {
                    MessageBox.Show("Not Enough Book for Borrow!, Max Quantity is: "+book.Quantity, "Error", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                string sql = SQLGenerator.CreateSQLInsertFromObject(CurrentBorrow);

                DBServices.Execute(sql, CurrentBorrow);

                string updateBook = "Update Book Set Quantity=@quantity Where Id=@id";

                DBServices.Execute(updateBook, new { quantity = $@"{book.Quantity - CurrentBorrow.Total}", id = $@"{book.Id}" });

                string query = "SELECT MAX(Id) FROM Borrow";
                var Id = DBServices.ExecuteScalar<int>(query);

                CurrentBorrow.Id = Id.ToString();

                Borrows.Add(CurrentBorrow);
                (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
                CurrentBorrow = new Borrow();
                DueDate = DateTime.Now;

                LoadBook();

                var BookVM = new BookUC().DataContext as BookViewModel;
                BookVM.Books = Books;
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void Update()
        {
            try {
                string user_sql = "Select * From Member Where Id = '" + SelectBorrow.MemberId + "'";
                var user = DBServices.Query<Member>(user_sql).FirstOrDefault();
                if (user != null)
                {
                    SelectBorrow.MemberName = user.Name;
                }
                string book_sql = "Select * From Book Where Id = '" + SelectBorrow.BookId + "'";
                var book = DBServices.Query<Book>(book_sql).FirstOrDefault();
                if (book != null)
                {
                    SelectBorrow.BookName = book.Title;
                }
                SelectBorrow.DueDate = DueDate;

                string borrow_sql = "Select * From Borrow Where Id = '" + SelectBorrow.Id + "'";
                var borrow = DBServices.Query<Borrow>(borrow_sql).FirstOrDefault();

                int currentCount = 0;
                if(SelectBorrow.Total > borrow.Total)
                {
                    currentCount = SelectBorrow.Total - borrow.Total;
                }
                else if(SelectBorrow.Total < borrow.Total)
                {
                    currentCount = SelectBorrow.Total - borrow.Total;
                }
                else
                {
                    currentCount = SelectBorrow.Total;
                }               

                if (book.Quantity < currentCount)
                {
                    MessageBox.Show("Not Enough Book for Borrow!, Max Quantity is: " + book.Quantity, "Error", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                string sql = SQLGenerator.CreateSQLUpdateFromObject(SelectBorrow);

                DBServices.Execute(sql, SelectBorrow);

                string updateBook = "Update Book Set Quantity=@quantity Where Id=@id";

                DBServices.Execute(updateBook, new { quantity = $@"{book.Quantity - currentCount}", id = $@"{book.Id}" });


                (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
                SelectBorrow = new Borrow();

                DueDate = DateTime.Now;

                LoadBook();

                var BookVM = new BookUC().DataContext as BookViewModel;
                BookVM.Books = Books;

            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public void Delete()
        {
            try
            {
                string borrow_sql = "Select * From Borrow Where Id = '" + SelectBorrow.Id + "'";
                var borrow = DBServices.Query<Borrow>(borrow_sql).FirstOrDefault();

                string book_sql = "Select * From Book Where Id = '" + borrow.BookId + "'";
                var book = DBServices.Query<Book>(book_sql).FirstOrDefault();

                string updateBook = "Update Book Set Quantity=@quantity Where Id=@id";

                DBServices.Execute(updateBook, new { quantity = $@"{book.Quantity + borrow.Total}", id = $@"{book.Id}" });

                string sql = SQLGenerator.CreateSQLDeleteFromObject(SelectBorrow);
                DBServices.Execute(sql, SelectBorrow);
                Borrows.Remove(SelectBorrow);
                (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
                DueDate = DateTime.Now;


                LoadBook();

                var BookVM = new BookUC().DataContext as BookViewModel;
                BookVM.Books = Books;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void Return() {
            try
            {
                string borrow_sql = "Select * From Borrow Where Id = '" + SelectBorrow.Id + "'";
                var borrow = DBServices.Query<Borrow>(borrow_sql).FirstOrDefault();

                string book_sql = "Select * From Book Where Id = '" + borrow.BookId + "'";
                var book = DBServices.Query<Book>(book_sql).FirstOrDefault();

                string updateBook = "Update Book Set Quantity=@quantity Where Id=@id";

                DBServices.Execute(updateBook, new { quantity = $@"{book.Quantity + borrow.Total}", id = $@"{book.Id}" });


                string updateBorrow = "Update Borrow Set IsReturn=@isReturn Where Id=@id";

                DBServices.Execute(updateBorrow, new { isReturn = $@"1", id = $@"{borrow.Id}" });

                (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
                LoadBorrow();

                LoadBook();

                var BookVM = new BookUC().DataContext as BookViewModel;
                BookVM.Books = Books;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }
        public void AddNewBorrow() => (App.Current.MainWindow.DataContext as MainViewModel).OpenDiaLog(new BorrowAdd());

        public void EditBorrow(Borrow borrow)
        {
            SelectBorrow = borrow;
            DueDate = SelectBorrow.DueDate;
            (App.Current.MainWindow.DataContext as MainViewModel).OpenDiaLog(new BorrowEdit());
        }
        public void DeleteBorrow(Borrow borrow)
        {
            SelectBorrow = borrow;
            (App.Current.MainWindow.DataContext as MainViewModel).OpenDiaLog(new BorrowDelete());
        }
        public void ReturnBorrow(Borrow borrow)
        {
            SelectBorrow = borrow;
            (App.Current.MainWindow.DataContext as MainViewModel).OpenDiaLog(new BorrowReturn());
        }
    }
}
