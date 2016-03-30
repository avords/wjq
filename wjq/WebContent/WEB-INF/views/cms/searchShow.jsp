<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>搜索结果</title>
<jdf:themeFile file="css/home_list.css" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<jdf:themeFile file="bootstrap.min.js" />
<%
	String val =(String)request.getAttribute("val");
    String keyWords=(String)request.getAttribute("keyWords");
%>
</head>
<body>
     <c:choose>
		<c:when test="${empty pageSearch.list }">
		    <div style="font-size:30px;margin-left: 400px;color:#999 ">未能搜索到结果，请重新输入！</div>
		      </c:when>
		          <c:otherwise>
						<div class="list-inner clearfix" style="margin-left: 230px">
								<div class="listCont" style="width:80%">
									 <c:forEach var="titles" items="${pageSearch.list}">
										<div class="text" style="height:40px;width: 100%;font-size: 13px; color: #999; ">
											<dl>
												<dt>
												    <div style=" white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
													     <a href="${dynamicDomain }/home/index/content/${titles.objectId}" style="font-size:20px;color:#09c" target="_blank">${titles.title }</a>
												    </div>
												</dt>
												<dd>
												    <div style=" white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
												    	<span style="font-size:10px">${titles.summary}</span>
												    </div>
												</dd>
											</dl>
										</div>
						            </c:forEach>
									<!-- 分页 -->
									<div class="pagination" id="pagination" style="margin-left: 300px">
									    <div class="page_numbers"></div>
									</div>
									<!--/ 分页 -->
								</div>
							</div>
						<script type="text/javascript">
						$(function(){
							<c:if test="${pageSearch.totalPage != 0}">
					        $("#pagination").twbsPagination({
					              totalPages: ${pageSearch.totalPage},
					              visiblePages: 5,
					              startPage:${pageSearch.currentPage},
					              onPageClick: function (event, page) {
					                $('#page-content').text('Page ' + page);
					                window.location.href = "${dynamicDomain}/home/index/show?val=${val}&keyword=${keyWords}&ec_p="+page;
					           }
					        });
					       </c:if>
						});
				 </script>
	       </c:otherwise>
	 </c:choose>
</body>
</html>