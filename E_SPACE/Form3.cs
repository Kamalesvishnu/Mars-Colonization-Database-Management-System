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
    public partial class Form3 : Form
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-KNPLAV8\SQLEXPRESS;Initial Catalog=Own_Espace;Integrated Security=True");
        public Form3()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form2 x = new Form2();
            x.Show();
            this.Hide();
        }

        private void Form3_Load(object sender, EventArgs e)
        {
    
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "" || textBox2.Text == "" || textBox3.Text == "")
            {
                MessageBox.Show("fillout the empty fields");
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand ("insert into house (Colony_lot_number,Num_of_rooms,Square_feet) values ('" + textBox1.Text + "','" + textBox2.Text + "','" + textBox3.Text + "')", con);
                cmd.ExecuteNonQuery();
                MessageBox.Show("saved success");
                con.Close();


            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (DialogResult.Yes == MessageBox.Show("Do you want to update the data ?", "conformation", MessageBoxButtons.YesNo, MessageBoxIcon.Warning))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Update house set Num_of_rooms='" + textBox2.Text + "',Square_feet='" + textBox3.Text + "' where Colony_lot_number ='" + textBox1.Text + "'", con);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Update successful");
                //clearmethod();
                //gridviewupdate();

                con.Close();


            }
        }
            private void button4_Click(object sender, EventArgs e)
        {
            if (DialogResult.Yes == MessageBox.Show("Do You Want Delete ?", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Warning))
            {
                SqlCommand cmd = new SqlCommand("DELETE fROM house  where Colony_lot_number like '" + textBox1.Text + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                MessageBox.Show(" house Details Deleted Successfull", "Details Deleted", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);

                con.Close();
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            MessageBox.Show("clear successfully");
        }

        private void button6_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select* from house  where Colony_lot_number like'" + textBox4.Text + "'", con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                textBox2.Text = sdr["Num_of_rooms"].ToString();
                textBox3.Text = sdr["Square_feet"].ToString();
                MessageBox.Show("data found");
            }
            else
            {
                MessageBox.Show("data not found");
            }
            con.Close();
        }
    }

}
