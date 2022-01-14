using FLibrary.ViewModel.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FLibrary.Model
{
    public class Member : BindableBase
    {
        private string _id; 
        private String _name;
        private String _gender;
        private DateTime _dateOfBirth;
        private String _phone;
        private String _address;

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

        public String Gender
        {
            get { return _gender; }
            set { _gender = value; OnPropertyChanged(); }
        }
        public DateTime DateOfBirth
        {
            get { return _dateOfBirth; }
            set { _dateOfBirth = value; OnPropertyChanged(); }
        }

        public String Phone
        {
            get { return _phone; }
            set { _phone = value; OnPropertyChanged(); }
        }

        public String Address
        {
            get { return _address; }
            set { _address = value; OnPropertyChanged(); }
        }

    }
}
