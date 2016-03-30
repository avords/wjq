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
			<div class="pageCont" style="width:100%;">
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

				</div>
			</div>
		</div>
	</div>
</body>
</html>
