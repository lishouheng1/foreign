<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no,minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="no">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>挂牌系统</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../js/tree.js"></script>
    <script language="javascript" src="../js/jquery-3.3.1.min.js"></script>
</head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top" class="td03"><br>
      <table width="90%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="25" class="F01"><p><img src="../images/index_35.gif" width="12" height="16" align="absmiddle"><strong>蒙牛挂牌系统</strong></p>
          </td>
        </tr>
        <tr>
          <td height="2" background="../images/index_39.gif"><img src="../images/spacer.gif" width="1" height="1"></td>
        </tr>
      </table>
        <table width="90%" border="0" cellpadding="0" cellspacing="0" class="td01">
          <tr>
            <td width="12">&nbsp;</td>
            <td width="628"><p><img src="../images/spacer.gif" width="1" height="1"><img src="../images/index_35.gif" width="12" height="16" align="absmiddle"><strong>快速通道</strong></p>
			
          <tr>
            <td background="../images/index_41.gif">&nbsp;</td>
            <td>
              
            	
            	
            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>
                	    <c:forEach items="${functions}" var="fun">
                            <c:choose>
                                <c:when test="${fun.level == 1}">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="19"><img id="top_4" onClick="menu('menu_4','top_4');" src="../images/tree_11.gif" width="19" height="20"></td>
                                            <td width="19"><img src="../images/tree_27.gif" width="19" height="20"></td>
                                            <td nowrap>${fun.functionName}</td>
                                        </tr>
                                    </table>
                                </c:when>
                                <c:when test="${fun.level == 2}">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="19"><img src="../images/tree_06.gif" width="19" height="20"></td>
                                            <td width="19"><img id="top_5" onClick="menu('menu_5','top_5');" src="../images/tree_11.gif" width="19" height="20"></td>
                                            <td width="19"><img src="../images/tree_08.gif" width="19" height="20"></td>
                                            <td nowrap>${fun.functionName}</td>
                                        </tr>
                                    </table>
                                </c:when>
                                <c:when test="${fun.level == 3}">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="19"><img src="../images/tree_06.gif" width="19" height="20"></td>
                                            <td width="19"><img src="../images/tree_06.gif" width="19" height="20"></td>
                                            <td width="19"><img src="../images/tree_07.gif" width="19" height="20"></td>
                                            <td width="19"><img src="../images/tree_14.gif" width="19" height="20"></td>
                                            <td nowrap><a href="${fun.functionUrl}" target="mainFrame" class="a03">${fun.functionName}</a></td>
                                        </tr>
                                    </table>
                                </c:when>
                            </c:choose>

                        </c:forEach>


            </table></td>
            <td width="10" background="../images/index_43.gif">&nbsp;</td>
          </tr>
          <tr>
            <td><img src="../images/index_50.gif" width="12" height="12"></td>
            <td background="../images/index_51.gif"><img src="../images/spacer.gif" width="1" height="1"></td>
            <td><img src="../images/index_53.gif" width="12" height="12"></td>
          </tr>
      </table>
        <br>
    </td>
  </tr>
</table>
</body>
</html>
