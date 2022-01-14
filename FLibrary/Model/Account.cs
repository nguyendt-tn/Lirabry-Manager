using System;
using FLibrary.ViewModel.Base;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FLibrary.Model
{
    public class Account : BindableBase
    {
        private String _id;
        private String _name;
        private String _email;
        private String _password;


        public String Id
        {
            get { return _id; }
            set { _id = value; OnPropertyChanged(); }
        }

        public String Name
        {
            get { return _name; }
            set { _name = value; OnPropertyChanged(); }
        }
        public string Email
        {
            get { return _email; }  
            set { _email = value; OnPropertyChanged();} 
        }

        public String Password
        {
            get { return _password; }
            set { _password = value; OnPropertyChanged(); }
        }

    }
}
