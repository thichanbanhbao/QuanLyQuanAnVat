using QuanLyQuanAnVat.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanAnVat.DAO
{
    public class BanAnDAO
    {
        private static BanAnDAO instance;
        
        public static BanAnDAO Instance 
        {
            get { if (instance == null) instance = new BanAnDAO(); return BanAnDAO.instance; }
            private set { BanAnDAO.instance = value;}
        }

        public static int TableWidth = 100;
        public static int TableHeight = 100;


        private BanAnDAO() { } 


        public List<Table> LoadDanhSachBanAn1() 
        { 
            List<Table> list = new List<Table>();

            DataTable data = DataProvider.Instance.ExcuteQuery("exec USP_GetTableList");
            foreach (DataRow item in data.Rows)
            {
                Table table = new Table(item);
                list.Add(table);
            }
            return list;
        }
    }
}
