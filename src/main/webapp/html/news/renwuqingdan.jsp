<%--suppress ALL --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no,minimal-ui">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-touch-fullscreen" content="no">
<title>栏目管理</title>
  <link href="../../css/style.css" rel="stylesheet" type="text/css">
  <script language="javascript" src="../../js/jquery-3.3.1.min.js"></script>
  <script language="javascript" src="../../js/util.js"></script>
<script>
    $(function () {
        $("#area").change(function () {
            var obj=document.getElementById("area");
            var index=obj.selectedIndex;
            var v=obj.options[index].getAttribute("value");

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
                            $("#line").append("<option class='"+data[i].id+"' value='" + data[i].id + "'>" + data[i].line + "</option>");
                        });
                    }
                }
            );
        });
    });
        // var obj=document.getElementById("line");
        // var index=obj.selectedIndex;
        // var v=obj.options[index].getAttribute("class");
        // var url="/selectequipment.do";
        // $.post(
        //     url,
        //     {
        //         id:v ,
        //     },
        //     function (data) {
        //         if(data != null){
        //             $("#equipment>option:gt(0)").remove();
        //             $.each(data, function(i, n){
        //                 $("#equipment").append("<option  value='" + data[i].equipment+ "'>" + data[i].equipment+ "</option>");
        //             });
        //         }
        //     }
        // );
    $(function () {
        $("#line").change(function () {
            var obj=document.getElementById("line");
            var index=obj.selectedIndex;
            var v=obj.options[index].getAttribute("value");
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
                            $("#equipment").append("<option value='" + data[i].id+ "'>" + data[i].equipment+ "</option>");
                        });
                    }
                }
            );
        });
        });

    function shanchu(id)
{
	var  str = confirm("是否确定删除当前信息？");
	if(str == true)
	{
	//	请求后台
    location.href="/deleteUnlist.do?id="+id+"&pageNo="+${pageInfo.pageNum};
	}

}
function openChildenWindowInsert() {
//    以子窗口的形式打开请求所要跳转的页面
    window.open("toInsertPage.do",null,"width=670,height=260");

}
function openChildenWindowUpdate(id) {
//    以子窗口的形式打开请求所要跳转的页面
    window.open("toUpdatePage.do?id="+id,null,"width=670,height=260");

}
    function openChildenWindowzhaipai(id,e) {
//    以子窗口的形式打开请求所要跳转的页面
        window.open("tozhaipaiPage.do?id="+id,null,"width=670,height=560");

    }

</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="25" align="center" valign="bottom" class="td06"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="2%" valign="middle" background="../../images/bg_03.gif">&nbsp;</td>
          <td width="2%" valign="middle" background="../../images/bg_03.gif"><img src="../../images/main_28.gif" width="9" height="9" align="absmiddle"></td>
          <td height="30" valign="middle" background="../../images/bg_03.gif"><div align="left"><font color="#FFFFFF">任务清单</font></div></td>
        </tr>
      </table></td>
    </tr>
  </table>
  <form name="form1" method="post" action="/renwu.do">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">
      <tr>
        <td colspan="2" class="td_02"><SPAN class=td_title>查询</SPAN></td>
      </tr>
      <tr>
        <td align="right" width="4%" class="td_02">查询人</td>
        <td width="7%" class="td_02"> <select id="assignor" name="assignor" class="input" style="width:99% " >
            <option value="${user.name}" ${assignor==user.name?'selected':''}>--${user.name}--</option>
            <option value="0" ${assignor=='0'?'selected':''}>--所有人--</option>
        </select></td>
        <td width="4%" class="td_02" align="right">区域</td>
        <td width="7%" class="td_02"><select  id="area" name="area" class="input" style="width:99% ">
          <option value="0" ${area=='0'or area==null?'selected':''}>--请选择--</option>
          <c:forEach items="${areaList}" var="arealist">
            <option class="${arealist.id}" value="${arealist.id}" ${area==arealist.id?'selected':''}>${arealist.area}</option>
          </c:forEach>
        </select></td>
        <td align="right" width="4%" class="td_02">生产线</td>
        <td width="7%" class="td_02"><select id="line" name="line" class="input" style="width:99% ">
          <option value="0" selected>--请选择--</option>
        </select></td>
        <td align="right" width="4%" class="td_02">设备</td>
        <td  width="14%" class="td_02"><select id="equipment" name="equipment" class="input" style="width:99% ">
          <option value="0" selected>--请选择--</option>
        </select></td>
        <td width="3%">
          <input name="chaxun" type="submit" class="buttonface02" value="查询">
        </td>

        <%--<td width="88%" class="td_02">--%>
          <%--<select id="select" name="select" class="input" style="width:99% " onchange="showChildren()">--%>
            <%--<option value="0" selected>--请选择--</option>--%>
            <%--<c:forEach items="${pageInfo.list}" var="unlist">--%>
              <%--<option value="${unlist.id}" ${unlist.id == 1 ? 'selected':''}>${unlist.area}</option>--%>
            <%--</c:forEach>--%>
          <%--</select>--%>
        <%--</td>--%>
      </tr>
    </table>
    <br>
    <table width="95%"  border="0" align="center" cellpadding="0" cellspacing="0">
    </table>
    <table  id="unlist" width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">
    
      <tr>
        <td colspan="7" align="right" class="td07"><a href="/renwu.do?pageNo=1&assignor=${assignor}&area=${area}&line=${line}&equipment=${equipment}"> <img src="../../images/1.gif" width="4" height="5" align="absmiddle"> 首页　</a><a ${pageInfo.hasPreviousPage?"":"disabled='false'"} href="/renwu.do?pageNo=${pageInfo.prePage}&assignor=${assignor}&area=${area}&line=${line}&equipment=${equipment}"> <img src="../../images/2.gif" width="3" height="5" align="absmiddle"> 上一页　</a><a href="/renwu.do?pageNo=${pageInfo.pageNum+1}&assignor=${assignor}&area=${area}&line=${line}&equipment=${equipment}" ${pageInfo.hasNextPage?"":"disabled='false'"}><img src="../../images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页</a> 　<a href="/renwu.do?pageNo=${pageInfo.nextPage}&assignor=${assignor}&area=${area}&line=${line}&equipment=${equipment}"> <img src="../../images/3.gif" width="4" height="5" align="absmiddle"> 末页　</a>　共${pageInfo.pages}页当前第${pageInfo.pageNum}页  ${pageInfo.total}条记录</td>
      </tr>
      <tr>
        <td width="3%" class="td_top">编号</td>
        <td width="5%" class="td_top">挂牌日期</td>
        <td width="4%" class="td_top">挂牌人</td>
        <td width="3%" class="td_top">班组</td>
        <td width="4%" class="td_top">模块分类</td>
        <td width="6%" class="td_top">异常分类</td>
        <td width="3%" class="td_top">优先级</td>
        <td width="3%" class="td_top">区域</td>
        <td width="4%" class="td_top">生产线</td>
        <td width="6%" class="td_top">设备</td>
        <td width="12%" class="td_top">异常描述</td>
        <td width="6%" class="td_top">审核意见</td>
        <td width="4%" class="td_top">状态</td>
        <td width="3%" class="td_top"></td>
        <td width="3%" class="td_top"></td>
      </tr>
      <c:forEach items="${pageInfo.list}" var="unlist">
        <tr>
          <td class="td07">${unlist.id}</td>
          <td class="td07">${unlist.cdate}</td>
          <td class="td07">${unlist.reporter}</td>
          <td class="td07">${unlist.classnum}</td>
          <td align="center" class="td07">${unlist.mtype}</td>
          <td class="td07">${unlist.etype}</td>
          <td align="center" class="td07">${unlist.priority}</td>
          <td class="td07">${unlist.area}</td>
          <td class="td07">${unlist.line}</td>
          <td class="td07">${unlist.equipment}</td>
          <td class="td07">${unlist.cdescribe}</td>
          <td class="td07">${unlist.suggestion}</td>
          <td class="td07">${unlist.status}</td>
          <td class="td07"><a href="#" onClick="openChildenWindowzhaipai(${unlist.id})">摘牌</a>
          </td>
          <%--<td class="td07" ><a href="#" ${user.name!= unlist.reporter?"style='display: none' ": "" }id="shanchu" onClick="shanchu(${unlist.id})">删除</a></td>--%>
          <%--<td class="td07"><a href="#" ${user.name != unlist.reporter?"style='display: none' ": "" } onClick="openChildenWindowUpdate(${unlist.id})">修改</a></div>--%>
          <%--</td>--%>
        </tr>
      </c:forEach>
    </table>
    <p>&nbsp;</p>
  </form>
</center>
</body>
<script>
    $(function () {
        var obj=document.getElementById("area");
        var index=obj.selectedIndex;
        var v=obj.options[index].getAttribute("value");

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

                            var line = ${line};


                        if (data[i].id == line){
                            $("#line").append("<option selected class='"+data[i].id+"' value='" + data[i].id + "'>" + data[i].line + "</option>");
                        }else {
                            $("#line").append("<option class='"+data[i].id+"' value='" + data[i].id + "'>" + data[i].line + "</option>");
                        }

                    });
                }
            }
        );
        $(function () {

            var v = ${line};
            var url = "/selectequipment.do";
            $.post(
                url,
                {
                    id: v,
                },
                function (data) {
                    if (data != null) {
                        $("#equipment>option:gt(0)").remove();
                        $.each(data, function (i, n) {
                            var equipment = ${equipment}
                            if (data[i].id == equipment){
                                $("#equipment").append("<option selected value='" + data[i].id + "'>" + data[i].equipment + "</option>");
                            }else {
                                $("#equipment").append("<option value='" + data[i].id + "'>" + data[i].equipment + "</option>");
                            }

                        });
                    }
                }
            );
        });
    });
</script>
</html>
