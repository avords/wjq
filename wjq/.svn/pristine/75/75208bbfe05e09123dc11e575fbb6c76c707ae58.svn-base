<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!--底部-->
<div id="footer">
<c:if test="${!empty channel_6 }">
	<div class="bottom">
	    <c:forEach items="${channel_6.subChannels }" var="item" varStatus="status">
	        <c:choose>
	            <c:when test="${status.first }">
	                <a href="${dynamicDomain }/home/index/${item.objectId}/directDetail" target="_blank">${item.name }</a>
	            </c:when>
	            <c:otherwise>
	                 |  <a href="${dynamicDomain }/home/index/${item.objectId}/directDetail" target="_blank">${item.name }</a>
	            </c:otherwise>
	        </c:choose>
	   </c:forEach>
	   <br>
       沪ICP备16000842号    | Copyright © 2015-2018 万家桥电子商务（上海）有限公司 版权所有
	</div>
</c:if>
</div>
<!--/底部-->
<jdf:themeFile file="code.js" />