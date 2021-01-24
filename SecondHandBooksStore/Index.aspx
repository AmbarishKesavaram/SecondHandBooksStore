<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SecondHandBooksStore.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 40px; background-color: chocolate">
            <asp:Button ID="UserBtn" runat="server" Style="margin-left: 1000px; margin-top: 5px; border-radius: 12px" OnClick="UserBtn_Click" CssClass="btn-warning" Text="USER LOGIN" />
            <asp:Button ID="AdminBtn" runat="server" Style="margin-left: 10px; margin-top: 5px; border-radius: 12px" OnClick="AdminBtn_Click" CssClass="btn-warning" Text="ADMIN LOGIN" />
        </div>
        <div style="height: 650px; width: 100%; background-image: url('Images/books.jpg');">
            <h1 style="font-family: 'Comic Sans MS'; color: chocolate; padding: 100px; font-size: 100px">Welcome to Conestoga College Second Hand Book Store</h1>
        </div>
    </form>
    <script src="Scripts/jquery-3.4.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
</body>
</html>
