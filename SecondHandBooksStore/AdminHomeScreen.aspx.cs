using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SecondHandBooksStore
{
    public partial class AdminHomeScreen : System.Web.UI.Page
    {
        SqlConnection sqlConnection;
        SqlCommand sqlCommand;
        protected void Page_Load(object sender, EventArgs e)
        {            
            btnViewBooks.BackColor = Color.Gray;
            btnViewOrders.BackColor = Color.Black;
            btnViewUsers.BackColor = Color.Black;
            
            pnlViewBooks.Visible = true;
            pnlViewOrders.Visible = false;
            pnlViewUsers.Visible = false;

            LoadImages();
        }

        protected void btnViewBooks_Click(object sender, EventArgs e)
        {
            btnViewBooks.BackColor = Color.Gray;
            btnViewOrders.BackColor = Color.Black;
            btnViewUsers.BackColor = Color.Black;

            pnlViewBooks.Visible = true;
            pnlViewOrders.Visible = false;
            pnlViewUsers.Visible = false;

            LoadImages();
        }

        protected void btnViewOrders_Click(object sender, EventArgs e)
        {
            btnViewBooks.BackColor = Color.Black;
            btnViewOrders.BackColor = Color.Gray;
            btnViewUsers.BackColor = Color.Black;

            pnlViewBooks.Visible = false;
            pnlViewOrders.Visible = true;
            pnlViewUsers.Visible = false;

            LoadOrders();
        }

        protected void btnViewUsers_Click(object sender, EventArgs e)
        {
            btnViewBooks.BackColor = Color.Black;
            btnViewOrders.BackColor = Color.Black;
            btnViewUsers.BackColor = Color.Gray;

            pnlViewBooks.Visible = false;
            pnlViewOrders.Visible = false;
            pnlViewUsers.Visible = true;

            LoadUsers();
        }

        private void LoadImages()
        {
            using(sqlConnection = new SqlConnection(DBConnectionString.connectionString))
            {
                String cmd = "select UserName, Books.* from Users inner join Books ON Users.Id = Books.BookId";
                sqlCommand = new SqlCommand(cmd,sqlConnection);
                sqlConnection.Open();
                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
                gridItems.DataSource = sqlDataReader;
                gridItems.DataBind();
            }
        }

        private void LoadOrders()
        {
            using (sqlConnection = new SqlConnection(DBConnectionString.connectionString))
            {
                String cmd = "select UserName,OrderId,BookName,ShippingAddress,Price, ModeOfPayment from Users inner join Books ON (Id = UserId) inner join Orders ON (Books.BookId = Orders.BookId)";
                sqlCommand = new SqlCommand(cmd, sqlConnection);
                sqlConnection.Open();
                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
                GridView1.DataSource = sqlDataReader;
                GridView1.DataBind();
            }
        }

        private void LoadUsers()
        {
            using (sqlConnection = new SqlConnection(DBConnectionString.connectionString))
            {
                String cmd = "select * from Users";
                sqlCommand = new SqlCommand(cmd, sqlConnection);
                sqlConnection.Open();
                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
                GridView2.DataSource = sqlDataReader;
                GridView2.DataBind();
            }
        }
    }
}