<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no,minimal-ui">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-touch-fullscreen" content="no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审核页面</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
  <script language="javascript" src="../../js/jquery-3.3.1.min.js"></script>
  <script language="javascript" src="../../js/util.js"></script>
<script>

 function weitongguo() {

         alert(${str});



     var sth = document.getElementById('suggestion');
     if (sth.value == null || sth.value == undefined || sth.value == '') {
         alert("请填写审核意见！");

     } else {
         document.getElementsByName("status")[0].value = "未通过";
         document.form1.action = "/updateStatus.do";
         document.form1.submit();
         window.opener.location.reload(true);
     }
 }
    function tongguo()
    {

        alert(${str});

        var sth = document.getElementById('suggestion');
        var mtype = document.getElementById('mtype');
        if(sth.value == null||sth.value == undefined||sth.value == ''){
            alert("请填写审核意见!");


        }else{
            if(mtype.value=="AC"){document.getElementsByName("status")[0].value ="审核通过";
            }else {
                document.getElementsByName("status")[0].value ="已派发";
            }
            document.form1.action="/updateStatus.do";
            document.form1.submit();
            window.opener.location.reload(true);
        }


}
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="25" align="center" valign="bottom" class="td06"> <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="2%" valign="middle" background="../../images/bg_03.gif">&nbsp;</td>
          <td width="2%" valign="middle" background="../../images/bg_03.gif"><img src="../../images/main_28.gif" width="9" height="9" align="absmiddle"></td>
          <td height="30" valign="middle" background="../../images/bg_03.gif"><div align="left"><font color="#FFFFFF">挂牌审核</font></div></td>
        </tr>
      </table></td>
    </tr>
  </table>
  <form name="form1" method="post" action="">
    <input type="hidden" name="id" value="${unlist.id}">
    <input id="status" type="hidden" name="status" >
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">
      <tr>
        <td colspan="9" class="td_02" align="center">挂牌</td>
      </tr>
      <tr>
        <td width="5%" class="td_02">挂牌人</td>
        <td width="10%" class="td_02"><input value="${unlist.reporter}" name="reporter" type="text" class="input" style="width:99% "></td>
        <td width="5%" class="td_02">班组</td>
        <td width="10%" class="td_02"><select name="classnum" class="input" style="width:99% ">
          <option  selected>${unlist.classnum}</option>
          <option value="甲班">甲班</option>
          <option value="乙班">乙班</option>
          <option value="丙班">丙班</option>
          <option value="常白班">常白班</option>
        </select></td>
        <td width="7%" class="td_02">模块分类</td>
        <td width="10%" class="td_02"><select id="mtype"name="mtype" class="input" style="width:99% ">
          <option  selected>${unlist.mtype}</option>
          <option value="AC">AC</option>
          <option value="AM">AM</option>
          <option value="5S">5S</option>
        </select></td>
        <td width="10%" class="td_02">异常分类</td>
        <td width="17%" class="td_02"><select name="etype" class="input" style="width:99% ">
          <option  selected>${unlist.etype}</option>
          <option value="1.微小缺陷">1.微小缺陷</option>
          <option value="2.不在基本状态">2.不在基本状态</option>
          <option value="3.死角">3.死角</option>
          <option value="4.污染源">4.污染源</option>
          <option value="5.质量隐患">5.质量隐患</option>
          <option value="6.不必要的物品">6.不必要的物品</option>
          <option value="7.安全隐患">7.安全隐患</option>
        </select></td>

      </tr>
      <tr>
        <td width="8%" class="td_02">优先级</td>
        <td width="8%" class="td_02"><select name="priority" class="input" style="width:99% ">
          <option  selected>${unlist.priority}</option>
          <option value="A">A</option>
          <option value="B">B</option>
          <option value="C">C</option>
        </select></td>
        <td width="8%" class="td_02">区域</td>
        <td width="8%" class="td_02"><input value="${unlist.area}" name="area" type="text" class="input" style="width:99% "></td>
        <td width="8%" class="td_02">设备</td>
        <td width="8%" class="td_02"><input value="${unlist.equipment}" name="equipment" type="text" class="input" style="width:99% "></td>
        <td width="8%" class="td_02">审核意见</td>
        <td  width="12%" class="td_02"><input  id="suggestion" name="suggestion" type="text" class="input" style="width:99% "></td>
      </tr>
      <tr>
        <td width="8%" class="td_02">标准时间</td>
        <td  width="8%" class="td_02"><input  id="stime" name="stime" type="text" class="input" style="width:99% "></td>
        <td width="8%" class="td_02">窗口期</td>
        <td width="8%" class="td_02"><select name="ontime" class="input" style="width:99% ">
          <option value="清洗时" selected>清洗时</option>
          <option value="生产时">生产时</option>
          <option value="停机时">停机时</option>
        </select></td>
        <td width="5%" class="td_02">指派人</td>
        <td width="10%" class="td_02"><input id="assignor" name="assignor" type="text" class="input" list="batch_list" autocomplete="off" onkeyup="mohuchaxun(this)" style="width:99% "><datalist id="batch_list"><option label="你好"></option> </datalist></td>
      </tr>

      <tr>
        <td class="td_02">问题描述</td>
        <td colspan="8" class="td_02"><textarea name="cdescribe" rows="5" style="width:99% ">${unlist.cdescribe}</textarea>
        </td>
      </tr>
    </table><br>
    <br>
    <table width="95%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td class="td_page"><div align="center">
            
            <input name="Submit" type="button" class="buttonface02" value="  通过  " onClick="tongguo()">
            &nbsp;&nbsp;
            <input name="Submit" type="reset" class="buttonface02" value="  重 置  ">
            &nbsp;
          <input name="Submit" type="button" class="buttonface02" value="  未通过  " onClick="weitongguo()">
          &nbsp;&nbsp;
          <input name="Submit" type="button" class="buttonface02" value="  关 闭  " onClick="window.opener.location.href=window.opener.location.href;window.close()">
        </div></td>
      </tr>
    </table>
    <p>&nbsp;</p>
  </form>
</center>
</body>
<script>
    function mohuchaxun(obj){
//当键盘键被松开时发送Ajax获取数据
        var keywords = obj.value;
        var pattern = new RegExp("[\u4E00-\u9FA5]+");
        if(keywords==""||!pattern.test(keywords)){return;
        }else {
            var url = "/mohuchaxun.do";
            $.post(
                url,
                {
                    key: keywords
                },
                function (list) {
                    $(obj).next("#batch_list").empty();
                    for (var i = 0; i < list.length; i++) {
                        $(obj).next("#batch_list").append('<option label="' + list[i] + '" value="' + list[i] + '"></option>');
                    }

                })
        }








    }
</script>
</html>
