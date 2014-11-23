<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Hackathon.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="home" runat="server">
        <asp:Button OnClick="Logout" runat="server" Text="Logout" />

        <div>
            <label id="username">You are logged in</label>
        </div>
    </form>
</body>
</html>
