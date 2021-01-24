<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserPayment.aspx.cs" Inherits="SecondHandBooksStore.UserPayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .rbl label{ margin-right:50px }
    </style>
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

                <asp:Button ID="BackButton" runat="server" Text="Back" OnClick="BackButton_Click" class="btn mr-3" />

                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <asp:LinkButton class="nav-link" OnClick="Unnamed_Click"  runat="server">LOGOUT<span class="sr-only">(current)</span></asp:LinkButton>
                    </li>
                </ul>
            </div>
        </nav>
        <div>
            <div style="height: 250px; background-size: cover; width: 100%; background-image: url('Images/bookCart.jpg');">
            </div>

            <div class="h2" style="text-align: center">Make Payment </div>
            <div class="h3" style="text-align: center">Payment Options</div>
            <div>
                <asp:RadioButtonList align="center" AutoPostBack="true" OnSelectedIndexChanged="rbPayment_SelectedIndexChanged" TextAlign="Right" runat="server" ID="rbPayment" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" style="margin-right: 20px" Text="Cash on Delivary" Value="Cash on Delivary"></asp:ListItem>
                    <asp:ListItem Text="Card Payment" Value="Card Payment"></asp:ListItem>
                </asp:RadioButtonList>
            </div>

            <div id="codDiv" runat="server">
                <asp:Panel ID="pnlSellBooks" Style="margin-left: 300px; margin-top: 20px; width: 100%; height: 100%; position: center; z-index: 0;" runat="server">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-7">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <label>Building No.:</label>
                                                <div class="form-group">
                                                    <asp:TextBox CssClass="form-control" ID="txtBuildingNo" runat="server" placeholder="Building"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-lg-7">
                                                <label>Street Address:</label>
                                                <div class="form-group">
                                                    <asp:TextBox CssClass="form-control" ID="txtStreet" runat="server" placeholder="Street"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-lg-2">
                                                <label>Apartment:</label>
                                                <div class="form-group">
                                                    <asp:TextBox CssClass="form-control" ID="txtAppt" runat="server" placeholder="Apt"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <label>City:</label>
                                                <div class="form-group">
                                                    <asp:TextBox CssClass="form-control" ID="txtCity" runat="server" placeholder="City"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <label>State/Province:</label>
                                                <div class="form-group">
                                                    <asp:TextBox CssClass="form-control" ID="txtState" runat="server" placeholder="State/Province"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <label>Pincode/Zipcode:</label>
                                                <div class="form-group">
                                                    <asp:TextBox CssClass="form-control" ID="txtPinCode" runat="server" placeholder="Pincode"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <label>Country:</label>
                                                <div class="form-group">
                                                    <asp:TextBox CssClass="form-control" ID="txtCountry" runat="server" placeholder="Country"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="card-footer">
                                        <div class="row">
                                            <div class="col-lg-5"></div>
                                            <div class="col-lg-2 bg-light">
                                                <div class="form-group">
                                                    <asp:Button class="btn btn-primary" OnClick="btnMakePayment_Click" ID="btnMakePayment" runat="server" Text="Order Book" />
                                                </div>
                                            </div>
                                            <div class="col-lg-5"></div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </asp:Panel>
            </div>

            <div runat="server" id="cardDiv">
                <asp:Label Text="Comming Soon!!" ID="lblSoon" Style="text-align: center; margin-left: 600px" ForeColor="Red" runat="server"></asp:Label>
            </div>

            </div>

       
    </form>

    <script src="Scripts/jquery-3.4.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
</body>
</html>
