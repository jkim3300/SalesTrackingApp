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
    public partial class CommissionReport : Form
    {
        string path = @"Data Source=MSI\SQLEXPRESS;Initial Catalog=bespokedbikes;Integrated Security=True";
        SqlConnection connectDB;
        //Display table from the database to datagrid
        SqlDataAdapter adapt, adapt_1, adapt_2, adapt_3;
        DataTable dataTable, dataTable_1, dataTable_2, dataTable_3;

        private void button2_Click(object sender, EventArgs e)
        {
            if (txtSalespersonID.Text == "")
            {
                MessageBox.Show("Please fill all the boxes.");
            }
            else
            {
                //Update data to data table called
                try
                {
                    dataTable = new DataTable();
                    connectDB.Open();
                    adapt = new SqlDataAdapter("select Year(SalesDate) as Year, DATEPART(Quarter,SalesDate) as Quarter, " +
                        "sum((Sales_Price - Purchase_Price) * Commission_Percentage) as Commission_By_Term from sales, products where " +
                        "SalespersonID = '" + txtSalespersonID.Text.ToString() + "' group by Year(SalesDate), DATEPART(QUARTER, SalesDate); ", connectDB);
                    adapt.Fill(dataTable);
                    dataGridView1.DataSource = dataTable;
                    connectDB.Close();
                    MessageBox.Show("Report Table Generated!");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }
        //Inital display of the page.
        public CommissionReport()
        {
            InitializeComponent();
            connectDB = new SqlConnection(path);
            display();
        }
        
        //This method filters data by users input of 'salesperson' by ID input.
        //Once the input is passed through the box, it filters and posts requested data.
        private void button1_Click(object sender, EventArgs e)
        {
            if (txtSalespersonID.Text == "")
            {
                MessageBox.Show("Please fill all the boxes.");
            }
            else
            {
                //Update data to data table called
                try
                {
                    dataTable = new DataTable();
                    dataTable_1 = new DataTable();
                    dataTable_2 = new DataTable();
                    dataTable_3 = new DataTable();
                    connectDB.Open();
                    adapt = new SqlDataAdapter("select Year(SalesDate) as Year, MONTH(SalesDate) as" +
                        " Month, sum((Sales_Price - Purchase_Price) * Commission_Percentage) as " +
                        "Commission_By_Term from sales, products where SalespersonID = '"+txtSalespersonID.Text.ToString()+"' " +
                        "group by Year(SalesDate), MONTH(SalesDate)", connectDB);
                    adapt_1 = new SqlDataAdapter("select COUNT(SalespersonID) as total_sale from sales where SalespersonID = '" + txtSalespersonID.Text.ToString() + "'", connectDB);
                    adapt_2 = new SqlDataAdapter("select sum((Sales_Price - Purchase_Price) * Commission_Percentage) as total_commission from sales, products where SalespersonID ='" 
                        + txtSalespersonID.Text.ToString() + "'", connectDB);
                    adapt_3 = new SqlDataAdapter("select sum(Sales_Price - Purchase_Price) as total_price from sales, products where SalespersonID " +
                        "= '" + txtSalespersonID.Text.ToString() + "'", connectDB);
                    adapt.Fill(dataTable);
                    adapt_1.Fill(dataTable_1);
                    adapt_2.Fill(dataTable_2);
                    adapt_3.Fill(dataTable_3);
                    dataGridView1.DataSource = dataTable;
                    dataGridView2.DataSource = dataTable_1;
                    dataGridView3.DataSource = dataTable_2;
                    dataGridView4.DataSource = dataTable_3;
                    connectDB.Close();
                    MessageBox.Show("Report Table Generated!");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }
        //Clear method that clears textbox after the user update the product by clicking the button
        public void clear()
        {
            txtSalespersonID.Text = "";
        }

        //Display method shows data table from the DB to data grid on the GUI
        public void display()
        {
            try
            {
                dataTable = new DataTable();
                connectDB.Open();
                adapt = new SqlDataAdapter("select Year(SalesDate) as Year, MONTH(SalesDate) as Month, " +
                    "sum((Sales_Price - Purchase_Price) * Commission_Percentage) as Commission_By_Term from sales, " +
                    "products group by Year(SalesDate), MONTH(SalesDate);", connectDB);
                adapt.Fill(dataTable);
                dataGridView1.DataSource = dataTable;
                connectDB.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        //For refreshing purpose.
        private void button3_Click(object sender, EventArgs e)
        {
            clear();
            display();
        }
    }
}
