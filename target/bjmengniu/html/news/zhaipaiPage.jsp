<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审核页面</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
  <script language="javascript" src="../../js/jquery-3.3.1.min.js"/>
  <script language="javascript" src="../../js/util.js"></script>
<script>
    function add_tr(obj) {
        var tr = $(obj).parent().parent();
        tr.after(tr.clone());
    }
    function del_tr(obj) {
        $(obj).parent().parent().remove();
    }

 function weitongguo() {
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




</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style="overflow-y:scroll">
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
  <form name="form1" method="post" action="/insertFinishUser.do">
    <input type="hidden" name="id" value="${unlist.id}">
    <input id="status" type="hidden" name="status" >
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">
      <tr>
        <td colspan="9" class="td_02" align="center">挂牌</td>
      </tr>
      <tr>
        <td width="5%" class="td_02">挂牌人</td>
        <td width="10%" class="td_02">${unlist.reporter}</td>
        <td width="5%" class="td_02">班组</td>
        <td width="10%" class="td_02">${unlist.classnum}</td>
        <td width="7%" class="td_02">模块分类</td>
        <td width="10%" class="td_02">${unlist.mtype}</td>
        <td width="10%" class="td_02">异常分类</td>
        <td width="17%" class="td_02">
          ${unlist.etype}
       </td>

      </tr>
      <tr>
        <td width="8%" class="td_02">优先级</td>
        <td width="8%" class="td_02">${unlist.priority}</td>
        <td width="8%" class="td_02">区域</td>
        <td width="8%" class="td_02">${unlist.area}</td>
        <td width="8%" class="td_02">设备</td>
        <td width="8%" class="td_02">${unlist.equipment}</td>
        <td width="8%" class="td_02">审核意见</td>
        <td  width="12%" class="td_02">${unlist.suggestion}</td>
      </tr>

      <tr>
        <td class="td_02">问题描述</td>
        <td colspan="8" class="td_02">${unlist.cdescribe}</td>
      </tr>
      <tr>
        <td width="15%" class="td_02">实际用时(分钟)</td>
        <td width="8%" class="td_02"><input id="ftime"  name="ftime" type="text" class="input" style="width:99% "></td>
        <td colspan="6" width="15%" class="td_02"></td>
      </tr>
      <tr>
        <td width="9%" class="td_02">完成人</td>
        <td id="utd" width="8%" class="td_02"><input id="user"  name="user" type="text" class="input" list="batch_list" autocomplete="off" onkeyup="mohuchaxun(this)" style="width:99% "><datalist id="batch_list"><option label="你好"></option> </datalist>
        </td>
        <td width="8%" class="td_02"><input  value="增加" name="insertUser" type="button" class="input" onclick="add_tr(this)" style="width:99% "></td><td width="8%" class="td_02"><input  value="删除" name="insertUser" type="button" class="input" onclick="del_tr(this)" style="width:99% "></td>
        <td colspan="4" width="15%" class="td_02"></td>
      </tr>
      <tr>
        <div id="word"></div>
      </tr>
      <tr>
        <td class="td_02">维修过程描述</td>
        <td colspan="8" class="td_02"><textarea id="fdescribe" name="fdescribe" rows="5" style="width:99% "></textarea>
        </td>
      </tr>
    </table><br>
    <br>
    <table width="95%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td class="td_page"><div align="center">
            
            <input name="Submit" type="button" class="buttonface02" value="  完成  " onclick="tongguo()">
            &nbsp;&nbsp;
            <%--<input name="Submit" type="reset" class="buttonface02" value="  重 置  ">--%>
            <%--&nbsp;--%>
          <%--<input name="Submit" type="button" class="buttonface02" value="  未通过  " onClick="weitongguo()">--%>
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
    function tongguo()
    {
        var fdescribe = document.getElementById("fdescribe").value;

        var ftime = document.getElementById("ftime").value;
        var users="";
        var user = document.getElementsByName("user");
        if (user!=null){
            for(var i= 0;i<user.length;i++) {
                if(i!=user.length-1){
                    users+=user.item(i).value+",";
                }else {
                    users+=user.item(i).value;
                }

            }
        }else {
            alert("请输入完成人！")
        }




        alert(users);

      // location.href="/insertFinishUser.do?users="+users+"&fdescribe="+fdescribe+"&ftime="+ftime;

        document.write("<form action='/insertFinishUser.do' method='post' name='form2' style='display:none'>");
        document.write("<input type='hidden' name='users' value="+users+">");
        document.write("<input type='hidden' name='fdescribe' value="+fdescribe+">");
        document.write("<input type='hidden' name='ftime' value="+ftime+">");
        document.write("<input type='hidden' name='id' value='${unlist.id}'>");
        document.write("</form>");
        document.form2.submit();

    }
    function mohuchaxun(obj){
//当键盘键被松开时发送Ajax获取数据
        var keywords = obj.value;
        var pattern = new RegExp("[\u4E00-\u9FA5]+");
            if(keywords==""||!pattern.test(keywords)){return;
            }else {
                var url="/mohuchaxun.do";
                $.post(
                    url,
                    {
                        key:keywords
                    },
                    function(list) {
                        $(obj).next("#batch_list").empty();
                        for (var i = 0; i < list.length; i++) {
                            $(obj).next("#batch_list").append('<option label="'+list[i]+'" value="'+list[i]+'"></option>');
                        }

                    })


            }








    }

</script>
</html>
