<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no,minimal-ui">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-touch-fullscreen" content="no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>挂牌管理</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
  <script language="javascript" src="../../js/jquery-3.3.1.min.js"/>
  <script language="javascript" src="../../js/util.js"></script>
<script>

    $(function () {
        $("#area").change(function () {
            var obj=document.getElementById("area");
            var index=obj.selectedIndex;
            var v=obj.options[index].getAttribute("class");

            var url="/selectline.do";
            $.post(
                url,
                {
                   id:v ,
                },
                function (data) {
                    if(data != null){
                        $("#line>option:gt(0)").remove();
                        $.each(data, function(i, n){
                            $("#line").append("<option class='"+data[i].id+"' value='" + data[i].line + "'>" + data[i].line + "</option>");
                        });
                    }
                }
            );
        });
    });
    $(function () {
        $("#line").change(function () {
            var obj=document.getElementById("line");
            var index=obj.selectedIndex;
            var v=obj.options[index].getAttribute("class");
            var url="/selectequipment.do";
            $.post(
                url,
                {
                    id:v ,
                },
                function (data) {
                    if(data != null){
                        $("#equipment>option:gt(0)").remove();
                        $.each(data, function(i, n){
                            $("#equipment").append("<option value='" + data[i].equipment+ "'>" + data[i].equipment+ "</option>");
                        });
                    }
                }
            );
        });
    });
function tianjia()
{
	var reporter = document.getElementById("reporter");
    var classnum = document.getElementById("classnum");
    var mtyp = document.getElementById('mtype');
    var etype = document.getElementById('etype');
    var priority = document.getElementById('priority');
    var area = document.getElementById('area');
    var equipment = document.getElementById('equipment');
    var cdescribe = document.getElementById('cdescribe');
	if(reporter.value == "")
	{
		alert("请填写挂牌人！");

	}
	else if (classnum.value =="0")
	{
		alert("请选择班组！");

	}else if (mtyp.value =="0")
    {
        alert("请选择模块！");

    }else if (etype.value =="0")
    {
        alert("请选择异常类型！");

    }else if (priority.value =="0")
    {
        alert("请选择优先级！");

    }else if (area.value =="")
    {
        alert("请填写区域！");

    }else if (equipment.value =="")
    {
        alert("请填写设备！");

    }else if (cdescribe.value =="")
    {
        alert("请填写异常描述！");

    }else{
        document.form1.action="/insertUnlist.do";
        document.form1.submit();
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
          <td height="30" valign="middle" background="../../images/bg_03.gif"><div align="left"><font color="#FFFFFF">挂牌问题添加</font></div></td>
        </tr>
      </table></td>
    </tr>
  </table>
  <form name="form1" method="post" action="/insertUnlist.do">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">
      <tr>
        <td colspan="9" class="td_02" align="center">挂牌</td>
      </tr>
      <tr>
        <td width="5%" class="td_02">挂牌人</td>
        <td width="10%" class="td_02"><input id="reporter" value="${user.name}" name="reporter" type="text" class="input" list="batch_list" autocomplete="off" onkeyup="mohuchaxun(this)" style="width:99% "><datalist id="batch_list"><option label="你好"></option> </datalist></td>
        <td width="5%" class="td_02">班组</td>
        <td width="10%" class="td_02"><select id="classnum" name="classnum" class="input" style="width:99% ">
          <option value="0" ${sessionScope.user.uclassnum==null?'selected':''}>--请选择--</option>
          <option value="甲班" ${sessionScope.user.uclassnum=="甲班"?'selected':''}>甲班</option>
          <option value="乙班" ${sessionScope.user.uclassnum=="乙班"?'selected':''}>乙班</option>
          <option value="丙班" ${sessionScope.user.uclassnum=="丙班"?'selected':''}>丙班</option>
          <option value="常白班" ${sessionScope.user.uclassnum=="常白班"?'selected':''}>常白班</option>
          <option value="常白班" ${sessionScope.user.uclassnum=="办公室"?'selected':''}>办公室</option>
        </select></td>
        <td width="7%" class="td_02">模块分类</td>
        <td width="10%" class="td_02"><select id="mtype" name="mtype" class="input" style="width:99% ">
          <option value="0" selected>--请选择--</option>
          <option value="AC">AC</option>
          <option value="AM">AM</option>
          <option value="5S">5S</option>
          <option value="点检">点检</option>
        </select></td>
        <td width="7%" class="td_02">异常分类</td>
        <td width="20%" class="td_02"><select id="etype" name="etype" class="input" style="width:99% ">
          <option value="0" selected>--请选择--</option>
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
        <td width="8%" class="td_02"><select id="priority" name="priority" class="input" style="width:99% ">
          <option value="0" selected>--请选择--</option>
          <option value="A">A</option>
          <option value="B">B</option>
          <option value="C">C</option>
        </select></td>
        <td width="8%" class="td_02">区域</td>
        <td width="8%" class="td_02"><select id="area" name="area" class="input" style="width:99% ">
          <option value="0" selected>--请选择--</option>
          <c:forEach items="${arealist}" var="arealist">
            <option class="${arealist.id}" value="${arealist.area}" >${arealist.area}</option>
          </c:forEach>
        </select></td>
          <td width="8%" class="td_02">生产线</td>
          <td width="8%" class="td_02"><select id="line" name="line" class="input" style="width:99% ">
              <option value="0" selected>--请选择--</option>
          </select></td>
        <td width="8%" class="td_02">设备</td>
        <td colspan="2" width="8%" class="td_02"><select id="equipment" name="equipment" class="input" style="width:99% ">
          <option value="0" selected>--请选择--</option>
        </select></td>
      </tr>

      <tr>
        <td class="td_02">问题描述</td>
        <td colspan="8" class="td_02"><textarea id="cdescribe" name="cdescribe" rows="5" style="width:99% "></textarea>
        </td>
      </tr>
    </table><br>
    <table width="95%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td class="td_page"><div align="center">
            <input name="Submit" type="button" class="buttonface02" value="  添 加  " onclick="tianjia()">
&nbsp;&nbsp;
        <input name="Submit" type="reset" class="buttonface02" value="  重 置  ">
&nbsp;&nbsp; 
<input name="Submit" type="button" class="buttonface02" value="  关 闭  " onClick="window.opener.location.href=window.opener.location.href;window.close()">
        </div></td>
      </tr>
    </table>
    <br>
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
