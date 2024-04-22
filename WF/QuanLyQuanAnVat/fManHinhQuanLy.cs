using QuanLyQuanAnVat.DAO;
using QuanLyQuanAnVat.DTO;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;

namespace QuanLyQuanAnVat
{
    public partial class fManHinhQuanLy : Form
    {
        public fManHinhQuanLy()
        {
            InitializeComponent();
            loadDanhSachBan();
        }

        void loadDanhSachBan()
        {
         List<Table> list = BanAnDAO.Instance.LoadDanhSachBanAn1();

            foreach (Table item in list)
            {
                Button btn = new Button() { Width = BanAnDAO.TableWidth,Height = BanAnDAO.TableHeight};
                btn.Text = item.Ten + Environment.NewLine + item.Trangthai;
                switch(item.Trangthai)
                {
                    case "Trống":
                        btn.BackColor = Color.Aqua;
                        break;
                    default:
                        btn.BackColor = Color.Pink; 
                        break;
                }
                flpBanAn.Controls.Add(btn);
            }

        }


        #region Event
        private void đăngXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void thôngTinCáNhânToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fThongTinCaNhan f = new fThongTinCaNhan();
            f.ShowDialog();
        }
        
        private void adminToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fAdmin f = new fAdmin();
            f.ShowDialog();
        }
        #endregion
    }
}
 