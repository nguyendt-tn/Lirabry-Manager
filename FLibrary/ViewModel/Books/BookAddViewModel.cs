using Dapper;
using FLibrary.Helper;
using FLibrary.Helper.Base;
using FLibrary.Model;
using FLibrary.View.Book;
using FLibrary.ViewModel.Base;
using System;
using System.Collections.Generic;
using System.Data.SQLite;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace FLibrary.ViewModel.Books
{
    public class BookAddViewModel : BindableBase
    {
        #region [Commands]
        public ICommand SaveCMD { get { return new CommandHelper(Save); } }
        public ICommand CancelCMD { get { return new CommandHelper(() => { (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog(); }); } }
        #endregion


        private Book _currentBook;
        public Book CurrentBook
        {
            get { return _currentBook; }
            set { _currentBook = value; }
        }

        public SQLiteConnection DBServices = new DbHelper().GetConnection();

        public BookAddViewModel()
        {
            CurrentBook = new Book();
        }
        public void Save()
        {
            string sql = SQLGenerator.CreateSQLInsertFromObject(CurrentBook);
            DBServices.Execute(sql, CurrentBook);
            (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
        }
    }
}
