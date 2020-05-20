<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>栏目管理</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="../../js/jquery-3.3.1.min.js"/>
<script language="javascript" src="../../js/util.js"></script>
<script>
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
function openChildenWindowzhaipai(id,e) {
//    以子窗口的形式打开请求所要跳转的页面
    window.open("tozhaipaiPage.do?id="+id,null,"width=670,height=560");

}
$(function(){

    $("#chaxun2").click(
        function(){
        var url="/chaxun.do";
        $.post(
            url,
            {
                id:$("#chaxun").val(),
            },
            function(unlist){
                if(unlist.id!=undefined){
                    if($.trim(unlist.status) == $.trim("已派发")){
                        $("#mytable").html(" <tr>\n" +
                            "        <td width=\"3%\" class=\"td_top\">编号</td>\n" +
                            "        <td width=\"5%\" class=\"td_top\">挂牌日期</td>\n" +
                            "        <td width=\"4%\" class=\"td_top\">挂牌人</td>\n" +
                            "        <td width=\"4%\" class=\"td_top\">班组</td>\n" +
                            "        <td width=\"4%\" class=\"td_top\">模块分类</td>\n" +
                            "        <td width=\"6%\" class=\"td_top\">异常分类</td>\n" +
                            "        <td width=\"3%\" class=\"td_top\">优先级</td>\n" +
                            "        <td width=\"5%\" class=\"td_top\">区域</td>\n" +
                            "        <td width=\"7%\" class=\"td_top\">设备</td>\n" +
                            "        <td width=\"23%\" class=\"td_top\">异常描述</td>\n" +
                            "        <td width=\"6%\" class=\"td_top\">状态</td>\n" +
                            "        <td  width=\"6%\" class=\"td_top\">摘牌</td>\n" +
                            "\n" +
                            "      </tr>" +
                            "<tr>\n" +
                            "          <td class=\"td07\">"+unlist.id+"</td>\n" +
                            "          <td class=\"td07\">"+unlist.cdate+"</td>\n" +
                            "          <td class=\"td07\">"+unlist.reporter+"</td>\n" +
                            "          <td class=\"td07\">"+unlist.classnum+"</td>\n" +
                            "          <td class=\"td07\">"+unlist.mtype+"</td>\n" +
                            "          <td class=\"td07\">"+unlist.etype+"</td>\n" +
                            "          <td class=\"td07\">"+unlist.priority+"</td>\n" +
                            "          <td class=\"td07\">"+unlist.area+"</td>\n" +
                            "          <td class=\"td07\">"+unlist.equipment+"</td>\n" +
                            "          <td class=\"td07\">"+unlist.cdescribe+"</td>\n" +
                            "          <td class=\"td07\">"+unlist.status+"</td>\n" +
                            "          <%--<td width=\"6%\" class=\"td_02\"><input name=\"suggestion\" type=\"text\" class=\"input\" style=\"width:99% \"></td>--%>\n" +
                            "          <%--<td class=\"td07\"><a href=\"#\" onClick=\"shanchu(${unlist.id})\">未通过</a></td>--%>\n" +
                            "          <td class=\"td07\"><a href=\"#\"onClick=\"openChildenWindowzhaipai("+unlist.id+")\">摘牌</a>\n" +
                            " </td>\n"+
                            "        </tr>");
                    }else {
                        $("#mytable").html(" <tr>\n" +
                            "        <td width=\"3%\" class=\"td_top\">编号</td>\n" +
                            "        <td width=\"5%\" class=\"td_top\">挂牌日期</td>\n" +
                            "        <td width=\"4%\" class=\"td_top\">挂牌人</td>\n" +
                            "        <td width=\"4%\" class=\"td_top\">班组</td>\n" +
                            "        <td width=\"4%\" class=\"td_top\">模块分类</td>\n" +
                            "        <td width=\"6%\" class=\"td_top\">异常分类</td>\n" +
                            "        <td width=\"3%\" class=\"td_top\">优先级</td>\n" +
                            "        <td width=\"5%\" class=\"td_top\">区域</td>\n" +
                            "        <td width=\"7%\" class=\"td_top\">设备</td>\n" +
                            "        <td width=\"23%\" class=\"td_top\">异常描述</td>\n" +
                            "        <td width=\"6%\" class=\"td_top\">状态</td>\n" +
                            "        <td  width=\"6%\" class=\"td_top\">摘牌</td>\n" +
                            "\n" +
                            "      </tr>" +
                            "<tr>\n" +
                            "          <td class=\"td07\">"+unlist.id+"</td>\n" +
                            "          <td class=\"td07\">"+unlist.cdate+"</td>\n" +
                            "          <td class=\"td07\">"+unlist.reporter+"</td>\n" +
                            "          <td class=\"td07\">"+unlist.classnum+"</td>\n" +
                            "          <td class=\"td07\">"+unlist.mtype+"</td>\n" +
                            "          <td class=\"td07\">"+unlist.etype+"</td>\n" +
                            "          <td class=\"td07\">"+unlist.priority+"</td>\n" +
                            "          <td class=\"td07\">"+unlist.area+"</td>\n" +
                            "          <td class=\"td07\">"+unlist.equipment+"</td>\n" +
                            "          <td class=\"td07\">"+unlist.cdescribe+"</td>\n" +
                            "          <td class=\"td07\">"+unlist.status+"</td>\n" +
                            "          <%--<td width=\"6%\" class=\"td_02\"><input name=\"suggestion\" type=\"text\" class=\"input\" style=\"width:99% \"></td>--%>\n" +
                            "          <%--<td class=\"td07\"><a href=\"#\" onClick=\"shanchu(${unlist.id})\">未通过</a></td>--%>\n" +
                            "          <td class=\"td07\"><a href=\"#\" style='display: none' onClick=\"openChildenWindowzhaipai("+unlist.id+")\">摘牌</a>\n" +
                            " </td>\n"+
                            "        </tr>");

                    }


                }else {
                    $("#mytable").html(" <tr>\n" +
                        "        <td width=\"3%\" class=\"td_top\">编号</td>\n" +
                        "        <td width=\"5%\" class=\"td_top\">挂牌日期</td>\n" +
                        "        <td width=\"4%\" class=\"td_top\">挂牌人</td>\n" +
                        "        <td width=\"4%\" class=\"td_top\">班组</td>\n" +
                        "        <td width=\"4%\" class=\"td_top\">模块分类</td>\n" +
                        "        <td width=\"6%\" class=\"td_top\">异常分类</td>\n" +
                        "        <td width=\"3%\" class=\"td_top\">优先级</td>\n" +
                        "        <td width=\"5%\" class=\"td_top\">区域</td>\n" +
                        "        <td width=\"7%\" class=\"td_top\">设备</td>\n" +
                        "        <td width=\"23%\" class=\"td_top\">异常描述</td>\n" +
                        "        <td width=\"6%\" class=\"td_top\">状态</td>\n" +
                        "        <td  width=\"6%\" class=\"td_top\">摘牌</td>\n" +
                        "\n" +
                        "      </tr>" +
                        "<tr>\n" +
                        "          <td align=\"center\"colspan=\"13\"class=\"td07\">无此牌，请输入正确的编号！</td>\n" +

                        "          <%--<td width=\"6%\" class=\"td_02\"><input name=\"suggestion\" type=\"text\" class=\"input\" style=\"width:99% \"></td>--%>\n" +
                        "          <%--<td class=\"td07\"><a href=\"#\" onClick=\"shanchu(${unlist.id})\">未通过</a></td>--%>\n" +
                        "          <td class=\"td07\"><a href=\"#\" onClick=\"openChildenWindowzhaipai("+unlist.id+")\">摘牌</a>\n" +
                        " </td>\n"+
                        "        </tr>");
                }

            }
            );
    });
});


</script>
</head>

<body id="mybody" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  height="25" align="center" valign="bottom" class="td06"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="2%" valign="middle" background="../../images/bg_03.gif">&nbsp;</td>
          <td width="2%" valign="middle" background="../../images/bg_03.gif"><img src="../../images/main_28.gif" width="9" height="9" align="absmiddle"></td>
          <td height="30" valign="middle" background="../../images/bg_03.gif"><div align="left"><font color="#FFFFFF">问题回复</font></div></td>
        </tr>
      </table></td>
    </tr>
  </table>
  <form name="form1" method="post" action="">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">
      <tr>
        <td colspan="3" class="td_02"><SPAN class=td_title>查询</SPAN></td>
      </tr>
      <tr>
        <td width="3%" class="td_02">查询</td>
        <td width="15%" class="td_02"><input align="left" width="5%" type="text" id="chaxun" name="chaxun"><input align="right" id="chaxun2" type="button"value="查询"></td>
        <td width="60%" class="td_02">

        </td>
      </tr>
    </table>
    <br>
    <table id="mytable" width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">
    
      <tr>
        <td colspan="5" align="right" class="td07"><img src="../../images/1.gif" width="4" height="5" align="absmiddle"> 首页　 <img src="../../images/2.gif" width="3" height="5" align="absmiddle"> 上一页　 <img src="../../images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页　 <img src="../../images/3.gif" width="4" height="5" align="absmiddle"> 末页　　共" +${pageInfo.pages}"+ 页 1 条记录</td>
      </tr>
      <tr>
      <tr>
        <td width="3%" class="td_top">编号</td>
        <td width="5%" class="td_top">挂牌日期</td>
        <td width="4%" class="td_top">挂牌人</td>
        <td width="3%" class="td_top">班组</td>
        <td width="4%" class="td_top">模块分类</td>
        <td width="6%" class="td_top">异常分类</td>
        <td width="3%" class="td_top">优先级</td>
        <td width="3%" class="td_top">区域</td>
        <td width="3%" class="td_top">生产线</td>
        <td width="6%" class="td_top">设备</td>
        <td width="12%" class="td_top">异常描述</td>
        <td width="6%" class="td_top">审核意见</td>
        <td width="4%" class="td_top">状态</td>
        <td  width="6%" class="td_top">摘牌</td>

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
          <%--<td width="6%" class="td_02"><input name="suggestion" type="text" class="input" style="width:99% "></td>--%>
          <%--<td class="td07"><a href="#" onClick="shanchu(${unlist.id})">未通过</a></td>--%>
          <td class="td07"><a href="#" onClick="openChildenWindowzhaipai(${unlist.id})">摘牌</a>
          </td>
        </tr>
      </c:forEach>
    </table>
    <p>&nbsp;</p>
  </form>
</center>
</body>
</html>
