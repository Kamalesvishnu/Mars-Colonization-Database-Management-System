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

namespace E_SPACE
{
    public partial class Form1 : Form
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-KNPLAV8\SQLEXPRESS;Initial Catalog=Own_Espace;Integrated Security=True");
        public Form1()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            String UserName = textBox1.Text;
            String Password = textBox2.Text;
            if (ValidateLogin(UserName, Password))
            {
                MessageBox.Show("Login Succesfully");
                Form2 x = new Form2();
                x.Show();
                this.Hide();

            }
            else
            {
                MessageBox.Show("Invaild username or password.");

            }
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            textBox1.Clear();
            textBox2.Clear();

        }
        private bool ValidateLogin(string username, string password)
        {
            if ((username == "vishnu" && password == "0326"))
            {
                return true;
            }
            return false;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            
            DialogResult result = MessageBox.Show("Do you want to exit this page?", "Confirm Exit", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            
            if (result == DialogResult.Yes)
            {
               
                Application.Exit();

            }
            
        }


        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}

