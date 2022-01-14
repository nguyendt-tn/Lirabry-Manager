using Dapper;
using FLibrary.Helper;
using FLibrary.Helper.Base;
using FLibrary.Model;
using FLibrary.View.Category;
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

namespace FLibrary.ViewModel.Categories
{
    public class CategoryViewModel : BindableBase
    {
        #region [Collections]
        private ObservableCollection<Category> _categories;

        public ObservableCollection<Category> Categories
        {
            get { return _categories; }
            set { _categories = value; OnPropertyChanged(); }
        }
        #endregion

        #region [Commands]
        public ICommand AddNewCategoryCMD { get { return new CommandHelper(AddNewCategory); } }
        public ICommand EditCategoryCMD { get { return new CommandHelper<Category>((u) => u != null, ((u) => EditCategory(u))); } }
        public ICommand DeleteCategoryCMD { get { return new CommandHelper<Category>((u) => u != null, ((u) => DeleteCategory(u))); } }
        public ICommand SearchCategoryCMD { get { return new CommandHelper(SearchCategory); } }
        public ICommand SaveCMD { get { return new CommandHelper(Save); } }
        public ICommand UpdateCMD { get { return new CommandHelper(Update); } }
        public ICommand DeleteCMD { get { return new CommandHelper(Delete); } }
        public ICommand CancelCMD { get { return new CommandHelper(() => { (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog(); }); } }

        #endregion

        private Category _currentCategory;
        public Category CurrentCategory
        {
            get { return _currentCategory; }
            set { _currentCategory = value; }
        }
        private Category _selectCategory;
        public Category SelectCategory
        {
            get { return _selectCategory; }
            set { _selectCategory = value; }
        }

        private String _contentSearch = String.Empty;
        public String ContentSearch
        {
            get { return _contentSearch; }
            set { _contentSearch = value; OnPropertyChanged(); }
        }

        public SQLiteConnection DBServices = new DbHelper().GetConnection();


        public CategoryViewModel()
        {
            CurrentCategory = new Category();
            LoadCategory();
        }

        public void LoadCategory()
        {
            string query = "Select * From Category";
            var data = DBServices.Query<Category>(query);

            if (data != null)
                Categories = new ObservableCollection<Category>(data);
            else
                Categories?.Clear();
        }
        public void AddNewCategory() => (App.Current.MainWindow.DataContext as MainViewModel).OpenDiaLog(new CategoryAdd());

        public void EditCategory(Category category)
        {
            SelectCategory = category;
            (Application.Current.MainWindow.DataContext as MainViewModel).OpenDiaLog(new CategoryEdit());
        }
        public void DeleteCategory(Category category)
        {
            SelectCategory = category;
            (App.Current.MainWindow.DataContext as MainViewModel).OpenDiaLog(new CategoryDelete());
        }

        void SearchCategory()
        {
            try
            {
                if (String.IsNullOrEmpty(_contentSearch.Trim()))
                {
                    LoadCategory();
                    return;
                }
                string query = "Select * From Category Where CategoryName LIKE @contentSearch";
                var data = DBServices.Query<Category>(query, new { contentSearch = $@"%{ContentSearch}%" });
                if (data != null)
                    Categories = new ObservableCollection<Category>(data);
                else
                    Categories?.Clear();
            }catch (Exception ex)
            {
                MessageBox.Show("Error", ex.Message.ToString(), MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void Save()
        {
            try
            {
                string sql = SQLGenerator.CreateSQLInsertFromObject(CurrentCategory);
                DBServices.Execute(sql, CurrentCategory);

                string query = "SELECT MAX(Id) FROM Category";
                var Id = DBServices.ExecuteScalar<int>(query);

                CurrentCategory.Id = Id.ToString();

                Categories.Add(CurrentCategory);

                (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
                CurrentCategory = new Category();
            }catch (Exception ex)
            {
                MessageBox.Show("Error",ex.Message.ToString(),MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void Update()
        {
            try
            {
                string sql = SQLGenerator.CreateSQLUpdateFromObject(SelectCategory);
                DBServices.Execute(sql, SelectCategory);
                (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
            }catch(Exception ex)
            {
                MessageBox.Show("Error", ex.Message.ToString(), MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void Delete()
        {
            try
            {
                string sql = SQLGenerator.CreateSQLDeleteFromObject(SelectCategory);
                DBServices.Execute(sql, SelectCategory);
                Categories.Remove(SelectCategory);
                (App.Current.MainWindow.DataContext as MainViewModel).CloseDialog();
            }catch(Exception ex)
            {
                MessageBox.Show("Error", ex.Message.ToString(), MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
