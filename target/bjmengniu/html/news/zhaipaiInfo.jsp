<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>栏目管理</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="../../js/jquery-3.3.1.min.js"/>
<script language="javascript" src="../../js/util.js"></script>
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
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
          <td height="30" valign="middle" background="../../images/bg_03.gif"><div align="left"><font color="#FFFFFF">摘牌信息</font></div></td>
        </tr>
      </table></td>
    </tr>
  </table>
  <form name="form1" action="/selectZhaipaiInfo.do">
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">
          <tr>
              <td colspan="10" class="td_02"><SPAN class=td_title>查询</SPAN></td>
          </tr>
          <tr>
              <td width="10%" class="td_02">
                      <label>开始日期：</label>
                      <input type="date" id="start" name="start" value="${start}"/>
              </td>
              <td valign="bottom" width="1%" class="td_02">到</td>
              <td width="10%" class="td_02">
                  <label>结束日期：</label>
                  <input type="date" id="end" name="end" value="${end}"/>
              </td>
              <td width="10%" class="td_02">
                  <label>排名规则：</label>
                  <select id="column" name="column" class="input" style="width:99% ">
                      <option value="tol" ${column==null?'selected':''}>--请选择--</option>
                      <option value="etype1" ${column=="etype1"?'selected':''}>1.微小缺陷</option>
                      <option value="etype2" ${column=="etype2"?'selected':''}>2.不在基本状态</option>
                      <option value="etype3" ${column=="etype3"?'selected':''}>3.死角</option>
                      <option value="etype4" ${column=="etype4"?'selected':''}>4.污染源</option>
                      <option value="etype5" ${column=="etype5"?'selected':''}>5.质量隐患</option>
                      <option value="etype6" ${column=="etype6"?'selected':''}>6.不必要的物品</option>
                      <option value="etype7" ${column=="etype7"?'selected':''}>7.安全隐患</option>
                      <option value="sumtime" ${column=="sumtime"?'selected':''}${type=="挂牌"?'style="display:none"':''}>摘牌工时</option>
                      <option value="sumscore" ${column=="sumscore"?'selected':''}>${type}得分</option>
                  </select>
              </td>
              <td width="10%" class="td_02">
              <label>部门分类：</label>
              <select id="dempt" name="dempt" class="input" style="width:99% ">
                  <option value="tol" ${dempt==null?'selected':''}>--请选择--</option>
                  <option value="运营处" ${dempt=="运营处"?'selected':''}>运营处</option>
                  <option value="设备处" ${dempt=="设备处"?'selected':''}>设备处</option>
                  <option value="安环动力处" ${dempt=="安环动力处"?'selected':''}>安环动力处</option>
                  <option value="人事行政处" ${dempt=="人事行政处"?'selected':''}>人事行政处</option>
                  <option value="物流处" ${dempt=="物流处"?'selected':''}>物流处</option>
                  <option value="供应处" ${dempt=="供应处"?'selected':''}>供应处</option>
                  <option value="北京工厂" ${dempt=="北京工厂"?'selected':''}>北京工厂</option>
                  <option value="区域办公室" ${dempt=="区域办公室"?'selected':''}>区域办公室</option>
                  <option value="君乐宝加工地" ${dempt=="君乐宝加工地"?'selected':''}>君乐宝加工地</option>
                  <option value="检验管理处" ${dempt=="检验管理处"?'selected':''}>检验管理处</option>
              </select>
          </td>
              <td width="10%" class="td_02">
                  <label>数据分类：</label>
                  <select id="type" name="type" class="input" style="width:99% ">
                      <option value="摘牌" ${type!="挂牌"?'selected':''}>--摘牌--</option>
                      <option value="挂牌" ${type=="挂牌"?'selected':''}>--挂牌--</option>
                  </select>
              </td>
              <td>
                  <input valign="bottom" type="submit" name="chaxun" class="buttonface02" value="查询"/>
              </td>
              <td width="40%" class="td_02"></td>
          </tr>
      </table>
      <%--<div id="main" style="width: 800px;height:400px;"></div>--%>
      <%--<script type="text/javascript">--%>
          <%--// 基于准备好的dom，初始化echarts实例--%>
           <%--var myChart = echarts.init(document.getElementById('main'));--%>

          <%--// 指定图表的配置项和数据--%>
          <%--option = {--%>
              <%--legend: {},--%>
              <%--tooltip: {},--%>
              <%--dataset: {--%>
                  <%--source: [--%>
                      <%--['product', '2012', '2013', '2014', '2015'],--%>
                      <%--['Matcha Latte', 41.1, 30.4, 65.1, 53.3],--%>
                      <%--['Milk Tea', 86.5, 92.1, 85.7, 83.1],--%>
                      <%--['Cheese Cocoa', 24.1, 67.2, 79.5, 86.4]--%>
                  <%--]--%>
              <%--},--%>
              <%--xAxis: [--%>
                  <%--{type: 'category', gridIndex: 0},--%>
                  <%--{type: 'category', gridIndex: 1}--%>
              <%--],--%>
              <%--yAxis: [--%>
                  <%--{gridIndex: 0},--%>
                  <%--{gridIndex: 1}--%>
              <%--],--%>
              <%--grid: [--%>
                  <%--{bottom: '55%'},--%>
                  <%--{top: '55%'}--%>
              <%--],--%>
              <%--series: [--%>
                  <%--// These series are in the first grid.--%>
                  <%--{type: 'bar', seriesLayoutBy: 'row'},--%>
                  <%--{type: 'bar', seriesLayoutBy: 'row'},--%>
                  <%--{type: 'bar', seriesLayoutBy: 'row'},--%>
                  <%--// These series are in the second grid.--%>
                  <%--{type: 'bar', xAxisIndex: 1, yAxisIndex: 1},--%>
                  <%--{type: 'bar', xAxisIndex: 1, yAxisIndex: 1},--%>
                  <%--{type: 'bar', xAxisIndex: 1, yAxisIndex: 1},--%>
                  <%--{type: 'bar', xAxisIndex: 1, yAxisIndex: 1}--%>
              <%--]--%>
          <%--};--%>


          <%--// 使用刚指定的配置项和数据显示图表。--%>
           <%--myChart.setOption(option);--%>
      <%--</script>--%>
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">

      <tr>
        <td colspan="7" align="right" class="td07"><a href="/selectZhaipaiInfo.do?column=${column}&start=${start}&end=${end}&type=${type}"${pageInfo.hasPreviousPage?"":" onclick='return false'"}><img src="../../images/1.gif" width="4" height="5" align="absmiddle"> 首页</a> <a  href="/selectZhaipaiInfo.do?column=${column}&start=${start}&end=${end}&pageNo=${pageInfo.prePage}&type=${type}"${pageInfo.hasPreviousPage?"":" onclick='return false'"}><img src="../../images/2.gif" width="3" height="5" align="absmiddle"> 上一页</a>　<a  href="/selectZhaipaiInfo.do?column=${column}&start=${start}&end=${end}&pageNo=${pageInfo.pageNum+1}&type=${type}"${pageInfo.hasNextPage?"":" onclick='return false'"}> <img src="../../images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页</a>　<a href="/selectZhaipaiInfo.do?column=${column}&start=${start}&end=${end}&pageNo=${pageInfo.pages}&type=${type}" ${pageInfo.hasNextPage?"":" onclick='return false'"}> <img src="../../images/3.gif" width="4" height="5" align="absmiddle"> 末页</a>   共${pageInfo.pages}页当前第${pageInfo.pageNum}页  ${pageInfo.total}条记录</td><td colspan="7" align="right" class="td07"></td>
      </tr>
      <tr>
        <td align="center" width="3%" class="td_top">工号</td>
        <td align="center" width="5%" class="td_top">姓名</td>
        <td align="center" width="4%" class="td_top">${type}总数</td>
        <td align="center" width="8%" class="td_top">微小缺陷数量</td>
        <td align="center" width="8%" class="td_top">不在基本状态数量</td>
        <td align="center" width="8%" class="td_top">死角数量</td>
        <td align="center" width="8%" class="td_top">污染源数量</td>
        <td align="center" width="8%" class="td_top">质量隐患数量</td>
        <td align="center" width="8%" class="td_top">不必要的物品数量</td>
        <td align="center" width="8%" class="td_top">安全隐患数量</td>
        <td align="center" width="8%" class="td_top" ${type=="挂牌"?'style="display:none"':''}>摘牌工时</td>
          <td align="center" width="8%" class="td_top">${type}得分</td>
        <td colspan="2" width="13%" class="td_top"></td>

      </tr>
      <c:forEach items="${pageInfo.list}" var="zhaipaiuser">
        <tr>
          <td align="center" class="td07">${zhaipaiuser.username}</td>
          <td align="center" class="td07">${zhaipaiuser.name}</td>
          <td align="center" class="td07">${zhaipaiuser.tol}</td>
          <td align="center" class="td07">${zhaipaiuser.etype1}</td>
          <td align="center" class="td07">${zhaipaiuser.etype2}</td>
          <td align="center" class="td07">${zhaipaiuser.etype3}</td>
          <td align="center" class="td07">${zhaipaiuser.etype4}</td>
          <td align="center" class="td07">${zhaipaiuser.etype5}</td>
          <td align="center" class="td07">${zhaipaiuser.etype6}</td>
          <td align="center" class="td07">${zhaipaiuser.etype7}</td>
          <td align="center" class="td07"${type=="挂牌"?'style="display:none"':''}>${zhaipaiuser.sumtime}</td>
            <td align="center" class="td07">${zhaipaiuser.sumscore}</td>
          <td colspan="2" class="td07"></td>
          <%--<td width="6%" class="td_02"><input name="suggestion" type="text" class="input" style="width:99% "></td>--%>
          <%--<td class="td07"><a href="#" onClick="shanchu(${unlist.id})">未通过</a></td>--%>
        </tr>
      </c:forEach>
    </table>
    <p>&nbsp;</p>
  </form>
</center>
</body>
</html>
