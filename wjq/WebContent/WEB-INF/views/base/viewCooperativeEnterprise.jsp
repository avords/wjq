<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>合作单位维护</title>
</head>
<body>
<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span>合作单位管理
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/cooperativeEnterprise/save?ajax=1" class="form-horizontal" id="editForm" enctype="multipart/form-data">
					<div class="row">
					  <div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="company" class="col-sm-3 control-label">公司名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="company" name="company"  readonly="readonly">
									<span id="notUniqueUser" style="color: red;"></span>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="companyURL" class="col-sm-3 control-label">公司网址</label>
								<div class="col-sm-8">
									<input type="url" class="form-control" id="companyURL" name="companyURL" value="${entity.companyURL}" readonly="readonly"> 
								</div>
							</div>
						</div>
					</div>
					<div class="row">
					 <div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="address" class="col-sm-3 control-label">联系地址</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="address" name="address" readonly="readonly">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="rank" class="col-sm-3 control-label">业内排名</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="rank" name="rank" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" value="${entity.rank}" readonly="readonly">
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
					 <div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="email" class="col-sm-3 control-label">邮箱</label>
								<div class="col-sm-8">
									<input type="email" class="form-control" id="email" name="email" value="${entity.email}" readonly="readonly">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="cellPhone" class="col-sm-3 control-label">手机号码</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="cellPhone" name="cellPhone"  onkeyup="this.value=this.value.replace(/[^\d]/g,'')" value="${entity.cellPhone}" readonly="readonly"> 
								</div>
							</div>
						</div>
					</div>
					<div class="row">
					 <div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="telePhone" class="col-sm-3 control-label">固定电话</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="telePhone" name="telePhone" value="${entity.telePhone}" onkeyup="this.value=this.value.replace(/[^\d]/g,'')"value="${entity.telePhone }"  readonly="readonly">
								</div>
							</div>
						</div>
					<div class="col-sm-6 col-md-6">
						<div class="form-group">
								<label for="fax" class="col-sm-3 control-label">传真</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="fax" name="fax" onkeyup="this.value=this.value.replace(/[^\d]/g,'')"  value="${entity.fax}" readonly="readonly">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="instruction" class="col-sm-3 control-label">公司介绍</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="instruction" name="instruction" value="${entity.instruction}" readonly="readonly">
								</div>
							</div>
						 </div>
						 <div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="name" class="col-sm-3 control-label">法人代表</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="name" name="name" readonly="readonly">
								</div>
						   </div>
					   </div>
					  </div>
					 <div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="idCardNo" class="col-sm-3 control-label">身份证号</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="idCardNo" name="idCardNo"  readonly="readonly">
								</div>
							</div>
						</div>
						 <div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="cotimes" class="col-sm-3 control-label">合作次数</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="cotimes" name="cotimes"  value="${entity.cotimes }" min=0 max=100 readonly="readonly">
								</div>
						   </div>
					   </div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="creditRating" class="col-sm-3 control-label">信用评级</label>
								<div class="col-sm-8">
                                    <select name="creditRating" disabled="disabled" class="input-medium" style=" width: 100%" >
										    <option value=""></option>
										   <jdf:select dictionaryId="1021"/>
									 </select>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="serviceType" class="col-sm-3 control-label">服务类型</label>
								<div class="col-sm-8">
                                    <select name="serviceType" disabled="disabled" class="input-medium" style=" width: 100%" >
										    <option value=""></option>
										   <jdf:select dictionaryId="1111"/>
									 </select>
								</div>
							</div>
						</div>
					</div>
                                <div class="form-group">
                                    <label for="mainPicture"  class="col-sm-2 control-label">公司LOGO</label>
                                    <div class="col-sm-4">
                                    <input name="pictureAddress" type="hidden" id="mainPicture">
                                    <div id="mainImg" style="width:122px;">
                                    <c:if test="${entity.objectId != null&& entity.pictureAddress!=null }">
                                          <img id="preview" alt="" src="${dynamicDomain}${entity.pictureAddress}" width="122px">
                                    </c:if>
                                </div>
                            </div>
                      </div>
				</form>
			</jdf:form>
		</div>
	</div>
</body>
</html>