<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>异物检测操作平台</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="js/jquery-3.3.1.min.js"/>
<script language="javascript" src="js/util.js"></script>
  <style type="text/css">
    /*右边*/
    .my-box{
      width: 100%;
      height: 94%;
      margin-top: 0px;
    }
    /*左边*/
    .my-box-left2{
      width: 300px;
      height: 100%;
      float: left;
      /*background-color: red;*/
    }
    .my-box-right2{
      overflow: hidden;
      /*background-color: yellowgreen;*/
      height: 100%;
      /*margin-left: 40px;*/
      overflow-y: hidden;
    }
  </style>
  <script>
      function add() {
          var model = new Object();
          model.ssty = $('#ssty').val();
          model.thred = $('#thred').val();
          model.x = $('#x').val();
          model.y = $('#y').val();
          model.width = $('#width').val();
          model.length = $('#length').val();
          //提交
          $.ajax({
              type: "post",
              url: 'updata.do',
              data: model,
              dataType:"json",
              success: function (result) {
                alert("保存成功！");
              }
          });
      }

  </script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="25" align="center" valign="bottom" class="td06"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="2%" valign="middle" background="images/bg_03.gif">&nbsp;</td>
          <td width="2%" valign="middle" background="images/bg_03.gif"><img src="images/main_28.gif" width="9" height="9" align="absmiddle"></td>
          <td height="30" valign="middle" background="images/bg_03.gif"><div align="left"><font color="#FFFFFF">异物检测操作平台</font></div></td>
        </tr>
      </table></td>
    </tr>
  </table>
  <div class="my-box">
    <div class="my-box-left2">
      <table style="margin-top: 30px;margin-left: 50px" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">
        <tr>
          <td colspan="9" class="td_02" style="font-size: 20px" align="center">参数设置</td>
        </tr>
        <tr>
          <td width="30%" class="td_02" style="font-size: 14px">分辨率：</td>
          <td width="70%" class="td_02"><input id="ssty" name="ssty" type="text" value="${parameter.get(0).v}" class="input" style="width:100% "></td>
        </tr>
        <tr>
          <td width="30%" class="td_02" style="font-size: 14px">阈值：</td>
          <td width="70%" class="td_02"><input id="thred" name="thred" type="text" value="${parameter.get(1).v}"class="input" style="width:100% "></td>
        </tr>
        <tr>
          <td width="30%" class="td_02" style="font-size: 14px">X：</td>
          <td width="70%" class="td_02"><input id="x" name="x" type="text"value="${parameter.get(2).v}" class="input" style="width:100% "></td>
        </tr>
        <tr>
          <td width="30%" class="td_02" style="font-size: 14px">Y：</td>
          <td width="70%" class="td_02"><input id="y" name="y" type="text" value="${parameter.get(3).v}"class="input" style="width:100% "></td>
        </tr>
        <tr>
          <td width="30%" class="td_02" style="font-size: 14px">宽：</td>
          <td width="70%" class="td_02"><input id="width" name="width" type="text"value="${parameter.get(4).v}" class="input" style="width:100% "></td>
        </tr>
        <tr>
          <td width="30%" class="td_02" style="font-size: 14px">高：</td>
          <td width="70%" class="td_02"><input id="length" name="length" type="text" value="${parameter.get(5).v}"class="input" style="width:100% "></td>
        </tr>
        <tr>
          <td colspan="9" class="td_02" align="right">
            <input id="save" type="button" class="buttonface02" value="保存" onclick="add()">

          </td>
        </tr>
      </table>
      <div style="margin-top: 50px"></div>
      <span style="color:green;font-size:40px;margin-left: 40px;">已检测:<span id="show">0</span></span>
    </div>
    <div class="my-box-right2">
      <div id="word" style="margin-top: 30px;"><h1 style="color:green;font-size: 80px;">成功！</h1></div>
      <div id="message" style="margin-top: 30px"><img style="border: 2px #B3CFE8 solid;"  width="600" height="300"  align="absmiddle"/></div>
    </div>
  </div>
</center>
</body>
<script>

    var websocket = null;
    var host = document.location.host;
    var username = "zhangsan";
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        // alert("浏览器支持Websocket")
        websocket = new WebSocket('ws://'+host+'/bjmengniu/webSocket/'+username);
    } else {
        alert('当前浏览器 Not support websocket')
    }

    //连接发生错误的回调方法
    websocket.onerror = function() {
        // alert("WebSocket连接发生错误")
        // setMessageInnerHTML("WebSocket连接发生错误");
    };

    //连接成功建立的回调方法
    websocket.onopen = function() {
        // alert("WebSocket连接成功")
        // setMessageInnerHTML("WebSocket连接成功");
    }

    //接收到消息的回调方法
    websocket.onmessage = function(event) {
        // alert("接收到消息的回调方法")
        // alert("这是后台推送的消息："+event.data);
        $("#show").html(parseInt($("#show").html())+1);
        if(event.data=='success'){
            $("#word").html('<h1 style="color:green;font-size: 80px;margin-top: 15px;">正常！</h1>');
            $("#message").html('<img style="border: 2px #B3CFE8 solid;" src="/ttt/zhengchang.jpg" width="600" height="300"  align="absmiddle">');
        }else if(event.data!='success'){
            $("#word").html('<h1 style="color:red;font-size: 80px;margin-top: 15px;">异常！</h1>');
            $("#message").html('<img style="border: 2px #B3CFE8 solid;" src='+event.data+' width="600" height="300"  align="absmiddle">');
        }
        // websocket.close();
        // alert("webSocket已关闭！")
    }

    //连接关闭的回调方法
    websocket.onclose = function() {
        // setMessageInnerHTML("WebSocket连接关闭");
    }

    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。

    window.onbeforeunload = function() {
        closeWebSocket();
    }

    //关闭WebSocket连接
    function closeWebSocket() {
        websocket.close();
    }

    //将消息显示在网页上

    function setMessageInnerHTML(innerHTML) {
        document.getElementById('message').innerHTML += innerHTML + '<br/>';
    }
</script>
</html>
