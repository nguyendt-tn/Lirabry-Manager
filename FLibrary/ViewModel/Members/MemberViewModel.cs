using Dapper;
using FLibrary.Helper;
using FLibrary.Helper.Base;
using FLibrary.Model;
using FLibrary.View.Member;
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

namespace FLibrary.ViewModel.Members
{
    public class MemberViewModel: BindableBase
    {

        #region [Collections]
        private ObservableCollection<Member> _members;

        public ObservableCollection<Member> Members
        {
            get { return _members; }
            set { _members = value; OnPropertyChanged(); }
        }
        #endregion

        #region [Commands]
        public ICommand AddNewMemberCMD { get { return new CommandHelper(AddNewMember); } }
        public ICommand EditMemberCMD { get { return new CommandHelper<Member>((u) => u != null, ((u) => EditMember(u))); } }
        public ICommand DeleteMemberCMD { get { return new CommandHelper<Member>((u) => u != null, ((u) => DeleteMember(u))); } }
        public ICommand SearchMemberCMD { get { return new CommandHelper(SearchMember); } }
        public ICommand SaveCMD { get { return new CommandHelper(Save); } }
        public ICommand UpdateCMD { get { return new CommandHelper(Update); } }
        public ICommand DeleteCMD { get { return new CommandHelper(Delete); } }
        public ICommand CancelCMD { get { return new CommandHelper(() => { (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog(); }); } }

        #endregion

        private Member _currentMember;
        public Member CurrentMember
        {
            get { return _currentMember; }
            set { _currentMember = value; }
        }
        private Member _selectMember;
        public Member SelectMember
        {
            get { return _selectMember; }
            set { _selectMember = value; }
        }


        private DateTime _startDate = DateTime.Now.Date;
        public DateTime StartDate
        {
            get { return _startDate; }
            set { _startDate = value; OnPropertyChanged(); }
        }

        private String _contentSearch = String.Empty;
        public String ContentSearch
        {
            get { return _contentSearch; }
            set { _contentSearch = value; OnPropertyChanged(); }
        }

        public SQLiteConnection DBServices = new DbHelper().GetConnection();


        public MemberViewModel()
        {
            CurrentMember = new Member();
            LoadMember();
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
        public void AddNewMember() => (App.Current.MainWindow.DataContext as MainViewModel).OpenDiaLog(new MemberAdd());

        public void EditMember(Member member)
        {
            SelectMember = member;
            StartDate = SelectMember.DateOfBirth;
            (App.Current.MainWindow.DataContext as MainViewModel).OpenDiaLog(new MemberEdit());
        }
        public void DeleteMember(Member member)
        {
            SelectMember = member;
            (App.Current.MainWindow.DataContext as MainViewModel).OpenDiaLog(new MemberDelete());
        }

        void SearchMember()
        {
            if (String.IsNullOrEmpty(_contentSearch.Trim()))
            {
                LoadMember();
                return;
            }
            string query = "Select * From Member Where Name LIKE '" + _contentSearch + "%'";
            var data = DBServices.Query<Member>(query);
            if (data != null)
                Members = new ObservableCollection<Member>(data);
            else
                Members?.Clear();
        }
        public void Save()
        {
            CurrentMember.DateOfBirth = StartDate;

            string sql = SQLGenerator.CreateSQLInsertFromObject(CurrentMember);
            DBServices.Execute(sql, CurrentMember);

            string query = "SELECT MAX(Id) FROM Member";
            var Id = DBServices.ExecuteScalar<int>(query);

            CurrentMember.Id = Id.ToString();

            Members.Add(CurrentMember);

            (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
            StartDate = DateTime.Now;
            CurrentMember = new Member();
        }
        public void Update()
        {
            SelectMember.DateOfBirth = StartDate;
            string sql = SQLGenerator.CreateSQLUpdateFromObject(SelectMember);
            DBServices.Execute(sql, SelectMember);
            StartDate = DateTime.Now;
            (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
        }
        public void Delete()
        {
            SelectMember.DateOfBirth = StartDate;
            string sql = SQLGenerator.CreateSQLDeleteFromObject(SelectMember);
            DBServices.Execute(sql, SelectMember);
            Members.Remove(SelectMember);
            StartDate = DateTime.Now;
            (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
        }
    }
}
