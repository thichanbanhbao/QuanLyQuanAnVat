using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanAnVat.DAO
{
    public class TaiKhoanDAO
    {
        private static TaiKhoanDAO instance;

        public static TaiKhoanDAO Instance
        {
            get
            { if (instance == null) instance = new TaiKhoanDAO(); return instance; }
            private set { instance = value; }
        }
        private TaiKhoanDAO() { }
        public bool DangNhap(string tendangnhap, string matkhau)
        {
            string query = "USP_Dangnhap @tendangnhap , @matkhau";
            DataTable result = DataProvider.Instance.ExcuteQuery(query, new object[] { tendangnhap, matkhau });
            return result.Rows.Count > 0;
        }
    }
}