using FLibrary.ViewModel.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FLibrary.Model
{
    public class Author: BindableBase
    {
        private string _id;
        private string _authorName;

        public string Id
        {
            get { return _id; }
            set { _id = value; OnPropertyChanged(); }
        }
        public string AuthorName
        {
            get { return _authorName; } 
            set { _authorName = value; OnPropertyChanged(); }   
        }
    }
}
