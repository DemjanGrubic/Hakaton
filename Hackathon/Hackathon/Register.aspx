<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Hackathon.Register" %>

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
                    Registration
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
                <td>Retype password</td>
                <td><asp:TextBox TextMode="Password" ID="confirmPassword" runat="server" /></td>
                <td><asp:CompareValidator ErrorMessage="Passwords do not match." ForeColor="Red" ControlToCompare="password" ControlToValidate="confirmPassword" runat="server" /></td>
            </tr>

            <tr>
                <td>First name</td>
                <td><asp:TextBox ID="firstName" runat="server" /></td>
            </tr>

            <tr>
                <td>Last name</td>
                <td><asp:TextBox ID="lastName" runat="server" /></td>
            </tr>

            <tr>
                <td colspan="2"><asp:Label ID="failureMessage" runat="server"/></td>
            </tr>

            <tr>
                <td colspan="2"><asp:Button ID="register" runat="server" Text="Register" onClick="RegisterUser"/></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
