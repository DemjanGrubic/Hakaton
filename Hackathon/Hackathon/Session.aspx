<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Session.aspx.cs" Inherits="Hackathon.Session" %>

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
            $('can').addEventListener("mousemove", function (e) {
                findxy2('move', e.clientX, e.clientY, x);
                var message = "1" + "\"move\", " + e.clientX + ", " + e.clientY;
                ws.send(message);
                message.value = '';
            }, false);
            $('can').addEventListener("mousedown", function (e) {
                findxy2('down', e.clientX, e.clientY, x);
                var message = "1" + "\"down\", " + e.clientX + ", " + e.clientY;
                ws.send(message);
                message.value = '';
            }, false);
            $('can').addEventListener("mouseup", function (e) {
                findxy2('up', e.clientX, e.clientY, x);
                var message = "1" + "\"up\", " + e.clientX + ", " + e.clientY;
                ws.send(message);
                message.value = '';
            }, false);
            $('can').addEventListener("mouseout", function (e) {
                findxy2('out', e.clientX, e.clientY, x);
                var message = "1" + "\"out\", " + e.clientX + ", " + e.clientY;
                ws.send(message);
                message.value = '';
            }, false);
        }

        function createSpan(text) {
            var span = document.createElement('span');
            span.innerHTML = text + '<br />';
            return span;
        }

        window.onload = function () {
            // if
            // wireEvents();
            $('send').addEventListener('click', function () {
                var message = $('message');
                ws.send("0" + $('phantomKey').value + "\n" + $('phantomName').value + ": " + message.value);
                message.value = '';
            });

            $('close').addEventListener('click', function () {
                ws.close();
            });

            var conversation = $('conversation');
            var message = $('message');

            //message.onkeypress == function (event) {
            //    if (event.which == 13 || event.keyCode == 13) {
            //        var message = $('message');
            //        ws.send("0" + $('phantomKey').value + "\n" + $('phantomName').value + ": " + message.value);
            //        message.value = '';
            //        return false;
            //    }
            //    return true;
            //};

            //$('message').on('keyup', function (e) {
            //    if (e.which == 13) {
            //        alert(e);
            //       //e.preventDefault();
            //        var message = $('message');
            //        ws.send("0" + $('phantomKey').value + "\n" + $('phantomName').value + ": " + message.value);
            //        message.value = '';
            //    }
            //});

            var url = 'ws://10.10.66.90:4465/WebSocketsServer.ashx?name=' + $('phantomName').value;

            //alert('url = ' + url);
            ws = new WebSocket(url);

            ws.onerror = function (e) {
                conversation.appendChild(createSpan('Problem with connection: ' + e.message));
            };

            ws.onopen = function () {
                conversation.innerHTML = 'Client connected <br/>';
            };

            ws.onmessage = function (e) {
                var str = e.data.toString();
                switch (str.substr(0, 1)) {
                    case "0":
                    case "3":
                        conversation.appendChild(createSpan(str.substr(1, str.length - 1)));
                        break;
                    case "1":
                        eval(str.substr(1, str.length - 1));
                        break;
                }
            };

            ws.onclose = function () {
                conversation.innerHTML = 'Closed connection!';
            };

        };

        var canvas, ctx, flag = false,
            prevX = 0,
            currX = 0,
            prevY = 0,
            currY = 0,
            dot_flag = false;

        var x = "black",
            y = 2;

        function init() {
            canvas = document.getElementById('can');
            ctx = canvas.getContext("2d");
            w = canvas.width;
            h = canvas.height;
        }

        function color(obj) {
            //if ($('phantomKey').value != $('phantomTeacherKey'))
            //{
            //    return;
            //}
            //switch (obj.id) {
            //    case "green":
            //        x = "green";
            //        break;
            //    case "blue":
            //        x = "blue";
            //        break;
            //    case "red":
            //        x = "red";
            //        break;
            //    case "yellow":
            //        x = "yellow";
            //        break;
            //    case "orange":
            //        x = "orange";
            //        break;
            //    case "black":
            //        x = "black";
            //        break;
            //    case "white":
            //        x = "white";
            //        break;
            //}
            console.log($('phantomKey').value + " " + $('phantomTeacherKey').value);
            if ($('phantomKey').value == $('phantomTeacherKey').value)
            {
                x = obj.id;
                if (x == "white") y = 14;
                else y = 2;
                ws.send("4" + x);
            }
        }

        var xxx = 3.4;

        function draw(color) {
            ctx.beginPath();
            ctx.moveTo(prevX / xxx, prevY / xxx);
            ctx.lineTo(currX / xxx, currY / xxx);
            ctx.strokeStyle = color;
            ctx.lineWidth = y;
            ctx.stroke();
            ctx.closePath();
        }

        function erase() {
            var m = confirm("Want to clear");
            if (m) {
                ctx.clearRect(0, 0, w, h);
                document.getElementById("canvasimg").style.display = "none";
            }
        }

        function save() {
            document.getElementById("canvasimg").style.border = "2px solid";
            var dataURL = canvas.toDataURL();
            document.getElementById("canvasimg").src = dataURL;
            document.getElementById("canvasimg").style.display = "inline";
        }

        function findxy(res, e) {
            console.log("a");
            if (res == 'down') {
                prevX = currX;
                prevY = currY;
                currX = e.clientX - canvas.offsetLeft;
                currY = e.clientY - canvas.offsetTop;

                flag = true;
                dot_flag = true;
                if (dot_flag) {
                    ctx.beginPath();
                    ctx.fillStyle = color;
                    ctx.fillRect(currX, currY, 2, 2);
                    ctx.closePath();
                    dot_flag = false;
                }
            }
            if (res == 'up' || res == "out") {
                flag = false;
            }
            if (res == 'move') {
                if (flag) {
                    prevX = currX;
                    prevY = currY;
                    currX = e.clientX - canvas.offsetLeft;
                    currY = e.clientY - canvas.offsetTop;
                    draw(color);
                }
            }
        }

        function findxy2(res, ex, ey, color) {
            //alert(color.value);
            if (res == 'down') {
                prevX = currX;
                prevY = currY;
                currX = ex - canvas.offsetLeft;
                currY = ey - canvas.offsetTop;
                //alert(ex + " " + canvas.offsetLeft + " " + ey + " " + canvas.offsetTop);

                flag = true;
                dot_flag = true;
                if (dot_flag) {
                    ctx.beginPath();
                    ctx.fillStyle = color;
                    ctx.fillRect(currX, currY, 2, 2);
                    ctx.closePath();
                    dot_flag = false;
                }
            }
            if (res == 'up' || res == "out") {
                flag = false;
            }
            if (res == 'move') {
                if (flag) {
                    prevX = currX;
                    prevY = currY;
                    currX = ex - canvas.offsetLeft;
                    currY = ey - canvas.offsetTop;

                    draw(color);
                }
            }
        }

        function sendMsg() {
            var message = $('message');
            ws.send("0" + $('phantomKey').value + "\n" + $('phantomName').value + ": " + message.value);
            message.value = '';
        }

    </script>


    <style type="text/css">
        #graph {
            height: 20px;
            width: 421px;
        }
    </style>


</head>
<body onload="init()">
    <form id="form1" runat="server" onsubmit="sendMsg(); return false;">
        <table>
            <tr>
                <td>
                    <canvas id="can" style="border-style: solid; border-color: inherit; border-width: 2px; height: 500px; width: 1000px;"></canvas>
                </td>
                <td>
                    <div>Color palette</div>
                    <div style="width: 30px; height: 30px; background: green;" id="green" onclick="color(this)"></div>
                    <div style="width: 30px; height: 30px; background: blue;" id="blue" onclick="color(this)"></div>
                    <div style="width: 30px; height: 30px; background: red;" id="red" onclick="color(this)"></div>
                    <div style="width: 30px; height: 30px; background: yellow;" id="yellow" onclick="color(this)"></div>
                    <div style="width: 30px; height: 30px; background: orange;" id="orange" onclick="color(this)"></div>
                    <div style="width: 30px; height: 30px; background: black;" id="black" onclick="color(this)"></div>
                </td>
            </tr>
        </table>

        <br />
        <input id="message" />
        <input id="send" type="button" value="Send" />
        <input id="close" type="button" value="Close Connection" />
        <input id="phantomKey" type="hidden" value="" runat="server" />
        <input id="phantomName" type="hidden" value="" runat="server" />
        <input id="phantomTeacherKey" type="hidden" value="" runat="server" /><br />
        <div id="conversation"></div>
    </form>
</body>
</html>
