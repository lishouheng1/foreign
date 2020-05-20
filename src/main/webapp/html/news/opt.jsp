<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>异物检测操作平台</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="../../js/jquery-3.3.1.min.js"/>
<script language="javascript" src="../../js/util.js"></script>
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
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="25" align="center" valign="bottom" class="td06"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="2%" valign="middle" background="../../images/bg_03.gif">&nbsp;</td>
          <td width="2%" valign="middle" background="../../images/bg_03.gif"><img src="../../images/main_28.gif" width="9" height="9" align="absmiddle"></td>
          <td height="30" valign="middle" background="../../images/bg_03.gif"><div align="left"><font color="#FFFFFF">异物检测操作平台</font></div></td>
        </tr>
      </table></td>
    </tr>
  </table>
  <div class="my-box">
    <div class="my-box-left2">
      <form name="form1" method="post" action="/updata.do">
      <table style="margin-top: 30px;margin-left: 50px" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">
        <tr>
          <td colspan="9" class="td_02" style="font-size: 20px" align="center">参数设置</td>
        </tr>
        <tr>
          <td width="30%" class="td_02" style="font-size: 14px">分辨率：</td>
          <td width="70%" class="td_02"><input id="ssty" name="ssty" type="text" value="${parameter.get(0).value}" class="input" style="width:100% "></td>
        </tr>
        <tr>
          <td width="30%" class="td_02" style="font-size: 14px">阈值：</td>
          <td width="70%" class="td_02"><input id="thred" name="thred" type="text" value="${parameter.get(1).value}"class="input" style="width:100% "></td>
        </tr>
        <tr>
          <td width="30%" class="td_02" style="font-size: 14px">X：</td>
          <td width="70%" class="td_02"><input id="x" name="x" type="text"value="${parameter.get(2).value}" class="input" style="width:100% "></td>
        </tr>
        <tr>
          <td width="30%" class="td_02" style="font-size: 14px">Y：</td>
          <td width="70%" class="td_02"><input id="y" name="y" type="text" value="${parameter.get(3).value}"class="input" style="width:100% "></td>
        </tr>
        <tr>
          <td width="30%" class="td_02" style="font-size: 14px">宽：</td>
          <td width="70%" class="td_02"><input id="width" name="width" type="text"value="${parameter.get(4).value}" class="input" style="width:100% "></td>
        </tr>
        <tr>
          <td width="30%" class="td_02" style="font-size: 14px">高：</td>
          <td width="70%" class="td_02"><input id="length" name="length" type="text" value="${parameter.get(5).value}"class="input" style="width:100% "></td>
        </tr>
        <tr>
          <td colspan="9" class="td_02" align="right">
            <input id="save" type="submit" class="buttonface02" value="保存">
          </td>
        </tr>
      </table>
      </form>
    </div>
    <div class="my-box-right2">
      <div id="word" style="margin-top: 30px;"><span style="color:green;font-size: 80px;">成功！</span></div>
      <div id="message" style="margin-top: 30px"><img style="border: 2px #B3CFE8 solid;" src="../../img/success.jpg" width="600" height="300"  align="absmiddle"></div>
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
        websocket = new WebSocket('ws://'+host+'/webSocket/'+username);
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
        if(event.data=='success'){
            $("#word").html('<h1 style="color:green;font-size: 80px;margin-top: 15px;">正常！</h1>');
            $("#message").html('<img style="border: 2px #B3CFE8 solid;" src="../../img/zhengchang.jpg" width="600" height="300"  align="absmiddle">');
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
