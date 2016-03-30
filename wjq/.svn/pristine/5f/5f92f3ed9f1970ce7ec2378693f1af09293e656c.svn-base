<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<div class="ind-info">
	<dl>
		<dt class="avatar">
			<c:choose>
				<c:when test="${empty member.pictureAddress }">
					<img id="imageId" onclick="upLoadFile()" title="点击上传头像" src="<jdf:theme/>img/home/default_tx.jpg" />
				</c:when>
				<c:otherwise>
					<img id="imageId" onclick="upLoadFile()" title="点击上传头像" src="${dynamicDomain}${member.pictureAddress}" />
				</c:otherwise>
			</c:choose>
		</dt>
		<form id="RoleMenu" name="RoleMenu">
			<input type="file" id="uploadFile" name='uploadFile' style="display: none;" onchange="uploadImage()" accept="image/*">
			<input type="hidden" name="titleImage" id="titleImage">
		</form>
		<dd>
			<div class="cont1">
				你好，<span class="red">${member.loginName} </span>！尽情享受一天宁静的时光吧！
			</div>
			<div class="cont2">昵称：${member.name} ｜
				注册时间：${member.createDate}</div>
		</dd>
	</dl>
	<!-- <div class="tips">
						待付款：<span class="red">0</span> 待评价：<span class="red">2</span>
						<div style="float: right;">
							可用优惠券：<span class="red">0</span> 张 我的余额：<span class="red">5000</span>元
							<a class="recharge" href="#">充值</a>
						</div>
					</div> -->
</div>