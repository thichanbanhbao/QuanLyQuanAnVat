using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanAnVat.DTO
{
    public class Table
    {
        public Table(int id, string ten, string trangthai) 
        { 
            this.ID = id;
            this.Ten = ten;
            this.Trangthai = trangthai;
        }

        public Table (DataRow row)
        {
            this.ID = (int)row["id"];
            this.Ten = row["ten"].ToString();
            this.Trangthai = row["trangthai"].ToString();
        }



        private string trangthai;


        public string Trangthai
        {
            get { return trangthai; }
          private  set { trangthai = value; }
        }


        
        private string ten;

        public string Ten
        { 
            get { return ten; }
            private set { ten = value; }
        }


        private int iD;

        public int ID
        {
            get { return iD; }
            private set { iD = value; }
        }
    }
}
