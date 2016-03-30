<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!--头部顶栏-->
<div id="headTop">
	<div class="head-inner clearfix">
		<div class="headTop-left">
			<c:if test="${sessionScope.count>0 }">
				欢迎来到万家桥！您是第<span class="red fz16">
				${sessionScope.count}
				</span>位来到万家桥的客户
			</c:if>
		</div>
		<ul class="headTop-right"> 
		    <c:choose>
		        <c:when test="${empty sessionScope.m_loginName }">
		            <li class="login"><a href="${dynamicDomain}/home/login">请登录</a><a href="${dynamicDomain}/home/register">快速注册</a><span
                class="sep-lines"></span></li>
		        </c:when>
		        <c:otherwise>
		            <li class="welcome" ><span>${sessionScope.m_loginName }</span></li>
                    <li class="logout" ><a href="${dynamicDomain}/home/login/out?logoutFrom=5">退出</a><span
                class="sep-lines"></span></li>
		        </c:otherwise>
		    </c:choose>
			<li class="dropdown"><a href="${dynamicDomain }/member/memberCenter">我的桥<span class="arrow-down"></span></a><span
				class="sep-lines"></span>
				<ul class="dropmenu user">
					<li><a href="${dynamicDomain}/member/modify">个人资料</a></li>
				</ul>
			</li>
			<!-- <li><a href="#"><span class="icon_top_2"></span>购物车 <span
					class="red fz16">0</span></a> <span class="sep-lines"></span>
			</li> -->
<%-- 			<li class="dropdown"><a href="#"><span class="icon_top_3"></span>移动访问<span
					class="arrow-down"></span></a><span class="sep-lines"></span>
				<div class="dropmenu qr">
					<p>
						<img src="<jdf:theme/>/img/home/QR.png" />安卓下载
					</p>
					<p>
						<img src="<jdf:theme/>/img/home/QR.png" />ios下载
					</p>
				</div>
			</li> --%>
			<li><a class="red" href="${dynamicDomain }/home/post">聊聊吧</a></li>
		</ul>
	</div>
</div>
<!--/头部顶栏-->

<!--logo及search-->
<div id="headSearch" class="clearfix">
	<a class="logo" href="${dynamicDomain }/home/index"> </a>
	<form action="${dynamicDomain}/home/index/show" method="post" >
	<div class="search">
		<div class="searchTag">
			<select style="border: 0px;height: 35px;width: 67px;border-right: 1px solid lightgray;" name="val" id="select">
				<option value="资讯" >资讯</option>
				<!-- <option value="产品" >产品</option>
				<option value="服务" >服务</option> -->
			</select>
      </div>   
			<input class="searchKey" type="text" placeholder="${keyWords}" name="keyword"/> 
			<input class="searchBtn" type="submit" value="搜索"  style="margin-right: 0px;"/>
	</div>	
	</form>
</div>
<!--/logo及search-->
<!--主导航-->
<div class="navBg clearfix">
	<ul id="nav" class="nav clearfix">
	 <li class="nLi on">
      <h3><a href="${dynamicDomain }/home/index">首页</a></h3>
    </li>
	${channelHtml}
	</ul>
</div>
<script type="text/javascript">
$(function(){
	if("${parentModuleId}" != ""){
		$("#nav .nLi").removeClass("on");
		$("#nav .nLi").each(function(){
			if($(this).attr("id")=="nav${parentModuleId}"){
				$(this).addClass("on");
			}
		});
	}else{
		$("#nav .nLi:eq(0)").addClass("on");
	}
	
});
	var val='${val}';
if(val==null||val==""){
	document.getElementById("select").value="资讯";
}else{
	document.getElementById("select").value="${val}";
}

</script>
<!--/主导航-->