<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>万家桥-首页</title>
<jdf:themeFile file="css/home_index.css" />
<jdf:themeFile file="css/home_base.css" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
</head>
<body>
	<!--首页焦点图-->
	<div id="indexBanner"> 
		<div id="slideBox" class="slideBox">
			<div class="hd">
				<ul>
					<c:forEach items="${bannerAdvert}" var="item" >
                        <c:if test="${item.pictureAddress != null}">
                        <li></li>
                        </c:if>
                    </c:forEach>
				</ul>
			</div>
			<div class="bd">
				<ul>
					<c:forEach items="${bannerAdvert}" var="item" >
						<c:if test="${item.pictureAddress != null}">
						<li><a href="${item.url}" target="_blank"><img src="${dynamicDomain}${item.pictureAddress}" width="1000px"/></a></li></c:if>
					</c:forEach>
 				</ul>
			</div>
			<a class="prev" href="javascript:void(0)"></a> <a class="next" href="javascript:void(0)"></a>
		</div>
	</div>
	<!--/首页焦点图-->
	<div class="container">
		<!--跨境环球观景台-->
		<c:if test="${!empty channel_1_1}">
			<div class="indexCont1">
				<div class="indexTitle">
					<h3 class="tit_icon1" style="background: url(${dynamicDomain}/${channel_1_1.pictureAddress }) 8px center no-repeat;">${channel_1_1.name }</h3>
					<span><a href="${dynamicDomain }/home/index/${channel_1_1.objectId}" target="_blank">+更多</a></span>
				</div>
				<div class="bd clearfix">
				<c:if test="${fn:length(channel_1_1_contents)>0}">
				   <c:choose>
				       <c:when test="${!empty channel_1_1_contents[0].titleImage}">
				           <img width="256" src="${dynamicDomain }/${channel_1_1_contents[0].titleImage}" />
                             <ul>
		                           <c:forEach items="${channel_1_1_contents }" var="item" varStatus="status">
		                            <li><span><fmt:formatDate value="${item.publishDate }" pattern="yyyy-MM-dd"/></span><a href="${dynamicDomain }/home/index/${channel_1_1.objectId}/detail/${item.objectId}" target="_blank">${item.title }</a></li>
		                        </c:forEach>
		                    </ul>
				       </c:when>
				       <c:otherwise>
                            <ul style="width:100%;">
                                <c:forEach items="${channel_1_1_contents }" var="item" varStatus="status">
                                    <li><span><fmt:formatDate value="${item.publishDate }" pattern="yyyy-MM-dd"/></span><a href="${dynamicDomain }/home/index/${channel_1_1.objectId}/detail/${item.objectId}" target="_blank">${item.title }</a></li>
                                </c:forEach>
                            </ul>
				       </c:otherwise>
					</c:choose>
				</c:if>
				</div>
			</div>
		</c:if>
		<!--/跨境环球观景台-->

		<!--服务互动一点通-->
		<div class="indexCont2">
			<div class="indexTitle">
				<h3 class="tit_icon2">服务互动一点通</h3>
			</div>
			<div class="bd clearfix">
				<ul>
					<li class="telQR">
						<p class="tel">
							<img src="<jdf:theme/>/img/home/icon_tel.png" width="223" height="50" />
						</p>
						<p class="QR">
							<img src="<jdf:theme/>/img/home/QR.png" /><span class="tit">万家桥官方微信</span>
							<span>一步上桥 万事搞定<br> 出国桥梁 游子家园
							</span>
						</p>
					</li>
					<li class="icon1">
						<dl>
							<dt>
								<small>有事</small>问问
							</dt>
							<dd class="ask_ico1">QQ客服：2152346494</dd>
							<dd class="ask_ico2">E-mail：service@wonbridge.com</dd>
						</dl>
					</li>
					<li class="icon3">
						<dl class="talk">
							<dt>
								<small>有话</small>说说
							</dt>
							<dd>
								<a href="${dynamicDomain }/home/post" target="_blank">游子贴吧</a> 
							</dd>
						</dl>
					</li>
					<li class="icon2">
						<dl class="talk">
							<dt>
								<small>有心</small>做做
							</dt>
							<dd>
								<a href="javascript:void(0)">招募与加盟</a> 
								<a href="javascript:void(0)">广结良缘</a> 
								<a href="javascript:void(0)">合作共赢</a>
								<a href="javascript:void(0)">广集英才</a>
							</dd>
						</dl>
					</li>

				</ul>
			</div>
		</div>
		<!--/服务互动一点通-->

		<!--分类市场群英会-->
		<div class="indexCont3 clearfix">
		   <c:if test="${!empty channel_2}">
			<div class="category">
				<div class="title">
					<span style="background: #4c79b7 url(${dynamicDomain}/${channel_2.pictureAddress }) no-repeat 10px center;">${channel_2.name }</span>
				</div>
				<ul>
				   <c:forEach items="${channel_2.subChannels }" var="item" varStatus="status">
				       <li><a href="${dynamicDomain }/home/index/${item.objectId}"> <img
                                src="${dynamicDomain}/${item.pictureAddress }" />
                                <h4>${item.name }</h4>
                                <p title="${item.channelExplian }" class="c-explain">
                                   ${item.channelExplian }
                                </p>
                        </a></li>
				   </c:forEach>
				</ul>
			</div>
			</c:if>
			<c:if test="${!empty channel_3}">
				<div class="school">
					<div class="title" style="background: #f9f9f9 url(${dynamicDomain}/${channel_3.pictureAddress }) no-repeat 10px center;">
						<span><a href="#">+更多</a></span>${channel_3.name }
					</div>
					<div class="school-cont">
					    <c:forEach items="${channel_3.subChannels }" var="item" varStatus="status">
					         <a href="${dynamicDomain }/home/index/${item.objectId}" target="_blank"><i class="icon${status.count }" style="background: url(${dynamicDomain}/${item.pictureAddress }) no-repeat;"></i>${item.name }</a>
					    </c:forEach>
					</div>
				</div>
			</c:if>
		</div>
		<!--分类市场群英会-->
        <c:if test="${!empty channel_4 }">
			<!--出国服务透视镜-->
			<div class="indexCont5">
				<div class="indexTitle">
					<h3 style="background: url(${dynamicDomain}/${channel_4.pictureAddress }) 8px center no-repeat;" class="tit_icon5">${channel_4.name }</h3>
				</div>
				<div class="bd clearfix">
				    <c:forEach items="${channel_4.subChannels }" var="item" varStatus="status">
						<a href="${dynamicDomain }/home/index/${item.objectId}">
							<h3>${item.name }</h3>
							<p class="tj_ico${status.count }" style="background: #fff url(${dynamicDomain}/${item.pictureAddress }) no-repeat center;"></p>
						</a>
					</c:forEach>
				</div>
			</div>
			<!--/出国服务透视镜-->
		</c:if>
		<%@ include file="home_service.jsp"%>
		<!--友情链接-->
		<div class="link clearfix">
			<div class="indexTitle">
				<h3 class="tit_icon6">友情链接</h3>
			</div>
			<div class="form-group" style="line-height:65px;">
				<div class="col-sm-12">
					<marquee behavior="scroll" contenteditable="true" onstart="this.firstChild.innerHTML+=this.firstChild.innerHTML;" scrollamount="3" width="100"><span unselectable="on"></span></marquee>
						<div id="scrollobj" onmouseover="aa()" onmouseout="b()" style="white-space:nowrap;overflow:hidden;width:100%;margin-top:-65px;margin-bottom:-33px;">
							<c:forEach items="${links }" var="asl" >
								 <c:if test="${asl.pictureAddress!= null}"><a href="${asl.websiteUrl}" target="_blank"><img id="linkImg" style="height:48px;" src="${dynamicDomain}${asl.pictureAddress}"/></a></c:if>
							</c:forEach>
						</div>	
			   </div>
			</div>
		</div>	
		<!--/友情链接-->	
	</div>
	<c:if test="${fn:length(links)>8}">
		<jdf:themeFile file="indexLinks.js" />
	</c:if>
	<script type="text/javascript">
    $(function(){
        $(".category .c-explain").each(function(){
            var maxwidth=25;
            var obj = $(this);
            var txt = obj.text().trim();
            if(txt.length>maxwidth){
            	var temp = txt.substring(0,maxwidth);
                obj.text(temp);
                obj.html(obj.text()+'...');
            }
        });
    });
	</script>
</body>
</html>
