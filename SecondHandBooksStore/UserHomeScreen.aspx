<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHomeScreen.aspx.cs" Inherits="SecondHandBooksStore.UserHomeScreen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatiable" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="CSS/bootstrap.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .hid {
            display: none;
        }
    </style>
    <!-- -->
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-light bg-light ">
            <a class="navbar-brand" href="#">Second Hand Book Resale</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarColor01">
                <div class="navbar-nav mr-auto"></div>
                <asp:Label ID="helloLabel" class="mr-3" runat="server"></asp:Label>

                <asp:ImageButton ID="cartButton" runat="server" ImageUrl="~/Images/shoppingCart.png" OnClick="cartButton_Click" class="mr-3" Height="27px" Width="25px" />

                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <asp:LinkButton class="nav-link" OnClick="Unnamed_Click" runat="server">LOGOUT<span class="sr-only">(current)</span></asp:LinkButton>
                    </li>
                </ul>
            </div>
        </nav>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="collapse navbar-collapse d-flex" id="navbarColor02">
                <ul class="navbar-nav d-flex justify-content-between w-100 ">
                    <li class="nav-item active ">
                        <asp:LinkButton ID="btnSellBooks" OnClick="btnSellBooks_Click" class="nav-link " runat="server">Sell Books</asp:LinkButton>
                    </li>
                    <li class="nav-item active ">
                        <asp:LinkButton ID="btnMyBooks" OnClick="btnMyBooks_Click" class="nav-link" runat="server">My Books</asp:LinkButton>
                    </li>
                    <li class="nav-item active">
                        <asp:LinkButton ID="btnViewBooks" OnClick="btnViewBooks_Click" class="nav-link" runat="server">View Books</asp:LinkButton>
                    </li>
                    <li class="nav-item active">
                        <asp:LinkButton ID="btnMyOrder" OnClick="btnMyOrder_Click" class="nav-link" runat="server">My Orders</asp:LinkButton>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Sell Books -->
        <asp:Panel ID="pnlSellBooks" Style="margin-left: 300px; margin-top: 20px; width: 100%; height: 100%; position: center; z-index: 0;" runat="server">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-7">
                        <div class="card">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col bg-light">
                                        <label>Sell Books</label>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">

                                <div class="row">
                                    <div class="col-lg-6">
                                        <label>Book Name:</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtBookName" runat="server" placeholder="Enter Book Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <label>Author Name:</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtAuthorName" runat="server" placeholder="Enter Author Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <label>Category:</label>
                                        <div class="form-group">
                                            <asp:DropDownList class="form-control" ID="ddlCategory" runat="server">
                                                <asp:ListItem Text="-- Select Category --" Value="-- Select Category --" />
                                                <asp:ListItem Text="Science" Value="Science" />
                                                <asp:ListItem Text="Technology" Value="Technology" />
                                                <asp:ListItem Text="Action and Adventure" Value="Action and Adventure" />
                                                <asp:ListItem Text="Drama" Value="Drama" />
                                                <asp:ListItem Text="Romance" Value="Romance" />
                                                <asp:ListItem Text="Mystery" Value="Mystery" />
                                                <asp:ListItem Text="Horror" Value="Horror" />
                                                <asp:ListItem Text="Health" Value="Health" />
                                                <asp:ListItem Text="Travel" Value="Travel" />
                                                <asp:ListItem Text="Kids" Value="Kids" />
                                                <asp:ListItem Text="History" Value="History" />
                                                <asp:ListItem Text="CookBooks" Value="CookBooks" />
                                                <asp:ListItem Text="Math" Value="Math" />
                                                <asp:ListItem Text="Autobiography" Value="Autobiography" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <label>Book Language:</label>
                                        <div class="form-group">
                                            <asp:DropDownList class="form-control" ID="ddlBookLanguage" runat="server">
                                                <asp:ListItem Text="-- Select Book Language --" Value="-- Select Book Language --" />
                                                <asp:ListItem Text="English" Value="English" />
                                                <asp:ListItem Text="French" Value="French" />
                                                <asp:ListItem Text="Spanish" Value="Spanish" />
                                                <asp:ListItem Text="Hindi" Value="Hindi" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col-lg-6">
                                        <label>Book Condition:</label>
                                        <div class="form-group">
                                            <asp:DropDownList class="form-control" ID="ddlBookCondition" runat="server">
                                                <asp:ListItem Text="-- Select Book Condition --" Value="-- Select Book Condition --" />
                                                <asp:ListItem Text="New" Value="New" />
                                                <asp:ListItem Text="Good" Value="Good" />
                                                <asp:ListItem Text="Fair" Value="Fair" />
                                                <asp:ListItem Text="Poor" Value="Poor" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <label>Upload Image:</label>
                                        <div class="form-group">
                                            <asp:FileUpload runat="server" ID="FileUpload1" />
                                            <asp:Label runat="server" ID="lblMsg" Visible="false" ForeColor="Red"></asp:Label>
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <label>Price:</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtPrice" runat="server" placeholder="Price"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" ControlToValidate="txtPrice" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="^[1-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <label>Description:</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtDescription" runat="server" placeholder="Description" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>


                            </div>
                            <div class="card-footer">
                                <div class="row">
                                    <div class="col-lg-10"></div>
                                    <div class="col-lg-2 bg-light">
                                        <div class="form-group">
                                            <asp:Button class="btn btn-primary" OnClick="btnSell_Click" ID="btnSell" runat="server" Text="Submit" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </asp:Panel>

        <!--My Books-->
        <asp:Panel ID="pnlMyBooks" Style="margin-left: 50px; margin-top: 20px; width: 100%; height: 100%; position: center; z-index: 0;" runat="server">
            <div id="mainContainer" class="container">
                <div class="shadowBox">
                    <div class="page-container">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 ">
                                    <div class="table-responsive">
                                        <asp:GridView Width="100%" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="false" ID="gridItems" runat="server">

                                            <Columns>
                                                <asp:TemplateField HeaderText="Image" HeaderStyle-CssClass="bg-dark text-white">
                                                    <ItemTemplate>
                                                        <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" ImageUrl='<%#"data:Image/png;base64," +Convert.ToBase64String((byte[])Eval("ImageData"))%>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="BookName" HeaderText="BookName" SortExpression="BookName" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" SortExpression="AuthorName" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                <asp:BoundField DataField="Language" HeaderText="Language" SortExpression="Language" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                <asp:BoundField DataField="BookCondition" HeaderText="BookCondition" SortExpression="BookCondition" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <!-- View Books -->
        <asp:Panel ID="pnlViewBooks" Style="margin-left: 50px; margin-top: 20px; width: 100%; height: 100%; position: center; z-index: 0;" runat="server">
            <div class="container">
                <div class="shadowBox">
                    <div class="page-container">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 ">
                                    <div class="table-responsive">
                                        <asp:GridView Width="100%" OnRowCommand="GridView1_RowCommand" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="false" ID="GridView1" runat="server">

                                            <Columns>
                                                <asp:TemplateField HeaderText="Image" HeaderStyle-CssClass="bg-dark text-white">
                                                    <ItemTemplate>
                                                        <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" ImageUrl='<%#"data:Image/png;base64," +Convert.ToBase64String((byte[])Eval("ImageData"))%>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:BoundField DataField="BookId" HeaderText="BookId" SortExpression="BookId" HeaderStyle-CssClass="bg-dark text-white hid" ItemStyle-CssClass="visible-lg hid" />
                                                <asp:BoundField DataField="BookName" HeaderText="BookName" SortExpression="BookName" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                <asp:TemplateField HeaderText="" HeaderStyle-CssClass="bg-dark text-white">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="linkBtnCart" Text="Add To Cart" runat="server" CommandName="AddToCart" CommandArgument="<%# Container.DataItemIndex %>" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <!--My Orders-->

        <asp:Panel ID="pnlMyOrders" Style="margin-left: 50px; margin-top: 20px; width: 100%; height: 100%; position: center; z-index: 0;" runat="server">
            <div class="container">
                <div class="shadowBox">
                    <div class="page-container">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 ">
                                    <div class="table-responsive">
                                        <asp:GridView Width="100%" OnRowCommand="GridView1_RowCommand" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="false" ID="GridView2" runat="server">

                                            <Columns>                                                
                                                <asp:BoundField DataField="OrderId" HeaderText="OrderId" SortExpression="OrderId" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                <asp:BoundField DataField="BookName" HeaderText="BookName" SortExpression="BookName" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                <asp:BoundField DataField="ShippingAddress" HeaderText="Shipping Address" SortExpression="ShippingAddress" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                <asp:BoundField DataField="Price" HeaderText="Total Amount" SortExpression="Price" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                <asp:BoundField DataField="ModeOfPayment" HeaderText="Mode Of Payment" SortExpression="ModeOfPayment" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />                                                
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </asp:Panel>
        <div>
        </div>
    </form>
    <script src="Scripts/jquery-3.4.1.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
