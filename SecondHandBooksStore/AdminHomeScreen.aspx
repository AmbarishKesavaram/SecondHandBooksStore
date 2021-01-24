<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHomeScreen.aspx.cs" Inherits="SecondHandBooksStore.AdminHomeScreen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/bootstrap.css" type="text/css" rel="stylesheet" />
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

                
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <asp:LinkButton class="nav-link" runat="server">LOGOUT<span class="sr-only">(current)</span></asp:LinkButton>
                    </li>
                </ul>
            </div>
        </nav>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="collapse navbar-collapse d-flex" id="navbarColor02">
                <ul class="navbar-nav d-flex justify-content-between w-100 ">
                    
                    <li class="nav-item active ">
                        <asp:LinkButton ID="btnViewBooks" OnClick="btnViewBooks_Click" class="nav-link" runat="server">View Books</asp:LinkButton>
                    </li>
                    <li class="nav-item active">
                        <asp:LinkButton ID="btnViewOrders" OnClick="btnViewOrders_Click" class="nav-link" runat="server">View Orders</asp:LinkButton>
                    </li>
                    <li class="nav-item active">
                        <asp:LinkButton ID="btnViewUsers" OnClick="btnViewUsers_Click" class="nav-link" runat="server">View Users</asp:LinkButton>
                    </li>
                </ul>
            </div>
        </nav>
        
        <asp:Panel ID="pnlViewBooks" Style="margin-left: 50px; margin-top: 20px; width: 100%; height: 100%; position: center; z-index: 0;" runat="server">
            <div id="mainContainer" class="container">
                <div class="shadowBox">
                    <div class="page-container">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 ">
                                    <div class="table-responsive">
                                        <asp:GridView Width="100%" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="false" ID="gridItems" runat="server" >

                                            <Columns>
                                                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
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
        <asp:Panel ID="pnlViewOrders" Style="margin-left: 50px; margin-top: 20px; width: 100%; height: 100%; position: center; z-index: 0;" runat="server">
            <div id="mainContainer1" class="container">
                <div class="shadowBox">
                    <div class="page-container">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 ">
                                    <div class="table-responsive">
                                        <asp:GridView Width="100%" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="false" ID="GridView1" runat="server" >

                                            <Columns>
                                                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />                                                
                                                <asp:BoundField DataField="OrderId" HeaderText="OrderId" SortExpression="OrderId" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                <asp:BoundField DataField="BookName" HeaderText="BookName" SortExpression="BookName" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                <asp:BoundField DataField="ShippingAddress" HeaderText="ShippingAddress" SortExpression="ShippingAddress" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
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

        
        <asp:Panel ID="pnlViewUsers" Style="margin-left: 50px; margin-top: 20px; width: 100%; height: 100%; position: center; z-index: 0;" runat="server">
             <div id="mainContainer2" class="container">
                <div class="shadowBox">
                    <div class="page-container">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 ">
                                    <div class="table-responsive">
                                        <asp:GridView Width="100%" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="false" ID="GridView2" runat="server" >

                                            <Columns>
                                                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />                                                
                                                <asp:BoundField DataField="EMail" HeaderText="E-Mail" SortExpression="EMail" HeaderStyle-CssClass="bg-dark text-white" ItemStyle-CssClass="visible-lg" />
                                                                                             
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
    </form>
</body>
</html>
