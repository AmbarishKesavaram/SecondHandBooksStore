<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserCartPage.aspx.cs" Inherits="SecondHandBooksStore.UserCartPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatiable" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="CSS/bootstrap.css" type="text/css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .hid {
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <nav class="navbar navbar-expand-lg navbar-light bg-light ">
            <a class="navbar-brand" href="#">Second Hand Book Resale</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarColor01">
                <div class="navbar-nav mr-auto"></div>
                <asp:Label ID="helloLabel" class="mr-3" runat="server"></asp:Label>

                <asp:Button ID="BackButton" runat="server" Text="Back" OnClick="backButton_Click" class="btn mr-3"  />

                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <asp:LinkButton class="nav-link" OnClick="Unnamed_Click" runat="server">LOGOUT<span class="sr-only">(current)</span></asp:LinkButton>
                    </li>
                </ul>
            </div>
        </nav>
        </div>
        <div style="height: 250px;background-size: cover; width: 100%; background-image: url('Images/bookCart.jpg');">
        </div>
        <div class="h2"style="text-align:center">My Cart</div>
        <div>
         <asp:Panel ID="pnlMyBooks" Style="margin-left: 50px; margin-top: 20px; width: 100%; height: 100%; position: center; z-index: 0;" runat="server">
            <div id="mainContainer" class="container">
                <div class="shadowBox">
                    <div class="page-container">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 ">
                                    <div class="table-responsive">
                                        <asp:GridView OnRowDeleting="gridItems_RowDeleting" OnRowCommand="gridItems_RowCommand" Width="100%" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="false" ID="gridItems" runat="server">

                                            <Columns>
                                                <asp:BoundField DataField="CartId" HeaderText="CartId" SortExpression="CartId" HeaderStyle-CssClass="bg-dark text-white hid" ItemStyle-CssClass="visible-lg hid" />
                                                <asp:TemplateField HeaderText="Item" HeaderStyle-CssClass="bg-dark text-white">
                                                    <ItemTemplate>
                                                        <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" ImageUrl='<%#"data:Image/png;base64," +Convert.ToBase64String((byte[])Eval("ImageData"))%>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" SortExpression="AuthorName" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                <asp:BoundField DataField="Language" HeaderText="Language" SortExpression="Language" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                <asp:BoundField DataField="BookCondition" HeaderText="BookCondition" SortExpression="BookCondition" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                <asp:BoundField DataField="CartStatus" HeaderText="CartStatus" SortExpression="CartStatus" HeaderStyle-CssClass="bg-dark text-white hid" ItemStyle-CssClass="visible-lg hid" />
                                                <asp:BoundField DataField="Id" HeaderText="UserId" SortExpression="Id" HeaderStyle-CssClass="bg-dark text-white hid" ItemStyle-CssClass="visible-lg hid" />
                                                <asp:TemplateField HeaderText="Action"  HeaderStyle-CssClass="bg-dark text-white">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="linkBtnDelete" Text="Delete" runat="server" CommandName="Delete" CommandArgument="<%# Container.DataItemIndex %>" />
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
        </div>
        <div>
            <asp:Button runat="server" OnClick="btnBuyNow_Click" ID="btnBuyNow" Text="Buy Now" class="btn-dark" />
        </div>
    </form>
    <script src="Scripts/jquery-3.4.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
</body>
</html>
