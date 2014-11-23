﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Session.aspx.cs" Inherits="Hackathon.Session" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>test</title>
    <script type="text/javascript">
        var ws;

        function $(id) {
            return document.getElementById(id);
        }

        function wireEvents() {
            $('send').addEventListener('click', function () {
                var message = $('message');
                ws.send(message.value);
                message.value = '';
            });

            $('close').addEventListener('click', function () {
                ws.close();
            });
        }

        function createSpan(text) {
            var span = document.createElement('span');
            span.innerHTML = text + '<br />';
            return span;
        }

        window.onload = function () {
            wireEvents();
            var conversation = $('conversation');
            var url = 'ws://10.10.66.90:4465/WebSocketsServer.ashx?name=testName';

            //alert('url = ' + url);
            ws = new WebSocket(url);

            ws.onerror = function (e) {
                conversation.appendChild(createSpan('Problem with connection: ' + e.message));
            };

            ws.onopen = function () {
                conversation.innerHTML = 'Client connected <br/>';
            };

            ws.onmessage = function (e) {
                conversation.appendChild(createSpan(e.data.toString()));
            };

            ws.onclose = function (e) {
                conversation.innerHTML = 'Closed connection!';
            };

        };

    </script>


    <style type="text/css">
        #graph {
            height: 20px;
            width: 421px;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">

        <h1>Using WebSockets</h1>
        <canvas id="graph"></canvas><br />
        <input id="message" />
        <input id="send" type="button" value="Send" />
        <input id="close" type="button" value="Close Connection" />
        <br />
        <div id="conversation"></div>
    </form>
</body>
</html>
