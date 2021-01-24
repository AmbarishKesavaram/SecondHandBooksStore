<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="SecondHandBooksStore.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 650px; width: 100%; background-image: url('Images/admin.jpg');">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5 col-md-6 col-sm-8 col-xl-12 " style="margin: auto; float: initial; padding-top: 12%">
                        <div class="row userInfo">
                            <div class="panel panel-default ">
                                <div class="panel-heading">
                                    <h3 class="panel-title" style="text-align: center; font-weight: bold; color: white">Login As Admin</h3>
                                </div>
                                <div id="collapse1">
                                    <div class="panel-body">
                                        <fieldset>
                                            <div class="form-group">
                                                <div class="col-md-"></div>
                                                <label class="col-md-12 control-label" style="color: white">Admin ID</label>
                                                <div class="col-md-12">
                                                    <asp:TextBox ID="txtUserName" CssClass="form-control" placeholder="Enter User ID" runat="server"></asp:TextBox>
                                                </div>
                                                <label class="col-md-12 control-label" style="color: white">Password </label>
                                                <div class="col-md-12">
                                                    <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Enter Your Password" runat="server" TextMode="Password"></asp:TextBox>
                                                </div>

                                                <div class="col-lg-6">
                                                    <asp:Button ID="btnLogin" CssClass="btn btn-success" OnClick="btnLogin_Click" Text="ADMIN LOGIN" runat="server" Style="margin-top: 5px; width: auto" />

                                                </div>
                                                <div>
                                                    <asp:Label ID="lblError" Visible="false" runat="server" ></asp:Label>
                                                </div>

                                            </div>
                                        </fieldset>

                                    </div>
                                </div>

                                < 
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
