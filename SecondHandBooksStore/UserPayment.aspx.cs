using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SecondHandBooksStore
{
    public partial class UserPayment : System.Web.UI.Page
    {
        SqlConnection sqlConnection;
        SqlCommand sqlCommand;
        protected void Page_Load(object sender, EventArgs e)
        {
           // helloLabel.Text = "Hello, " + Session["User"].ToString();
            cardDiv.Visible = false;
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserCartPage.aspx");
        }

        protected void rbPayment_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(rbPayment.SelectedIndex== 0)
            {
                cardDiv.Visible = false;
                codDiv.Visible = true;
                btnMakePayment.Enabled = true;
            }
            else if(rbPayment.SelectedIndex == 1)
            {
                cardDiv.Visible = true;
                codDiv.Visible = false;
                btnMakePayment.Enabled = false;
            }
        }

        protected void btnMakePayment_Click(object sender, EventArgs e)
        {
            updateCart();
            cardDiv.Visible = true;
            codDiv.Visible = false;
            btnMakePayment.Enabled = false;
            lblSoon.Text = "Orders Placed";

        }


        private void updateCart()
        {
            using (sqlConnection = new SqlConnection(DBConnectionString.connectionString))
            {
                String modeOfPayment = rbPayment.SelectedItem.Text.ToString();
                String add = txtBuildingNo.Text+" "+txtStreet.Text+", Apt:"+txtAppt.Text+", "+txtCity.Text+", "+txtState.Text+", "+txtCountry.Text+"  "+txtPinCode.Text;
                sqlCommand = new SqlCommand("select BookId,UserId,cartStatus from TempCart", sqlConnection);
                sqlConnection.Open();
                SqlDataAdapter sda = new SqlDataAdapter(sqlCommand);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                foreach (DataRow row in dt.Rows) {
                    if ((Boolean)row.ItemArray[2])
                    {
                        int cartBookId = (int)row.ItemArray[0];

                        sqlCommand = new SqlCommand("insert into Orders(BookId,ModeOfPayment,ShippingAddress) values (@BookId,@ModeOfPayment,@ShippingAddress)", sqlConnection);
                        
                        sqlCommand.Parameters.AddWithValue("BookId", cartBookId);
                        sqlCommand.Parameters.AddWithValue("ModeOfPayment", modeOfPayment);
                        sqlCommand.Parameters.AddWithValue("ShippingAddress", add.ToString());

                        sqlCommand.ExecuteNonQuery();


                        sqlCommand = new SqlCommand("update Books set Status = 'Sold' where BookId=" + cartBookId, sqlConnection);

                        sqlCommand.ExecuteNonQuery();              


                    }
                }

                sqlCommand = new SqlCommand("update TempCart set cartStatus = 0 where cartStatus = 1", sqlConnection);

                sqlCommand.ExecuteNonQuery();
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Index.aspx");
        }
    }
}