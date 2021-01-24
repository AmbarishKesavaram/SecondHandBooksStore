using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SecondHandBooksStore
{
    public partial class UserCartPage : System.Web.UI.Page
    {
        SqlConnection sqlConnection;
        SqlCommand sqlCommand;
        protected void Page_Load(object sender, EventArgs e)
        {
            helloLabel.Text = "Hello, " + Session["User"].ToString();
            int userId = (int)Convert.ToInt64(Session["Id"]);
            LoadCart(userId);

            if (gridItems.Rows.Count == 0)
            {
                btnBuyNow.Enabled = false;
            }
            else
            {
                btnBuyNow.Enabled = true;
            }                

        }

        private void LoadCart(int userId)
        { 
            
            using (sqlConnection = new SqlConnection(DBConnectionString.connectionString))
            {
                sqlCommand = new SqlCommand("select CartId,ImageData,AuthorName,Category,Language,BookCondition,Description,Price,cartStatus,Id from TempCart Left outer join Books ON TempCart.BookId = Books.BookId Left outer join Users ON TempCart.UserId =Users.Id where cartStatus!="+ 0 +" AND Users.Id = "+ userId, sqlConnection);
                sqlConnection.Open();
                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
                gridItems.DataSource = sqlDataReader;
                gridItems.DataBind();
            }
        }

        protected void gridItems_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "Delete")
            {
                int CartId = Convert.ToInt32(gridItems.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text);
                using (sqlConnection = new SqlConnection(DBConnectionString.connectionString))
                {
                    sqlCommand = new SqlCommand("update TempCart set cartStatus = 0 where CartId="+CartId, sqlConnection);
                    sqlConnection.Open();
                    sqlCommand.ExecuteNonQuery();
                    sqlConnection.Close();
                }
            }           
        }

        protected void gridItems_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userId = (int)Convert.ToInt64(Session["Id"]);
            LoadCart(userId);
            if (gridItems.Rows.Count == 0)
            {
                btnBuyNow.Enabled = false;
            }
            else
            {
                btnBuyNow.Enabled = true;
            }
        }

        protected void backButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserHomeScreen.aspx");
        }

        protected void btnBuyNow_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserPayment.aspx");
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Index.aspx");
        }
    }
}