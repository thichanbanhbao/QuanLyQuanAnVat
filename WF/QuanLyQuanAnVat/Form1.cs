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
    public partial class fDangNhap : Form
    {
        public fDangNhap()
        {
            InitializeComponent();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click_1(object sender, EventArgs e)
        {

        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void fDangNhap_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show (" Bạn có thật sự muốn thoát chương trình!","Thông báo", MessageBoxButtons.OKCancel)!=System.Windows.Forms.DialogResult.OK)
            {
                e.Cancel = true;    
            }
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            string tendangnhap = txbTenDangNhap.Text;
            string matkhau = txbMatKhau.Text;
            if(DangNhap(tendangnhap,matkhau))
            { 
            fManHinhQuanLy f = new fManHinhQuanLy();
            this.Hide();
            f.ShowDialog();
            this.Show();
            }
            else
            {
                MessageBox.Show("Sai tên tài khoản hoặc mật khẩu");
            }
        }

        bool DangNhap(string tendangnhap , string matkhau)
        {
            return TaiKhoanDAO.Instance.DangNhap(tendangnhap,matkhau);
        }

        private void textMatKhau_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
