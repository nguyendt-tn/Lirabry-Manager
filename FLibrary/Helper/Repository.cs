using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SQLite;
using FLibrary.Helper.Base;
using Dapper;


namespace FLibrary.Helper
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : class
    {
        public SQLiteConnection DBServices { get; }

        public Repository(SQLiteConnection connection) => DBServices = connection;

        public int Delete(TEntity data)
        {
            string sql = SQLGenerator.CreateSQLDeleteFromObject(data);
            return DBServices.Execute(sql, data);
        }

        public TEntity FindById(string id)
        {
            var objName = typeof(TEntity).Name;
            string sql = SQLGenerator.CreateSQLFindIdFromObject(id, objName);
            return DBServices.Query<TEntity>(sql).FirstOrDefault();
        }

        public int Insert(TEntity data)
        {
            string sql = SQLGenerator.CreateSQLInsertFromObject(data);
            return DBServices.Execute(sql, data);
        }

        public IEnumerable<TEntity> SelectAll()
        {
            string sql = $@"Select * From {typeof(TEntity).Name}";
            return DBServices.Query<TEntity>(sql);
        }

        public int Update(TEntity data)
        {
            string sql = SQLGenerator.CreateSQLUpdateFromObject(data);
            return DBServices.Execute(sql, data);
        }
    }
}
