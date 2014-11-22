<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Session.aspx.cs" Inherits="Hackathon.Session" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <script src="Scripts/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {

            var name = prompt('what is your name?:');

            var url = 'ws://localhost:4465/ws.ashx?name=' + name;

            alert('Connecting to: ' + url);

            ws = new WebSocket(url);

            ws.onopen = function () {

                $('#messages').prepend('Connected <br/>');

                $('#cmdSend').click(function () {

                    ws.send($('#txtMessage').val());

                    $('#txtMessage').val('');

                });

            };

            ws.onmessage = function (e) {

                $('#chatMessages').prepend(e.data + '<br/>');

            };

            $('#cmdLeave').click(function () {

                ws.close();

            });

            ws.onclose = function () {

                $('#chatMessages').prepend('Closed <br/>');

            };

            ws.onerror = function (e) {

                $('#chatMessages').prepend('Oops something went wrong <br/>');

            };

        });

    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <input id="txtMessage" />

        <input id="cmdSend" type="button" value="Send" />

        <input id="cmdLeave" type="button" value="Leave" />

        <br />

        <div id="chatMessages" />
    </form>
</body>
</html>
