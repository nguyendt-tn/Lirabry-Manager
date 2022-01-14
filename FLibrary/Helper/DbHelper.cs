using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Threading.Tasks;
using System.Data.SQLite;

namespace FLibrary.Helper
{
    public class DbHelper
    {
        private List<String> SQLTableList { get; set; } = new List<string>()
        {
             @"Create Table Account(
               Id INTEGER PRIMARY KEY AUTOINCREMENT,
               Name text,
               Email text UNIQUE,
               Password text)",
             @"Create Table Book(
               Id INTEGER PRIMARY KEY AUTOINCREMENT,
               Title text,
               Author text,
               Category text,
               Quantity text,
               State text,
               ImageUrl text)",
             @"Create Table Member(
               Id INTEGER PRIMARY KEY AUTOINCREMENT,
               Name text,
               Gender text,
               DateOfBirth text,
               Phone text,
               Address text
              )",
             @"Create Table Borrow(
               Id INTEGER PRIMARY KEY AUTOINCREMENT,
               MemberId text,
               MemberName text,
               BookId text,
               BookName text,
               BorrowDate text,
               DueDate text,
               Total text,
               IsReturn text
              )",
             @"Create Table Category(
                Id INTEGER PRIMARY KEY AUTOINCREMENT,
                CategoryName
              )",
             @"Create Table Author(
                Id INTEGER PRIMARY KEY AUTOINCREMENT,
                AuthorName
              )",
             @"Insert Into Account values('1','Admin','admin@gmail.com','$2a$11$qgOtPEG/CYQAz4wADTLF8.Ub/bGV2K91VqLxhfCRvpooeWDxvgH.q')"
        };


        private String DbFile { get; set; } = Path.Combine(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().CodeBase).Substring(6), "FLibrary.sqlite");

        private String ConnectString { get; set; } = "Data Source =" + Path.Combine(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().CodeBase).Substring(6), "FLibrary.sqlite");
        public bool IsExistsDb() => File.Exists(DbFile);
        public void CreateDatabase()
        {
            if (!IsExistsDb())
            {
                SQLiteConnection.CreateFile(DbFile);
                using (var connection = new SQLiteConnection(ConnectString))
                {
                    connection.Open();
                    SQLTableList?.ForEach((sql) => new SQLiteCommand(sql, connection).ExecuteNonQuery());
                    connection.Close();
                }
            }
        }
        public SQLiteConnection GetConnection()
        {
            return new SQLiteConnection(ConnectString);
        }

    }


}
