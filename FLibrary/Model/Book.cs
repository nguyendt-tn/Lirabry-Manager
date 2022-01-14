using System;
using FLibrary.ViewModel.Base;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FLibrary.Model
{
    public class Book : BindableBase
    {
        private String _id;
        private string _title;
        private string _author;
        private string _category;
        private int _quantity;
        private string _state;
        private string _imageUrl;

        public String Id
        {
            get { return _id; }
            set { _id = value; OnPropertyChanged(); }
        }

        public String Title
        {
            get { return _title; }
            set { _title = value; OnPropertyChanged(); }
        }
        public String Author
        {
            get { return _author; }
            set { _author = value; OnPropertyChanged(); }
        }
        public String Category
        {
            get { return _category; }
            set { _category = value; OnPropertyChanged(); }
        }
        public int Quantity
        {
            get { return _quantity; }
            set { _quantity = value; OnPropertyChanged(); }
        }
        public String State
        {
            get { return _state; }
            set { _state = value; OnPropertyChanged(); }
        }
        public String ImageUrl
        {
            get { return _imageUrl; }
            set { _imageUrl = value; OnPropertyChanged(); }
        }
    }
}
