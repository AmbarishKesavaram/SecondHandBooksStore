using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SecondHandBooksStore
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection = new SqlConnection(DBConnectionString.connectionString);
            sqlConnection.Open();
            SqlCommand cmd = new SqlCommand("insert into Users(UserName,Password,Email) values (@UserName, @Password, @Email)", sqlConnection);
            cmd.Parameters.AddWithValue("UserName", txtUserName.Text);
            cmd.Parameters.AddWithValue("Password", txtPassword.Text);
            cmd.Parameters.AddWithValue("Email", txtEMail.Text);
            cmd.ExecuteNonQuery();
            txtUserName.Text = "";
            txtPassword.Text = "";
            txtEMail.Text = "";
            Response.Write("<script>alert('Registration Successful!!')</script>");
            cmd.Dispose();
            sqlConnection.Close();

            Response.Redirect("UserLogin.aspx");

        }
    }
}