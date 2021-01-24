using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SecondHandBooksStore
{
    public partial class UserHomeScreen : System.Web.UI.Page
    {
        SqlConnection sqlConnection;
        SqlCommand sqlCommand;
        LinkButton lnkBt;

        protected void Page_Load(object sender, EventArgs e)
        {
            helloLabel.Text = "Hello, " + Session["User"].ToString();
            btnSellBooks.BackColor = Color.Gray;
            btnViewBooks.BackColor = Color.Black;
            btnMyBooks.BackColor = Color.Black;
            btnMyOrder.BackColor = Color.Black;
            pnlSellBooks.Visible = true;
            pnlViewBooks.Visible = false;
            pnlMyBooks.Visible = false;
            pnlMyOrders.Visible = false;

            if (IsPostBack)
            {
                string controlID = Page.Request.Params["__EVENTTARGET"];
                Control postbackControl = Page.FindControl(controlID);
                if (controlID.Contains("linkBtnCart"))
                {
                    btnSellBooks.BackColor = Color.Black;
                    btnViewBooks.BackColor = Color.Gray;
                    btnMyBooks.BackColor = Color.Black;
                    btnMyOrder.BackColor = Color.Black;
                    pnlSellBooks.Visible = false;
                    pnlViewBooks.Visible = true;
                    pnlMyBooks.Visible = false;
                    pnlMyOrders.Visible = false;
                }
            }
        }

        protected void btnSellBooks_Click(object sender, EventArgs e)
        {
            btnSellBooks.BackColor = Color.Gray;
            btnViewBooks.BackColor = Color.Black;
            btnMyBooks.BackColor = Color.Black;
            btnMyOrder.BackColor = Color.Black;
            pnlSellBooks.Visible = true;
            pnlViewBooks.Visible = false;
            pnlMyBooks.Visible = false;
            pnlMyOrders.Visible = false;
        }

        protected void btnViewBooks_Click(object sender, EventArgs e)
        {
            btnSellBooks.BackColor = Color.Black;
            btnViewBooks.BackColor = Color.Gray;
            btnMyBooks.BackColor = Color.Black;
            btnMyOrder.BackColor = Color.Black;
            pnlSellBooks.Visible = false;
            pnlViewBooks.Visible = true;
            pnlMyBooks.Visible = false;
            pnlMyOrders.Visible = false;
            LoadBooks();
        }

        protected void btnMyBooks_Click(object sender, EventArgs e)
        {
            btnSellBooks.BackColor = Color.Black;
            btnViewBooks.BackColor = Color.Black;
            btnMyBooks.BackColor = Color.Gray;
            btnMyOrder.BackColor = Color.Black;
            pnlSellBooks.Visible = false;
            pnlViewBooks.Visible = false;
            pnlMyBooks.Visible = true;
            pnlMyOrders.Visible = false;


            LoadImages();
        }

        protected void btnMyOrder_Click(object sender, EventArgs e)
        {
            btnSellBooks.BackColor = Color.Black;
            btnViewBooks.BackColor = Color.Black;
            btnMyBooks.BackColor = Color.Black;
            btnMyOrder.BackColor = Color.Gray;
            pnlSellBooks.Visible = false;
            pnlViewBooks.Visible = false;
            pnlMyBooks.Visible = false;
            pnlMyOrders.Visible = true;

            LoadOrders();
        }

        protected void btnSell_Click(object sender, EventArgs e)
        {
            int id =(int)Convert.ToInt64(Session["Id"]);
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string fileName = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(fileName);
            int fileSize = postedFile.ContentLength;

            if(fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".bmp" || fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png")
            {
                string cmd = "insert into Books(BookName,AuthorName,Category,Language,BookCondition,Price,Description,ImageName,ImageSize,ImageData, UserId) values(@BookName,@AuthorName,@Category,@Language,@BookCondition,@Price,@Description,@ImageName,@ImageSize,@ImageData, @UserId)";
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                
                using(sqlConnection = new SqlConnection(DBConnectionString.connectionString))
                {
                    sqlCommand = new SqlCommand(cmd, sqlConnection);
                    sqlCommand.Parameters.AddWithValue("BookName", txtBookName.Text);
                    sqlCommand.Parameters.AddWithValue("AuthorName", txtAuthorName.Text);
                    sqlCommand.Parameters.AddWithValue("Category", ddlCategory.SelectedValue);
                    sqlCommand.Parameters.AddWithValue("Language", ddlBookLanguage.SelectedValue);
                    sqlCommand.Parameters.AddWithValue("BookCondition", ddlBookCondition.SelectedValue);
                    sqlCommand.Parameters.AddWithValue("Price", txtPrice.Text);
                    sqlCommand.Parameters.AddWithValue("Description", txtDescription.Text);
                    sqlCommand.Parameters.AddWithValue("ImageName", fileName);
                    sqlCommand.Parameters.AddWithValue("ImageSize", fileSize);
                    sqlCommand.Parameters.AddWithValue("ImageData", bytes);
                    sqlCommand.Parameters.AddWithValue("UserId", id);

                    sqlConnection.Open();
                    sqlCommand.ExecuteNonQuery();
                    sqlConnection.Close();
                }               

            }
            else
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Please upload Images only..";
            }
        }

        private void LoadImages()
        {
            using(sqlConnection = new SqlConnection(DBConnectionString.connectionString))
            {
                sqlCommand = new SqlCommand("Select * from Books",sqlConnection);
                sqlConnection.Open();
                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
                gridItems.DataSource = sqlDataReader;
                gridItems.DataBind();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                int bookId = Convert.ToInt32(GridView1.Rows[Convert.ToInt32(e.CommandArgument)].Cells[1].Text);
                int id = (int)Convert.ToInt64(Session["Id"]);
                string cmd = "insert into TempCart(BookId,cartStatus,UserId) values (@BookId,@cartStatus,@userId)";

                using (sqlConnection = new SqlConnection(DBConnectionString.connectionString))
                {
                    sqlCommand = new SqlCommand("select BookId,UserId,cartStatus from TempCart", sqlConnection);
                    sqlConnection.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(sqlCommand);
                    DataTable dt = new DataTable();

                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        int cartBookId = (int)dt.Rows[0].ItemArray[0];
                        int cartUserId = (int)dt.Rows[0].ItemArray[1];
                        Boolean cartStatus = (Boolean)dt.Rows[0].ItemArray[2];
                        if ((cartBookId == bookId) && (cartUserId == id) && (cartStatus == true))
                        {
                            lnkBt = (LinkButton)e.CommandSource;
                            lnkBt.Enabled = false;
                        }
                        else
                        {
                            sqlCommand = new SqlCommand(cmd, sqlConnection);

                            sqlCommand.Parameters.AddWithValue("BookId", bookId);
                            sqlCommand.Parameters.AddWithValue("cartStatus", 1);
                            sqlCommand.Parameters.AddWithValue("userId", id);
                            sqlCommand.ExecuteNonQuery();
                            lnkBt = (LinkButton)e.CommandSource;
                            lnkBt.Enabled = false;
                        }
                    }
                    else
                    {
                        sqlCommand = new SqlCommand(cmd, sqlConnection);

                        sqlCommand.Parameters.AddWithValue("BookId", bookId);
                        sqlCommand.Parameters.AddWithValue("cartStatus", 1);
                        sqlCommand.Parameters.AddWithValue("userId", id);
                        sqlCommand.ExecuteNonQuery();
                    }
                    sqlConnection.Close();
                    lnkBt = (LinkButton)e.CommandSource;
                    lnkBt.Enabled = false;

                }
                
            }
        }
        private void LoadBooks()
        {
            using (sqlConnection = new SqlConnection(DBConnectionString.connectionString))
            {
                sqlCommand = new SqlCommand("Select * from Books where Status='Available'", sqlConnection);
                sqlConnection.Open();
                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
                GridView1.DataSource = sqlDataReader;
                GridView1.DataBind();
            }
        }

        private void LoadOrders()
        {
            int userId = (int)Convert.ToInt64(Session["Id"]);
            using (sqlConnection = new SqlConnection(DBConnectionString.connectionString))
            {
                sqlCommand = new SqlCommand("select OrderId, BookName, ShippingAddress, Price, ModeOfPayment from Orders inner join Books on (Orders.BookId = Books.BookId) where UserId='"+userId+"'", sqlConnection);
                sqlConnection.Open();
                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
                GridView2.DataSource = sqlDataReader;
                GridView2.DataBind();
            }
        }

        protected void cartButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("UserCartPage.aspx");
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Index.aspx");
        }
    }
}