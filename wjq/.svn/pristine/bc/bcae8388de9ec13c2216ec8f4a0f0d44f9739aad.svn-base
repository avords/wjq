<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>万家桥-首页</title>
<jdf:themeFile file="css/home_list.css" />
<jdf:themeFile file="jquery-1.42.min.js" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
</head>
<body>
	<div class="container">
		<div class="list-inner clearfix">
			<div class="pageCont">
				<div class="crumb">
					当前位置： <a href="${dynamicDomain }/home/index">首页</a> 
					<c:forEach items="${parentChannels }" var="item" varStatus="status">
					> <a href="javascript:void(0);">${item.name }</a>
					</c:forEach>
					 ><a href="${dynamicDomain }/home/index/${channel.objectId}">${channel.name }</a>
					 >全文
				</div>
				<div class="pageText">
					<div class="title">
						<h1>${content.title }</h1>
						<p>时间：<fmt:formatDate value="${content.publishDate }" pattern="yyyy-MM-dd HH:mm:ss"/> <c:if test="${!empty content.origin }">来源：${content.origin }</c:if> <c:if test="${!empty content.origin }">作者：${content.author }</c:if> 点击量：${content.visitorCount }</p>
					</div>
					<div class="tag clearfix">
						<em>关键字： ${content.keyWords }</em>
					</div>
					<div class="article" style="word-wrap:break-word;">
						${content.contentTxt.txt }
					</div>

					<div class="share clearfix">
						<!-- JiaThis Button BEGIN -->
						<span>分享到：</span>
						<div style="float: left;" class="jiathis_style_24x24">
							<a class="jiathis_button_qzone"></a> <a
								class="jiathis_button_tsina"></a> <a class="jiathis_button_tqq"></a>
							<a class="jiathis_button_weixin"></a> <a
								class="jiathis_button_renren"></a> <a
								href="http://www.jiathis.com/share"
								class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
							<a class="jiathis_counter_style"></a>
						</div>
						<script type="text/javascript"
							src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
						<!-- JiaThis Button END -->
					</div>

<!-- 					<div class="same clearfix"> -->
<!-- 						<h3>相关搜索推荐：</h3> -->
<!-- 						<ul> -->
<!-- 							<li><a href="#">中国老师骂哭英国学生</a></li> -->
<!-- 							<li><a href="#">希腊生活中的交通详情介绍</a></li> -->
<!-- 							<li><a href="#">美国私立高中申请条件有哪些？</a></li> -->
<!-- 							<li><a href="#">美女老师被学生家长</a></li> -->
<!-- 							<li><a href="#">中国老师骂哭英国学生</a></li> -->
<!-- 							<li><a href="#">去新西兰留学住宿费用要多少</a></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->

<!-- 					<ul class="next"> -->
<!-- 						<li>上一篇：<a href="#">2016年加拿大留学条件之名校申请攻略</a></li> -->
<!-- 						<li style="text-align: right">下一篇：<a href="#">谢天谢地遇到你，我的柳橙网顾问</a></li> -->
<!-- 					</ul> -->


<!-- 					<div class="pageBtn"> -->
<!-- 						<a class="btn btn-blue large" href="#">免费留学评估</a><a -->
<!-- 							class="btn btn-green large" href="#">免费移民/签证评估</a> -->
<!-- 					</div> -->

				</div>
			</div>
			<div class="listSide">
				<!-- 套餐推荐 -->
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
</body>
</html>
