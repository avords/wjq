<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mvc.framework.util.DomainUtils"%>
<jdf:themeFile file="onlineMessage.js" />
<jdf:themeFile file="css/home_service.css" />
<%
	String dynamicDomain = DomainUtils.getDynamicDomain();
    request.setAttribute("dynamicDomain",dynamicDomain);
%>
<c:if test="${!empty channel_5 }">
<div class="business clearfix">
   <c:forEach items="${channel_5.subChannels }" var="item" varStatus="status">
	    <a href="${dynamicDomain }/home/index/${item.objectId}/directDetail" class="icon1" style="background:#f9f9f9 url(${dynamicDomain}/${item.pictureAddress }) no-repeat 15px center;padding-left: 76px;margin-right: 0px;" target="_blank">${item.name }</a>
   </c:forEach>
</div>
</c:if>
<div class="pull-right"  style="position: fixed;top: 300px;right: 0px;">
		<a  href="javascript:openOnlineMessage();" class="btn btn-primary">
            <img src="<jdf:theme/>img/icon_yw_img4.png" />
        </a>
</div>
<div id="back" style="display:none;" onclick="closeOnlineMessage()"></div>
<div id="win" style="display:none;">
        <div id="winTitle"><span id="winSpan">在线留言</span></div>
        <table id="winTable">
        	<tr>
        		<td> <span >留言主题:</span></td>
        		<td><input type="text" id="title" name="title" maxlength="20" placeholder="最大输入长度为20" onkeyup="replaceSpace(this)" onkeydown="replaceSpace(this)"></td>
        	</tr>
        	<tr>
        		<td><span >留言内容:</span></td>
        		<td><textarea rows="6" cols="50" id="content" name="content" maxlength="120" placeholder="最大输入长度为120"></textarea></td>
        	</tr>
        </table>
        <button id="butt1" type="button" class="btn btn-success"  onclick="saveOnlineMessage()" ><span>保存留言</span></button>
</div>
<script type="text/javascript">
function saveOnlineMessage(){
	 if($("#title").val()==''){
        alert('请填写标题！');
        return false;
    }
		if($("#content").val()==''){
        alert('请留下你想说的话！');
        return false;
    }
	 	var title=$("#title").val();
	 	var content=$("#content").val();
		$.ajax({
			type:'post',
			url:'${dynamicDomain}/home/index/saveOnlineMessage',
			dataType:'json',
			data:"title="+ title+"&content="+content,
           success:function(msg){
	        	if(msg.result){
	        		alert("留言成功！");
	        		closeOnlineMessage();
	        	}else if(msg.isHaveSensitiveword){
	        		alert("请不要发表含有不适当内容的留言！");
	        		$("#title").val("");
	        		$("#content").val("");
	        	}
		     }
       });
	}

</script>	