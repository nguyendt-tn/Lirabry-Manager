using FLibrary.ViewModel.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FLibrary.Model
{
    public class Borrow: BindableBase
    {
        private string _id;
        private string _memberId;
        private string _memberName;
        private string _bookId;
        private string _bookName;
        private DateTime _borrowDate;
        private DateTime _dueDate;
        private int _total;
        private int _isReturn = 0;

        public string Id
        {
            get { return _id; }
            set { _id = value; OnPropertyChanged(); }
        }
        public string MemberId
        {
            get { return _memberId; }
            set { _memberId = value; OnPropertyChanged(); }
        }
        public string MemberName
        {
            get { return _memberName; }
            set { _memberName = value; OnPropertyChanged(); }
        }
        public string BookId
        {
            get { return _bookId; }
            set { _bookId = value; OnPropertyChanged(); }
        }
        public string BookName
        {
            get { return _bookName; }
            set { _bookName = value; OnPropertyChanged(); }
        }
        public DateTime BorrowDate
        {
            get { return _borrowDate; }
            set { _borrowDate = value; OnPropertyChanged(); }
        }
        public DateTime DueDate
        {
            get { return _dueDate; }
            set { _dueDate = value; OnPropertyChanged(); }
        }
        public int Total
        {
            get { return _total; }  
            set { _total = value; OnPropertyChanged(); }
        }
        public int IsReturn
        {
            get { return _isReturn; }   
            set { _isReturn = value; OnPropertyChanged(); }
        }
    }
}
