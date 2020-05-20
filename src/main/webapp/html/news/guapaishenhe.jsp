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
function openChildenWindowshenhe(id) {
//    以子窗口的形式打开请求所要跳转的页面
    window.open("toshenhePage.do?id="+id,null,"width=670,height=300");

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
          <td height="30" valign="middle" background="../../images/bg_03.gif"><div align="left"><font color="#FFFFFF">挂牌审核</font></div></td>
        </tr>
      </table></td>
    </tr>
  </table>
  <form name="form1" method="get" action="/weishengheUnlist.do">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">
      <tr>
        <td colspan="3" class="td_02"><SPAN class=td_title>查询</SPAN></td>
        <td><a href="/downexcel.do">导出挂牌清单</a></td>
      </tr>
      <tr>
        <td align="lett" width="4%" class="td_02">模块</td>
        <td align="lett" width="7%" class="td_02"> <select id="mtype" name="mtype" class="input" style="width:99% " >
          <option value="0" ${mtype=="0"?'selected':''} >--全部--</option>
          <option value="AC" ${(mtype==null)?(sessionScope.user.usum=="AC"?'selected':''):(mtype=="AC"?'selected':'')}>--AC--</option>
          <option value="AM" ${(mtype==null)?(sessionScope.user.usum=="AM"?'selected':''):(mtype=="AM"?'selected':'')}>--AM--</option>
          <option value="5S" ${(mtype==null)?(sessionScope.user.usum=="5S"?'selected':''):(mtype=="5S"?'selected':'')}>--5S--</option>
          <option value="点检" ${mtype=="点检"?'selected':''}>--点检--</option>
        </select>
        <td align="lett" width="3%">
          <input name="chaxun" type="submit" class="buttonface02" value="查询">
        </td>
        <td  width="86%" class="td_02">
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


    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">
    
      <tr>
        <td colspan="5" align="right" class="td07"><a disabled="false" href="/weishengheUnlist.do?pageNo=1&mtype=${mtype}"${pageInfo.hasPreviousPage?"":"style='display: none' "}><img src="../../images/1.gif" width="4" height="5" align="absmiddle"> 首页</a>　<a href="/weishengheUnlist.do?pageNo=${pageInfo.prePage}&mtype=${mtype}"${pageInfo.hasPreviousPage?"":"style='display: none' "}> <img src="../../images/2.gif" width="3" height="5" align="absmiddle"> 上一页</a>　<a href="/weishengheUnlist.do?pageNo=${pageInfo.pageNum+1}&mtype=${mtype}"${pageInfo.hasNextPage?"":"style='display: none' "}> <img src="../../images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页　</a><a href="/weishengheUnlist.do?pageNo=${pageInfo.pages}&mtype=${mtype}"${pageInfo.hasNextPage?"":"style='display: none' "}> <img src="../../images/3.gif" width="4" height="5" align="absmiddle"> 末页</a>　　当前第${pageInfo.pageNum}页  共${pageInfo.pages}页${pageInfo.total}条记录</td>
      </tr>
      <tr>
        <td width="7%" class="td_top">编号</td>
        <td width="8%" class="td_top">挂牌日期</td>
        <td width="8%" class="td_top">挂牌人</td>
        <td width="5%" class="td_top">班组</td>
        <td width="7%" class="td_top">模块分类</td>
        <td width="10%" class="td_top">异常分类</td>
        <td width="5%" class="td_top">优先级</td>
        <td width="6%" class="td_top">区域</td>
        <td width="8%" class="td_top">设备</td>
        <td width="20%" class="td_top">异常描述</td>
        <%--<td width="6%" class="td_top">审核意见</td>--%>
        <td colspan="2" width="6%" class="td_top">审核</td>

      </tr>
      <c:forEach items="${pageInfo.list}" var="unlist">
        <tr>
          <td class="td07">${unlist.id}</td>
          <td class="td07">${unlist.cdate}</td>
          <td class="td07">${unlist.reporter}</td>
          <td class="td07">${unlist.classnum}</td>
          <td class="td07">${unlist.mtype}</td>
          <td class="td07">${unlist.etype}</td>
          <td class="td07">${unlist.priority}</td>
          <td class="td07">${unlist.area}</td>
          <td class="td07">${unlist.equipment}</td>
          <td class="td07">${unlist.cdescribe}</td>
          <%--<td width="6%" class="td_02"><input name="suggestion" type="text" class="input" style="width:99% "></td>--%>
          <%--<td class="td07"><a href="#" onClick="shanchu(${unlist.id})">未通过</a></td>--%>
          <td class="td07"><a href="#" ${unlist.mtype!=sessionScope.user.usum && sessionScope.user.usum!=null&&sessionScope.user.usid!="1"?"style='display: none' ": "" } onClick="openChildenWindowshenhe(${unlist.id})">审核</a>
          </td>
        </tr>
      </c:forEach>
    </table>
    <p>&nbsp;</p>
  </form>
</center>
</body>
</html>
