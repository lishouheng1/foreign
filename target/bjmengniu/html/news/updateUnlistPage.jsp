<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no,minimal-ui">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-touch-fullscreen" content="no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>栏目管理</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
  <script language="javascript" src="../../js/jquery-3.3.1.min.js"></script>
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
          <td height="30" valign="middle" background="../../images/bg_03.gif"><div align="left"><font color="#FFFFFF">栏目修改</font></div></td>
        </tr>
      </table></td>
    </tr>
  </table>
  <form name="form1" method="post" action="/updateUnlist.do">
    <input type="hidden" name="id" value="${unlist.id}">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">
      <tr>
        <td colspan="9" class="td_02" align="center">挂牌</td>
      </tr>
      <tr>
        <td width="5%" class="td_02">挂牌人</td>
        <td width="10%" class="td_02"><input value="${unlist.reporter}" name="reporter" type="text" class="input" style="width:99% "></td>
        <td width="5%" class="td_02">班组</td>
        <td width="10%" class="td_02"><select name="classnum" class="input" style="width:99% ">
          <option value="甲班" ${unlist.classnum=="甲班"?'selected':''}>甲班</option>
          <option value="乙班" ${unlist.classnum=="乙班"?'selected':''}>乙班</option>
          <option value="丙班" ${unlist.classnum=="丙班"?'selected':''}>丙班</option>
          <option value="常白班" ${unlist.classnum=="常白班"?'selected':''}>常白班</option>
        </select></td>
        <td width="7%" class="td_02">模块分类</td>
        <td width="10%" class="td_02"><select name="mtype" class="input" style="width:99% ">
          <option value="AC" ${unlist.mtype=="AC"?'selected':''}>AC</option>
          <option value="AM" ${unlist.mtype=="AM"?'selected':''}>AM</option>
          <option value="5S" ${unlist.mtype=="5S"?'selected':''}>5S</option>
          <option value="点检" ${unlist.mtype=="点检"?'selected':''}>点检</option>
        </select></td>
        <td width="7%" class="td_02">异常分类</td>
        <td width="20%" class="td_02"><select name="etype" class="input" style="width:99% ">
          <option value="1.微小缺陷" ${unlist.etype=="1.微小缺陷"?'selected':''}>1.微小缺陷</option>
          <option value="2.不在基本状态" ${unlist.etype=="2.不在基本状态"?'selected':''}>2.不在基本状态</option>
          <option value="3.死角" ${unlist.etype=="3.死角"?'selected':''}>3.死角</option>
          <option value="4.污染源" ${unlist.etype=="4.污染源"?'selected':''}>4.污染源</option>
          <option value="5.质量隐患" ${unlist.etype=="5.质量隐患"?'selected':''}>5.质量隐患</option>
          <option value="6.不必要的物品" ${unlist.etype=="6.不必要的物品"?'selected':''}>6.不必要的物品</option>
          <option value="7.安全隐患" ${unlist.etype=="7.安全隐患"?'selected':''}>7.安全隐患</option>
        </select></td>
      </tr>
      <tr>
        <td width="8%" class="td_02">优先级</td>
        <td width="8%" class="td_02"><select name="priority" class="input" style="width:99% ">
          <option value="A" ${unlist.priority=="A"?'selected':''}>A</option>
          <option value="B" ${unlist.priority=="A"?'selected':''}>B</option>
          <option value="C" ${unlist.priority=="C"?'selected':''}>C</option>
        </select></td>
        <td width="8%" class="td_02">区域</td>
        <td width="8%" class="td_02"><select id="area" name="area" class="input" style="width:99% ">
          <c:forEach items="${arealist}" var="arealist">
            <option class="${arealist.id}" value="${arealist.area}" ${arealist.area==unlist.area?'selected':''} >${arealist.area}</option>
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
        <td colspan="8" class="td_02"><textarea name="cdescribe" rows="5" style="width:99% ">${unlist.cdescribe}</textarea>
        </td>
      </tr>
    </table><br>
    <br>
    <table width="95%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td class="td_page"><div align="center">
            
            <input name="Submit" type="submit" class="buttonface02" value="  修 改  " onClick="window.opener.location.reload(true);window.close()">
            &nbsp; &nbsp;
            <input name="Submit" type="reset" class="buttonface02" value="  重 置  ">
            &nbsp;
          <input name="Submit" type="button" class="buttonface02" value="  关 闭  " onClick="window.opener.location.reload(true);window.close()">
        </div></td>
      </tr>
    </table>
    <p>&nbsp;</p>
  </form>
</center>
</body>
<script>
  var lid =null;
    $(function () {
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
                          var line ='${unlist.line}';
                        if (data[i].line == line){
                            lid = data[i].id;

                            $("#line").append("<option selected class='"+data[i].id+"' value='" + data[i].id + "'>" + data[i].line + "</option>");
                        }else {
                            $("#line").append("<option class='"+data[i].id+"' value='" + data[i].line + "'>" + data[i].line + "</option>");
                        }

                    });
                }
            }
        );

        var obj1=document.getElementById("line");

        var index1=obj1.selectedIndex;

        var v1=obj1.options[index1].getAttribute("class");


        var url1 = "/selectequipment.do";

        $.post(
            url1,
            {
                id:v1,
            },
            function (data) {
                if (data != null) {
                    $("#equipment>option:gt(0)").remove();
                    $.each(data, function (i, n) {
                        var equipment = '${unlist.equipment}';
                        if (data[i].equipment == equipment){
                            $("#equipment").append("<option selected value='" + data[i].equipment + "'>" + data[i].equipment + "</option>");
                        }else {
                            $("#equipment").append("<option value='" + data[i].equipment + "'>" + data[i].equipment + "</option>");
                        }

                    });
                }
            }
        );
    });

</script>
</html>
