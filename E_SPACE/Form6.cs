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
    public partial class Form6 : Form
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-KNPLAV8\SQLEXPRESS;Initial Catalog=Own_Espace;Integrated Security=True");
        public Form6()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form2 x = new Form2();
            x.Show();
            this.Hide();
        }

        private void E_jets()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT jet_unique_code FROM E_jet", con);
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                comboBox1.Items.Clear();
                while (sdr.Read())
                {
                    comboBox1.Items.Add(sdr["jet_unique_code"].ToString());
                }
                sdr.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        private void ComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            {
                if (comboBox1.SelectedItem != null)
                {
                    string selectedCode = comboBox1.SelectedItem.ToString();
                    MessageBox.Show("Selected jet_unique_code : " + selectedCode);
                }
            }
        }

        private void Form6_Load(object sender, EventArgs e)
        {
            E_jets();
        }

        private void Button4_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "" || textBox2.Text == "" || textBox3.Text == "" || comboBox1.Text == "")
            {
                MessageBox.Show("Fillout the Empty Fields");
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into  trip (trip_id,launch_date,return_date,jet_unique_code)VALUES('" + textBox1.Text + "','" + textBox2.Text + "','" + textBox3.Text + "','" + comboBox1.Text + "')", con);
                cmd.ExecuteNonQuery();
                MessageBox.Show("insert succesful");

                con.Close();
            }
        }

        private void Button3_Click(object sender, EventArgs e)
        {
            if (DialogResult.Yes == MessageBox.Show("Do you want to update the data?", "confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Warning))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update trip set name='" + textBox2.Text + "',jet_unique_code='" + comboBox1.Text + "',return_date='" + textBox3.Text + "' where trip_id ='" + textBox1.Text + "'", con);
                cmd.ExecuteNonQuery();
                MessageBox.Show("update succesful");
                con.Close();
            }
        }

        private void Button2_Click(object sender, EventArgs e)
        {
            {
                if (DialogResult.Yes == MessageBox.Show("Do You Want Delete ?", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Warning))
                {
                    SqlCommand cmd = new SqlCommand("DELETE fROM trip where trip_id = '" + textBox1.Text + "'", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Existing trip Details Deleted Successfull", "trip Details Deleted", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);

                    con.Close();
                }

            }
        }

        private void Button6_Click(object sender, EventArgs e)
        {
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
           
            MessageBox.Show("clear successfully");
        }

        private void Button5_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM trip  WHERE trip_id ='" + textBox1.Text + "'", con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                textBox2.Text = sdr["launch_date"].ToString();
                textBox3.Text = sdr["return_date"].ToString();
              
                comboBox1.Text = sdr["jet_unique_code"].ToString();

            }
            else
            {
                MessageBox.Show("Data Not Found");
            }
            con.Close();
        }
    }
}
