using Dapper;
using FLibrary.Helper;
using FLibrary.ViewModel.Base;
using System;
using System.Collections.Generic;
using System.Data.SQLite;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FLibrary.ViewModel.Home
{
    public class HomeViewModel: BindableBase
    {
        private int _totalBook;
        private int _totalMember;
        private int _totalBorrow;
        private int _totalReturn;

        public int TotalBook
        {
            get { return _totalBook; }
            set { _totalBook = value; }
        }
        public int TotalMember
        {
            get { return _totalMember; }
            set { _totalMember = value; }
        }
        public int TotalBorrow
        {
            get { return _totalBorrow; }
            set { _totalBorrow = value; }
        }
        public int TotalReturn
        {
            get { return _totalReturn; }
            set { _totalReturn = value; }
        }

        public SQLiteConnection DBServices = new DbHelper().GetConnection();

        public HomeViewModel()
        {
            LoadTotalBook();
            LoadTotalMember();
            LoadTotalBorrow();
            LoadTotalReturn();
        }
        public void LoadTotalBook()
        {
            string query = "SELECT COUNT(*) From Book";
            var total = DBServices.ExecuteScalar<int>(query);
            TotalBook = total;
        }
        public void LoadTotalMember()
        {
            string query = "SELECT COUNT(*) From Member";
            var total = DBServices.ExecuteScalar<int>(query);
            TotalMember = total;
        }
        public void LoadTotalBorrow()
        {
            string query = "SELECT COUNT(*) From Borrow Where IsReturn='0'";
            var total = DBServices.ExecuteScalar<int>(query);
            TotalBorrow = total;
        }
        public void LoadTotalReturn()
        {
            string query = "SELECT COUNT(*) From Borrow Where IsReturn='1'";
            var total = DBServices.ExecuteScalar<int>(query);
            TotalReturn = total;
        }
    }
}
