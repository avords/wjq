<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<div class="merberNav">
	<div class="subNav">
		<h3>
			<i class="icon_4"></i>社区中心<span></span>
		</h3>
		<ul>
			<li><a href="${dynamicDomain}/member/myWord">我的发言</a></li>
		</ul>
	</div>
	<div class="subNav">
		<h3>
			<i class="icon_5"></i>个人设置<span></span>
		</h3>
		<ul>
			<li><a href="${dynamicDomain}/member/modify">基本资料</a></li>
			<li><a href="${dynamicDomain}/member/modifyPassword">修改密码</a></li>
		</ul>
	</div>
	<div class="subNav">
		<h3>
			<i class="icon_6"></i><a href="${dynamicDomain}/home/login/out?logoutFrom=5">退出</a><span></span>
		</h3>
	</div>
</div>