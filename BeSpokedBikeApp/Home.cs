using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WinFormsApp1
{
    public partial class Home : Form
    {
        Products product = new Products();
        Salesperson salesperson = new Salesperson();
        Customer customer = new Customer();
        Sales sales = new Sales();
        CommissionReport commissionReport = new CommissionReport();

        public Home()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            product.Show();
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void menuStrip1_ItemClicked_3(object sender, ToolStripItemClickedEventArgs e)
        {
            Environment.Exit(0);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            salesperson.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            customer.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            sales.Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            commissionReport.Show();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
