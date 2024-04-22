using QuanLyQuanAnVat.DAO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyQuanAnVat
{
    public partial class fAdmin : Form
    {
        public fAdmin()
        {
            InitializeComponent();
            loadDanhSachTaiKhoan();
            loadDanhSachMonAn();
        }
        void loadDanhSachMonAn()
        {
            string query = "select*from MonAn ";

            dtgvTaiKhoan.DataSource = DataProvider.Instance.ExcuteQuery(query);
        }
        void loadDanhSachTaiKhoan()
        {
            string query = "EXEC USP_GetAccountByUserName @tendangnhap ";
        
            dtgvTaiKhoan.DataSource = DataProvider.Instance.ExcuteQuery(query,new object[] {"2k3"});
        }
           
        private void fAdmin_Load(object sender, EventArgs e)
        {

        }
    }
}
