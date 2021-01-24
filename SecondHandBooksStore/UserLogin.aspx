<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="SecondHandBooksStore.UserLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 650px; width: 100%; background-image: url('Images/books_1.jpg');">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5 col-md-6 col-sm-8 col-xl-12 " style="margin: auto; float: initial; padding-top: 12%">
                        <div class="row userInfo">
                            <div class="panel panel-default ">
                                <div class="panel-heading">
                                    <h3 class="panel-title" style="text-align: center; font-weight: bold; color: white">Login to your Account</h3>
                                </div>
                                <div id="collapse1">
                                    <div class="panel-body">
                                        <fieldset>
                                            <div class="form-group">
                                                <div class="col-md-"></div>
                                                <label class="col-md-12 control-label" style="color: white">User ID</label>
                                                <div class="col-md-12">
                                                    <asp:TextBox ID="txtUserName" CssClass="form-control" placeholder="Enter User ID" runat="server"></asp:TextBox>
                                                </div>
                                                <label class="col-md-12 control-label" style="color: white">Password </label>
                                                <div class="col-md-12">
                                                    <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Enter Your Password" runat="server" TextMode="Password"></asp:TextBox>
                                                </div>

                                                <div class="col-lg-6">
                                                    <asp:Button ID="btnLogin" OnClick="btnLogin_Click" CssClass="btn btn-success" Text="LOGIN" runat="server" Style="margin-top: 5px; width: 100%" />

                                                </div>
                                                <div >
                                                    <asp:Label ID="lblError" Visible="false" runat="server" ></asp:Label>

                                                </div>
                                                <div class="panel-title" style="text-align: right">
                                                    <asp:LinkButton class="collapseWill" ID="RegisterLink" OnClientClick="this.style.display = 'none'" OnClick="RegisterLink_Click" Style="font-size: medium" Text="Register Now!!" runat="server" />
                                                </div>
                                            </div>
                                        </fieldset>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
