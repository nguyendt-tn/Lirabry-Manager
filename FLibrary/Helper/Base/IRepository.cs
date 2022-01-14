using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FLibrary.Helper.Base
{
    public interface IRepository<T>
    {
        IEnumerable<T> SelectAll();
        T FindById(String id);
        int Insert(T data);
        int Update(T data);
        int Delete(T data);
    }
}
