<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Hackathon.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="Form1" runat="server">
    <div>
        <table>
            <tr>
                <th colspan="3">
                    Login
                </th>
            </tr>
            <tr>
                <td>Email</td>
                <td><asp:TextBox ID="email" runat="server" /></td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" Display="Dynamic" ForeColor="Red"
                    ControlToValidate="email" runat="server" />
                    <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ControlToValidate="email" ForeColor="Red" ErrorMessage="Invalid email address." />
                </td>
            </tr>

            <tr>
                <td>Password</td>
                <td><asp:TextBox TextMode="Password" ID="password" runat="server" /></td>
                <td><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="password" runat="server" /></td>
            </tr>

            <tr>
                <td colspan="3"><asp:Label ID="failureMessage" runat="server"/></td>
            </tr>

            <tr>
                <td colspan="3"><asp:Button ID="login" Text="Login" runat="server" OnClick="ValidateUser" /></td>
            </tr>
        </table>

        <asp:Button CausesValidation="false" ID="Register1" Text="Register" OnClick="RegisterPage" runat="server"/>
    </div>
    </form>
</body>
</html>
