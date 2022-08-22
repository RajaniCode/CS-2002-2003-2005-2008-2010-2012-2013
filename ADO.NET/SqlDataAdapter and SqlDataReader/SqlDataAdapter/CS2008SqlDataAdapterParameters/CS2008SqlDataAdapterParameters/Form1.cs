﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

using System.Configuration;
using System.Data.SqlClient;

namespace CS2008SqlDataAdapterParameters
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        int ForwardCount;
        int BackwardCount;
        int CustomerID;

        string CustID;
        string FirstName;
        string LastName;
        string Country;

        string Event;

        private string ConnectionString
        {
            get
            {
                ConnectionStringSettingsCollection ConnectionStringSetting = ConfigurationManager.ConnectionStrings;
                return ConnectionStringSetting["ConnectionString"].ConnectionString;
            }
        }

        private DataSet GetDataSet()
        {
            DataSet DatSet = new DataSet();

            try
            {
                string SqlQuery = "SELECT * FROM dbo.Customer; ";

                using (SqlConnection ConnectionSql = new SqlConnection(ConnectionString))
                {
                    SqlDataAdapter DataAdapterSql = new SqlDataAdapter();                    
                    DataAdapterSql.SelectCommand = new SqlCommand(SqlQuery, ConnectionSql);
                    DataAdapterSql.Fill(DatSet, "Customer");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

            return DatSet;
        }

        private void Retrieve()
        {
            try
            {
                DataSet DatSet = new DataSet();
                string SqlQuery = "SELECT * FROM dbo.Customer ";
                SqlQuery += "WHERE ";
                SqlQuery += "FirstName = @FirstName; ";

                using (SqlConnection ConnectionSql = new SqlConnection(ConnectionString))
                {
                    SqlDataAdapter DataAdapterSql = new SqlDataAdapter();
                    DataAdapterSql.SelectCommand = new SqlCommand(SqlQuery, ConnectionSql);

                    DataAdapterSql.SelectCommand.Parameters.AddWithValue("@FirstName", textBox2.Text);
                    
                    //Fourth parameter is optional
                    //DataAdapterSql.SelectCommand.Parameters.Add("@FirstName", SqlDbType.NVarChar, int.MaxValue);
                    //DataAdapterSql.SelectCommand.Parameters["@FirstName"].Value = textBox2.Text;
                   
                    ConnectionSql.Open();
                    DataAdapterSql.SelectCommand.ExecuteNonQuery();
                    DataAdapterSql.Fill(DatSet, "Customer");
                }

                if (DatSet != null && DatSet.Tables != null && DatSet.Tables[0].Rows.Count > 0)
                {
                    BindData(DatSet);
                }
                else
                {
                    MessageBox.Show("First Name does not exist in database.");
                    textBox2.Text = string.Empty;
                }

                textBox2.ReadOnly = false;
                textBox3.ReadOnly = false;
                textBox4.ReadOnly = false;

                button1.Enabled = true;
                button2.Enabled = true;
                button3.Enabled = true;
                button4.Enabled = true;
                button5.Enabled = false;
                button6.Enabled = true;
                button7.Enabled = true;

                Event = "Save";
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void Add()
        {
            try
            {
                string SqlQuery = "INSERT INTO dbo.Customer ";
                SqlQuery += "( ";
                SqlQuery += "FirstName, ";
                SqlQuery += "LastName, ";
                SqlQuery += "Country ";
                SqlQuery += ") ";
                SqlQuery += "VALUES ";
                SqlQuery += "( ";
                SqlQuery += "@FirstName, ";
                SqlQuery += "@LastName, ";
                SqlQuery += "@Country ";
                SqlQuery += "); ";

                int RowsAffacted = 0;

                using (SqlConnection ConnectionSql = new SqlConnection(ConnectionString))
                {
                    SqlDataAdapter DataAdapterSql = new SqlDataAdapter();
                    DataAdapterSql.InsertCommand = new SqlCommand(SqlQuery, ConnectionSql);

                    DataAdapterSql.InsertCommand.Parameters.AddWithValue("@FirstName", textBox2.Text);
                    DataAdapterSql.InsertCommand.Parameters.AddWithValue("@LastName", textBox3.Text);
                    DataAdapterSql.InsertCommand.Parameters.AddWithValue("@Country", textBox4.Text);

                    //Fourth parameter is optional
                    //DataAdapterSql.InsertCommand.Parameters.Add("@FirstName", SqlDbType.NVarChar, int.MaxValue);
                    //DataAdapterSql.InsertCommand.Parameters.Add("@LastName", SqlDbType.NVarChar, int.MaxValue);
                    //DataAdapterSql.InsertCommand.Parameters.Add("@Country", SqlDbType.NVarChar, int.MaxValue);

                    //DataAdapterSql.InsertCommand.Parameters["@FirstName"].Value = textBox2.Text;
                    //DataAdapterSql.InsertCommand.Parameters["@LastName"].Value = textBox3.Text;
                    //DataAdapterSql.InsertCommand.Parameters["@Country"].Value = textBox4.Text;

                    ConnectionSql.Open();
                    RowsAffacted = DataAdapterSql.InsertCommand.ExecuteNonQuery();
                }

                MessageBox.Show("Rows Affected: " + RowsAffacted);

                button1.Enabled = true;
                button2.Enabled = true;
                button3.Enabled = true;
                button4.Enabled = true;
                button5.Enabled = false;
                button6.Enabled = true;
                button7.Enabled = true;

                ForwardCount = 0;

                BackwardCount = GetRowCount() - 1;

                Event = "Save";
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void Modify()
        {
            try
            {
                string SqlQuery = "UPDATE dbo.Customer ";
                SqlQuery += "SET ";
                SqlQuery += "FirstName = @FirstName , ";
                SqlQuery += "LastName = @LastName , ";
                SqlQuery += "Country = @Country ";
                SqlQuery += "WHERE ";
                SqlQuery += "CustomerID = @CustomerID; ";

                int RowsAffacted = 0;

                using (SqlConnection ConnectionSql = new SqlConnection(ConnectionString))
                {
                    SqlDataAdapter DataAdapterSql = new SqlDataAdapter();                    
                    DataAdapterSql.UpdateCommand = new SqlCommand(SqlQuery, ConnectionSql);

                    DataAdapterSql.UpdateCommand.Parameters.AddWithValue("@CustomerID", CustomerID);
                    DataAdapterSql.UpdateCommand.Parameters.AddWithValue("@FirstName", textBox2.Text);
                    DataAdapterSql.UpdateCommand.Parameters.AddWithValue("@LastName", textBox3.Text);
                    DataAdapterSql.UpdateCommand.Parameters.AddWithValue("@Country", textBox4.Text);

                    //Fourth parameter is optional
                    //DataAdapterSql.UpdateCommand.Parameters.Add("@CustomerID", SqlDbType.Int, int.MaxValue);
                    //DataAdapterSql.UpdateCommand.Parameters.Add("@FirstName", SqlDbType.NVarChar, int.MaxValue);
                    //DataAdapterSql.UpdateCommand.Parameters.Add("@LastName", SqlDbType.NVarChar, int.MaxValue);
                    //DataAdapterSql.UpdateCommand.Parameters.Add("@Country", SqlDbType.NVarChar, int.MaxValue);

                    //DataAdapterSql.UpdateCommand.Parameters["@CustomerID"].Value = CustomerID;
                    //DataAdapterSql.UpdateCommand.Parameters["@FirstName"].Value = textBox2.Text;
                    //DataAdapterSql.UpdateCommand.Parameters["@LastName"].Value = textBox3.Text;
                    //DataAdapterSql.UpdateCommand.Parameters["@Country"].Value = textBox4.Text;

                    ConnectionSql.Open();
                    RowsAffacted = DataAdapterSql.UpdateCommand.ExecuteNonQuery();
                }

                MessageBox.Show("Rows Affected: " + RowsAffacted);

                button1.Enabled = true;
                button2.Enabled = true;
                button3.Enabled = true;
                button4.Enabled = true;
                button5.Enabled = false;
                button6.Enabled = true;
                button7.Enabled = true;

                Event = "Save";
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void Delete()
        {
            try
            {
                string SqlQuery = "DELETE FROM dbo.Customer ";
                SqlQuery += "WHERE ";
                SqlQuery += "CustomerID = @CustomerID; ";

                int RowsAffacted = 0;

                using (SqlConnection ConnectionSql = new SqlConnection(ConnectionString))
                {
                    SqlDataAdapter DataAdapterSql = new SqlDataAdapter();                   
                    DataAdapterSql.DeleteCommand = new SqlCommand(SqlQuery, ConnectionSql);

                    DataAdapterSql.DeleteCommand.Parameters.AddWithValue("@CustomerID", CustomerID);
                    
                    //Fourth parameter is optional
                    //DataAdapterSql.DeleteCommand.Parameters.Add("@CustomerID", SqlDbType.Int, int.MaxValue);
                    //DataAdapterSql.DeleteCommand.Parameters["@CustomerID"].Value = CustomerID;
                                        
                    ConnectionSql.Open();
                    RowsAffacted = DataAdapterSql.DeleteCommand.ExecuteNonQuery();
                }

                MessageBox.Show("Rows Affected: " + RowsAffacted);

                button1.Enabled = true;
                button2.Enabled = true;

                if (GetRowCount() > 0)
                {
                    button3.Enabled = true;
                    button4.Enabled = true;
                    button6.Enabled = true;
                    button7.Enabled = true;
                }

                button5.Enabled = false;

                ForwardCount--;

                NavigateForward();

                Event = "Save";
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private int GetCurrentRowIndex(int customerID)
        {
            int CurrentRowIndex = 0;

            DataSet DatSet = GetDataSet();

            if (DatSet != null && DatSet.Tables != null && DatSet.Tables[0].Rows.Count > 0)
            {
                DataTable DatTable = DatSet.Tables[0];

                for (int Index = 0; Index < DatTable.Rows.Count; Index++)
                {
                    if (DatTable.Rows[Index]["CustomerID"] != DBNull.Value)
                    {
                        if (DatTable.Rows[Index]["CustomerID"].ToString() == customerID.ToString())
                        {
                            CurrentRowIndex = Index;
                        }
                    }
                }
            }
            return CurrentRowIndex;
        }
                
        private int GetRowCount()
        {
            return GetDataSet().Tables["Customer"].Rows.Count;
        }

        private int GetCurrentID()
        {
            int CurrentID = 0;

            DataSet DatSet = new DataSet();
            string SqlQuery = "SELECT IDENT_CURRENT('Customer'); ";

            using (SqlConnection ConnectionSql = new SqlConnection(ConnectionString))
            {
                SqlDataAdapter DataAdapterSql = new SqlDataAdapter();
                DataAdapterSql.SelectCommand = new SqlCommand(SqlQuery, ConnectionSql);
                DataAdapterSql.Fill(DatSet, "IDENT_CURRENT");
            }

            CurrentID = int.Parse(DatSet.Tables["IDENT_CURRENT"].Rows[0][0].ToString());

            return CurrentID;
        }

        private int GetNextID()
        {
            int NextID = 0;

            try
            {
                int CurrentID = GetCurrentID();

                DataSet DatSet = new DataSet();
                string SqlQuery = "SELECT IDENT_CURRENT('Customer') + IDENT_INCR('Customer'); ";

                using (SqlConnection ConnectionSql = new SqlConnection(ConnectionString))
                {
                    SqlDataAdapter DataAdapterSql = new SqlDataAdapter();
                    DataAdapterSql.SelectCommand = new SqlCommand(SqlQuery, ConnectionSql);
                    DataAdapterSql.Fill(DatSet, "IDENT_CURRENT_INCR");
                }

                NextID = int.Parse(DatSet.Tables["IDENT_CURRENT_INCR"].Rows[0][0].ToString());

                if (CurrentID == 1 && GetRowCount() == 0)
                {
                    NextID = CurrentID;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

            return NextID;
        }

        private void NavigateForward()
        {
            int RowCount = GetRowCount();

            if (ForwardCount == RowCount)
            {
                ForwardCount = 0;
            }

            if (ForwardCount < RowCount)
            {
                if (ForwardCount == -1)
                {
                    ForwardCount = RowCount - 1;
                }

                BindData(ForwardCount);
                ForwardCount++;
            }

            BackwardCount = ForwardCount - 1;
        }

        private void NavigateBackward()
        {
            int RowCount = GetRowCount();

            if (BackwardCount < RowCount)
            {
                BackwardCount--;

                if (BackwardCount == -1)
                {
                    BackwardCount = RowCount - 1;
                }

                BindData(BackwardCount);
            }

            ForwardCount = BackwardCount + 1;
        }

        private void BindData(int currentIndex)
        {
            DataSet DatSet = GetDataSet();

            DataTable DatTable = DatSet.Tables["Customer"];

            textBox1.Text = DatTable.Rows[currentIndex]["CustomerID"].ToString();
            textBox2.Text = DatTable.Rows[currentIndex]["FirstName"].ToString();
            textBox3.Text = DatTable.Rows[currentIndex]["LastName"].ToString();
            textBox4.Text = DatTable.Rows[currentIndex]["Country"].ToString();
        }

        private void BindData(DataSet datSet)
        {
            DataTable DatTable = datSet.Tables["Customer"];

            for (int Index = 0; Index < DatTable.Rows.Count; Index++)
            {
                textBox1.Text = DatTable.Rows[Index]["CustomerID"].ToString();
                textBox2.Text = DatTable.Rows[Index]["FirstName"].ToString();
                textBox3.Text = DatTable.Rows[Index]["LastName"].ToString();
                textBox4.Text = DatTable.Rows[Index]["Country"].ToString();
                MessageBox.Show("CustomerID: " + DatTable.Rows[Index]["CustomerID"].ToString());
            }

            int CurrentRowIndex = GetCurrentRowIndex(int.Parse(textBox1.Text));

            ForwardCount = CurrentRowIndex + 1;

            BackwardCount = CurrentRowIndex;
        }               
        
        private void Form1_Load(object sender, EventArgs e)
        {
            button1.Enabled = true;
            button2.Enabled = true;
            button3.Enabled = false;
            button4.Enabled = false;
            button5.Enabled = false;

            if (GetRowCount() > 0)
            {
                button6.Enabled = true;
                button7.Enabled = true;                
            }
            else
            {
                button6.Enabled = false;
                button7.Enabled = false;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            textBox1.Text = string.Empty;
            textBox2.Text = string.Empty;
            textBox3.Text = string.Empty;
            textBox4.Text = string.Empty;

            textBox3.ReadOnly = true;
            textBox4.ReadOnly = true;

            button1.Enabled = false;
            button2.Enabled = false;
            button3.Enabled = false;
            button4.Enabled = false;
            button5.Enabled = true;
            button6.Enabled = false;
            button7.Enabled = false;
          
            textBox2.Focus();

            Event = "Retrieve";
        }

        private void button2_Click(object sender, EventArgs e)
        {
            CustID = textBox1.Text;
            FirstName = textBox2.Text;
            LastName = textBox3.Text;
            Country = textBox4.Text;

            textBox1.Text = GetNextID().ToString();
            textBox2.Text = string.Empty;
            textBox3.Text = string.Empty;
            textBox4.Text = string.Empty;

            button1.Enabled = false;
            button2.Enabled = false;
            button3.Enabled = false;
            button4.Enabled = false;
            button5.Enabled = true;
            button6.Enabled = false;
            button7.Enabled = false;

            Event = "Add";
        }

        private void button3_Click(object sender, EventArgs e)
        {
            CustID = textBox1.Text;
            CustomerID = int.Parse(CustID);
            FirstName = textBox2.Text;
            LastName = textBox3.Text;
            Country = textBox4.Text;

            button1.Enabled = false;
            button2.Enabled = false;
            button3.Enabled = false;
            button4.Enabled = false;
            button5.Enabled = true;
            button6.Enabled = false;
            button7.Enabled = false;
           
            Event = "Modify";
        }

        private void button4_Click(object sender, EventArgs e)
        {
            CustID = textBox1.Text;
            CustomerID = int.Parse(CustID);
            FirstName = textBox2.Text;
            LastName = textBox3.Text;
            Country = textBox4.Text;
            
            textBox1.Text = string.Empty;
            textBox2.Text = string.Empty;
            textBox3.Text = string.Empty;
            textBox4.Text = string.Empty;

            button1.Enabled = false;
            button2.Enabled = false;
            button3.Enabled = false;
            button4.Enabled = false;
            button5.Enabled = true;
            button6.Enabled = false;
            button7.Enabled = false;
            
            Event = "Delete";
        }

        private void button5_Click(object sender, EventArgs e)
        {
            DialogResult ResultDialog = MessageBox.Show("Do you want to save?", "Message",
                                        MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            if (ResultDialog == DialogResult.No)
            {
                textBox2.ReadOnly = false;
                textBox3.ReadOnly = false;
                textBox4.ReadOnly = false;

                textBox1.Text = CustID;
                textBox2.Text = FirstName;
                textBox3.Text = LastName;
                textBox4.Text = Country;

                button1.Enabled = true;
                button2.Enabled = true;

                button5.Enabled = false;

                if (GetRowCount() > 0)
                {
                    button6.Enabled = true;
                    button7.Enabled = true;                  
                }
                else
                {
                    button6.Enabled = false;
                    button7.Enabled = false;
                }

                if (CustID != string.Empty)
                {
                    button3.Enabled = true;
                    button4.Enabled = true;
                }
                else
                {
                    button3.Enabled = false;
                    button4.Enabled = false;
                }

                return;
            }

            if (Event == "Retrieve")
            {
                Retrieve();
            }
            else if (Event == "Add")
            {
                Add();
            }
            else if (Event == "Modify" && GetRowCount() > 0)
            {
                Modify();
            }
            else if (Event == "Delete" && GetRowCount() > 0)
            {
                Delete();
            }            
        }

        private void button6_Click(object sender, EventArgs e)
        {
            NavigateForward();

            if (GetRowCount() > 0)
            {
                button3.Enabled = true;
                button4.Enabled = true;
            }
            else
            {
                button3.Enabled = false;
                button4.Enabled = false;
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            NavigateBackward();

            if (GetRowCount() > 0)
            {
                button3.Enabled = true;
                button4.Enabled = true;
            }
            else
            {
                button3.Enabled = false;
                button4.Enabled = false;
            }
        }
    }
}