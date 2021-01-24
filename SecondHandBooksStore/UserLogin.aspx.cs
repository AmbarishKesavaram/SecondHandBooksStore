using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SecondHandBooksStore
{
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserRegistration.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            String query = "select * from Users where UserName = '" + txtUserName.Text + "' and Password = '" + txtPassword.Text + "'";
            SqlConnection sqlConnection = new SqlConnection(DBConnectionString.connectionString);
            SqlDataAdapter sda = new SqlDataAdapter(query,sqlConnection);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if(dt.Rows.Count > 0)
            {
                if(dt.Rows[0][3].ToString().Equals("user") || dt.Rows[0][3].ToString().Equals("User"))
                {
                    Session["Id"] =Convert.ToInt64( dt.Rows[0].ItemArray[0]);
                    Session["User"] = txtUserName.Text;
                    Response.Redirect("UserHomeScreen.aspx");
                    Session.RemoveAll();
                }
                else
                {                    
                    Response.Redirect("Index.aspx");
                }
            }
            else
            {
                lblError.Text = "Wrong user or password";
                lblError.Visible = true;
                lblError.ForeColor = Color.Red;
            }
        }
    }
}