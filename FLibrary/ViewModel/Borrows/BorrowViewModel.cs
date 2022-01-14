using Dapper;
using FLibrary.Helper;
using FLibrary.Helper.Base;
using FLibrary.Model;
using FLibrary.View.Borrow;
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
        public ICommand SaveCMD { get { return new CommandHelper(Save); } }
        public ICommand SearchBorrowCMD { get { return new CommandHelper(SearchBorrow); } }
        public ICommand UpdateCMD { get { return new CommandHelper(Update); } }
        public ICommand DeleteCMD { get { return new CommandHelper(Delete); } }
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
            string query = "Select * From Borrow";
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
            string query = "Select * From Borrow Where MemberName LIKE '" + _contentSearch + "%'";
            var data = DBServices.Query<Borrow>(query);
            if (data != null)
                Borrows = new ObservableCollection<Borrow>(data);
            else
                Borrows?.Clear();
        }

        public void Save()
        {
            string user_sql = "Select * From Member Where Id = '" + CurrentBorrow.MemberId + "'";
            var user = DBServices.Query<Member>(user_sql).FirstOrDefault();
            if(user != null)
            {
                CurrentBorrow.MemberName = user.Name;
            }
            string book_sql = "Select * From Book Where Id = '" + CurrentBorrow.BookId + "'";
            var book = DBServices.Query<Book>(book_sql).FirstOrDefault();
            if(book != null)
            {
                CurrentBorrow.BookName = book.Title;
            }
            CurrentBorrow.BorrowDate = DateTime.Now;
            CurrentBorrow.DueDate = DueDate;

            string sql = SQLGenerator.CreateSQLInsertFromObject(CurrentBorrow);
   
            DBServices.Execute(sql, CurrentBorrow);

            string query = "SELECT MAX(Id) FROM Borrow";
            var Id = DBServices.ExecuteScalar<int>(query);

            CurrentBorrow.Id = Id.ToString();

            Borrows.Add(CurrentBorrow);
            (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
            CurrentBorrow = new Borrow();
            DueDate = DateTime.Now;
        }
        public void Update()
        {
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
            string sql = SQLGenerator.CreateSQLUpdateFromObject(SelectBorrow);
            DBServices.Execute(sql, SelectBorrow);
            (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
            DueDate = DateTime.Now;
        }

        public void Delete()
        {
            string sql = SQLGenerator.CreateSQLDeleteFromObject(SelectBorrow);
            DBServices.Execute(sql, SelectBorrow);
            Borrows.Remove(SelectBorrow);
            (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
            DueDate = DateTime.Now;
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
    }
}
