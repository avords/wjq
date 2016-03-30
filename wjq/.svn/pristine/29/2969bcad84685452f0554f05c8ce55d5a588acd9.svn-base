<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>万家桥-首页</title>
<jdf:themeFile file="css/home_list.css" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<jdf:themeFile file="bootstrap.min.js" />
</head>
<body>
	<div class="container">
		<div class="list-focus clearfix">
		 <c:if test="${fn:length(topArticles)>0}">
		  <c:if test="${!empty topArticles[0].titleImage}">
			<div class="pic">
				<a href="#">
					<h3>${topArticles[0].title }</h3><img width="420px;" src="${dynamicDomain }${topArticles[0].titleImage}" />
				</a>
			</div>
		</c:if>
		   <c:choose>
		       <c:when test="${!empty topArticles[0].titleImage}">
		           <div class="news">
		       </c:when>
		       <c:otherwise>
		           <div class="news" style="width:1000px;">
		       </c:otherwise>
		   </c:choose>
					<dl>
						<dt>
							<a target="_blank" href="${dynamicDomain }/home/index/${moduleId}/detail/${topArticles[0].objectId}">${topArticles[0].title }</a>
						</dt>
						<dd>
							${topArticles[0].summary }
							<span><a class="red" target="_blank" href="${dynamicDomain }/home/index/${moduleId}/detail/${topArticles[0].objectId}">[查看全文]</a></span>
						</dd>
					</dl>
					<ul>
					    <c:forEach items="${topArticles }" begin="1" var="item" varStatus="status">
						    <li><span><fmt:formatDate value="${item.publishDate }" pattern="yyyy-MM-dd"/></span><a target="_blank" href="${dynamicDomain }/home/index/${moduleId}/detail/${item.objectId}">${item.title }</a></li>
						</c:forEach>
					</ul>
			</div>
			</c:if>
			<div></div>
		</div>
		<div class="list-inner clearfix">
			<div class="listCont">
				<div class="sort">
					<span>${channel.name }</span>
				</div>
				<c:forEach items="${pageSearch.list }" var="item" varStatus="status">
					<div class="text">
<%-- 						<img src="<jdf:theme/>/img/home/list_bd_pic1.jpg" /> --%>
						<dl>
							<dt>
								<span>Date：<fmt:formatDate value="${item.publishDate }" pattern="yyyy-MM-dd HH:mm:ss"/> </span><a target="_blank" href="${dynamicDomain }/home/index/${moduleId}/detail/${item.objectId}">${item.title }</a>
							</dt>
							<dd>${item.summary }</dd>
							<dd>
<!-- 								<a class="btn btn-blue" href="#">留学方案</a> -->
								<a class="btn btn-orange" target="_blank" href="${dynamicDomain }/home/index/${moduleId}/detail/${item.objectId}">查看详情</a>
							</dd>
						</dl>
					</div>
	            </c:forEach>
				<!-- 分页 -->
				<div class="pagination" id="pagination">
				    <div class="page_numbers"></div>
				</div>
				<!--/ 分页 -->
			</div>
			<div class="listSide">
				<!-- 套餐推荐 -->
<!-- 				<div class="package"> -->
<!-- 					<div class="title"> -->
<!-- 						<span>+更多</span>套餐推荐 -->
<!-- 					</div> -->
<!-- 					<ul class="tc-bd"> -->
<%-- 						<li><a href="#"><img src="<jdf:theme/>/img/home/list_tc_pic1.jpg" /></a> --%>
<!-- 							<dl> -->
<!-- 								<dt> -->
<!-- 									<a href="#">澳大利亚名校留学申请+澳大利亚签证服务优惠套餐</a> -->
<!-- 								</dt> -->
<!-- 								<dd>¥2999.00</dd> -->
<!-- 							</dl></li> -->
<%-- 						<li><a href="#"><img src="<jdf:theme/>/img/home/list_tc_pic2.jpg" /></a> --%>
<!-- 							<dl> -->
<!-- 								<dt> -->
<!-- 									<a href="#">澳大利亚名校留学申请+澳大利亚签证服务优惠套餐</a> -->
<!-- 								</dt> -->
<!-- 								<dd>¥17789.00</dd> -->
<!-- 							</dl></li> -->
<%-- 						<li><a href="#"><img src="<jdf:theme/>/img/home/list_tc_pic3.jpg" /></a> --%>
<!-- 							<dl> -->
<!-- 								<dt> -->
<!-- 									<a href="#">澳大利亚名校留学申请+澳大利亚签证服务优惠套餐</a> -->
<!-- 								</dt> -->
<!-- 								<dd>¥6899.00</dd> -->
<!-- 							</dl></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
				<!--/套餐推荐-->
	
				<!-- 二维码 -->
				<div class="telQR">
					<p class="tel">
						<img src="<jdf:theme/>/img/home/icon_tel.png" />
					</p>
					<p class="QR">
						<img src="<jdf:theme/>/img/home/QR.png" /><span class="tit">万家桥官方微信</span> <span>一步上桥
							万事搞定<br> 出国桥梁 游子家园
						</span>
					</p>
				</div>
				<!--/ 二维码 -->
	
				<!-- 一周排行 -->
<!-- 				<div class="rank"> -->
<!-- 					<div class="title"> -->
<!-- 						<span>+更多</span>套餐推荐 -->
<!-- 					</div> -->
<!-- 					<div class="cont"> -->
<!-- 						<a href="#"><i class="red">1</i>大学生什么时间考雅思比较</a> <a href="#"><i -->
<!-- 							class="red">2</i>雅思口语如何有效的自我复习</a> <a href="#"><i class="red">3</i>必备雅思口语短语大总结</a> -->
<!-- 						<a href="#"><i>4</i>解析雅思听力校园生活场景</a> <a href="#"><i>5</i>大学生什么时间考雅思比较</a> -->
<!-- 						<a href="#"><i>6</i>雅思口语如何有效的自我复习</a> <a href="#"><i>7</i>必备雅思口语短语大总结</a> -->
<!-- 						<a href="#"><i>8</i>大学生什么时间考雅思比较</a> <a href="#"><i>9</i>雅思口语如何有效的自我复习</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<!--/一周排行-->
	
				<!-- 聊聊吧 -->
				<div class="talk">
					<div class="title2">
						<span><a href="${dynamicDomain }/home/post" target="_blank">+进入交流</a></span>无事聊聊
					</div>
					<div class="cont">
						<ul>
						    <c:forEach items="${newestPosts }" var="item" varStatus="status">
								<li>
									<p>
										<a href="${dynamicDomain }/home/postComment?postId=${item.objectId}"  target="_blank">${item.name }</a>
									</p> <span><i class="red">${item.memberLoginName }</i> 发表于：<fmt:formatDate value="${item.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!--/聊聊吧-->
			</div>
		</div>
		<%@ include file="home_service.jsp"%>
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
                window.location.href = "${dynamicDomain}/home/index/${moduleId}?ec_p="+page;
           }
        });
       </c:if>
	});
	</script>
</body>
</html>