<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostProblem.aspx.cs" Inherits="Hackathon.PostProblem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>Date of problem</td>
                <td><asp:TextBox ID="beginTime" Text="10.10.2015." runat="server" /></td>
                <td><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="beginTime" runat="server" /></td>
            </tr>

            <tr>
                <td>Time of problem</td>
                <td><asp:TextBox ID="time" Text="18:00" runat="server" /></td>
                <td><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="time" runat="server" /></td>
            </tr>

            <tr>
                <td>Duration in minutes</td>
                <td><asp:TextBox ID="duration" Text="60" runat="server" /></td>
                <td><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="duration" runat="server" /></td>
            </tr>

            <tr>
                <td>Cost</td>
                <td><asp:TextBox ID="cost" Text="0" runat="server" /></td>
                <td><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="cost" runat="server" /></td>
            </tr>

            <tr>
                <td>Description</td>
                <td><asp:TextBox Height="100px" TextMode="MultiLine" ID="description" runat="server"/></td>
                <td><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="description" runat="server" /></td>
            </tr>

            <tr>
                <td colspan="3"><asp:Label ID="failureMessage" ForeColor="Red" runat="server" /></td>
            </tr>

            <tr>
                <td colspan="3"><asp:Label ID="sucessMessage" ForeColor="Green" runat="server" /></td>
            </tr>

            <tr>
                <td colspan="3"><asp:Button ID="postLecture" Text="Post problem" OnClick="SendPostProblem" runat="server"/></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
