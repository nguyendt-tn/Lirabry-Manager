using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using FLibrary.Helper;
using System.Data.SQLite;
using FLibrary.Model;
using Dapper;
using FLibrary.ViewModel.Base;
using System.Collections.ObjectModel;
using FLibrary.ViewModel.Home;
using FLibrary.View.Home;
using FLibrary.View.Book;
using MaterialDesignThemes.Wpf;
using FLibrary.ViewModel.Books;
using FLibrary.View.Member;
using FLibrary.ViewModel.Members;
using FLibrary.View.Borrow;
using FLibrary.ViewModel.Borrows;
using FLibrary.View.Category;
using FLibrary.View.Author;
using FLibrary.View.Account;

namespace FLibrary.ViewModel
{
    public class MainViewModel: BaseViewModel
    {

        public bool Isloaded = false;

        public WindowState WindowState
        {
            get { return _windowState; }
            set { _windowState = value; OnPropertyChanged(); }
        }
        
        private WindowState _windowState = WindowState.Normal;

        #region commands
        public ICommand LoadedWindowCMD { get; set; }
        public ICommand LogoutCMD { get; set; }


        public ICommand MinimizedWindowCMD { get { return new CommandHelper(MinimizedWindow); } }
        public ICommand CloseWindowCMD { get { return new CommandHelper(CloseWindow); } }
        public ICommand DragMoveCMD { get { return new CommandHelper<Window>((w) => w != null, ((p) => { try { p.DragMove(); } catch { } })); } }
        #endregion

        #region
        public HomeViewModel HomeViewModel { get; set; }
        public BookViewModel BookViewModel { get; set; }
        public MemberViewModel MemberViewModel { get; set; }
        public BorrowViewModel BorrowViewModel { get; set; }

        #endregion

        #region [Bindable Prop]
        private object _viewCurrent;
        private ItemNavigate _selectedView;




        public ItemNavigate SelectedView
        {
            get { return _selectedView; }
            set { _selectedView = value; OnPropertyChanged(); ChangeView(value); }
        }
        public object ViewCurrent
        {
            get { return _viewCurrent; }
            set { _viewCurrent = value; OnPropertyChanged(); }
        }
        #endregion

        #region [Collections]
        private ObservableCollection<ItemNavigate> _listItemNavigate;



        public ObservableCollection<ItemNavigate> ListItemNavigate
        {
            get { return _listItemNavigate; }
            set { _listItemNavigate = value; OnPropertyChanged(); }
        }
        #endregion

        private string _userName;
        public string UserName
        {
            get { return _userName; }
            set { _userName = value; OnPropertyChanged();}
        }

        public MainViewModel()
        {
            new DbHelper().CreateDatabase();
            LoadListItemNavigate();
            ChangeView(ListItemNavigate[0]);

            LoadedWindowCMD = new RelayCommand<Window>((p) => { return true; }, (p) =>
            {
                p.Hide();
                LoginWindow loginWindow = new LoginWindow();
                loginWindow.ShowDialog();
                var loginVM = loginWindow.DataContext as LoginViewModel;

                if (loginVM.IsLogin)
                {
                    p.Show();
                    UserName = loginVM.CurrentAccount.Name;
                }
                else
                {
                    p.Close();
                }

            });
            LogoutCMD = new RelayCommand<Window>((p) => { return true; }, (p) =>
            {
                p.Hide();
                LoginWindow loginWindow = new LoginWindow();
                loginWindow.ShowDialog();
                var loginVM = loginWindow.DataContext as LoginViewModel;

                if (loginVM.IsLogin)
                {
                    p.Show();
                }
                else
                {
                    p.Close();
                }
            });

        }

        public void LoadListItemNavigate()
        {
            ListItemNavigate = new ObservableCollection<ItemNavigate>()
            {
                new ItemNavigate()
                {
                     DisplayName = "HOME",
                     Icon = MaterialDesignThemes.Wpf.PackIconKind.HomeOutline,
                     IsSelected = true
                },
                new ItemNavigate()
                {
                     DisplayName = "BOOK",
                     Icon = MaterialDesignThemes.Wpf.PackIconKind.BookOutline,
                },
                new ItemNavigate()
                {
                    DisplayName = "CATEGORY",
                    Icon = MaterialDesignThemes.Wpf.PackIconKind.CategoryOutline,
                },
                  new ItemNavigate()
                {
                    DisplayName = "AUTHOR",
                    Icon = MaterialDesignThemes.Wpf.PackIconKind.Register,
                },
                new ItemNavigate()
                {
                    DisplayName="MEMBER",
                    Icon = MaterialDesignThemes.Wpf.PackIconKind.UserOutline,
                },
                new ItemNavigate()
                {
                    DisplayName="BORROW",
                    Icon = MaterialDesignThemes.Wpf.PackIconKind.BookArrowUpOutline
                },
                new ItemNavigate()
                {
                    DisplayName="ACCOUNT",
                    Icon = MaterialDesignThemes.Wpf.PackIconKind.AccountOutline,
                }
            };
        }
        public void ChangeView(ItemNavigate itemNavigate)
        {
            foreach (var item in ListItemNavigate)
                item.IsSelected = false;


            itemNavigate.IsSelected = true;


            switch (itemNavigate.DisplayName)
            {
                case "HOME":
                    ViewCurrent = new HomeUC();
                    break;
                case "BOOK":
                    ViewCurrent = new BookUC();
                    break;
                case "CATEGORY":
                    ViewCurrent = new CategoryUC();
                    break;
                case "AUTHOR":
                    ViewCurrent = new AuthorUC();
                    break;
                case "MEMBER":
                    ViewCurrent = new MemberUC();
                    break;
                case "BORROW":
                    ViewCurrent = new BorrowUC();
                    break;
                case "ACCOUNT":
                    ViewCurrent = new AccountUC();
                    break;
                default:
                    break;
            }
        }

        public void MinimizedWindow() => WindowState = WindowState.Minimized;
        public void CloseWindow() => Environment.Exit(0);

        public void OpenDiaLog(object content) => DialogHost.Show(content, "MainDialog");

        public void CloseDialog() => DialogHost.Close("MainDialog");
    }
}
