using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace WinFormsApp1
{
    public partial class Customer : Form
    {
        //Variables and objects declaration for sql connection.
        string path = @"Data Source=MSI\SQLEXPRESS;Initial Catalog=bespokedbikes;Integrated Security=True";
        SqlConnection connectDB;
        SqlCommand sqlCmd;
        SqlDataAdapter adapt;
        DataTable dataTable;

        //This method init components when user just enters 'customer' page.
        public Customer()
        {
            InitializeComponent();
            connectDB = new SqlConnection(path);
            display();
        }
        
        //Display method shows existing data in customer table.
        public void display()
        {
            try
            {
                dataTable = new DataTable();
                connectDB.Open();
                adapt = new SqlDataAdapter("select * from customer", connectDB);
                adapt.Fill(dataTable);
                dataGridView1.DataSource = dataTable;
                connectDB.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
