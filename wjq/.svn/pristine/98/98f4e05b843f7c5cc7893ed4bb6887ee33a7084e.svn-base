<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
</head>
<body>

<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span>
			<jdf:message code="商品管理" />
			<div class="pull-right">
			<button type="button" class="btn btn-primary" onclick="window.location='<%=dynamicDomain%>/product/page'">
					<span class="glyphicon glyphicon-chevron-left"></span>
					<jdf:message code="返回" />
			</button>
			</div>
		</div>
		
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/product/save" class="form-horizontal" id="editForm" enctype="multipart/form-data">
					<input type="hidden" name="objectId">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="name">
								 <jdf:message code="商品名称 " />
								  </label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="name">
								</div>
							</div>
						</div>
						
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="cateGoryId">
								<jdf:message code="所属分类" />
								</label>
								<div class="col-sm-8">
									<select name="cateGoryId" class="form-control" id="cateGoryId">
										<option value="">全部</option>
										<jdf:selectCollection items="productCateGorys" optionValue="objectId" optionText="name" />
									</select>
								</div>
							</div>
						</div>
					</div>
					
				<div class="row">
					<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="status">
								<jdf:message code="当前商品状态" />
								</label>
								<div class="col-sm-8">
									<select name="status" class="form-control">
										<option>全部</option>
										<jdf:select dictionaryId="1501" valid="true" />
									</select>
								</div>
							</div>
						</div>
					</div>

            		<div class="row">
						<div class="span12 pull-right text-right">
		                	<button type="submit" class="btn btn-primary">
		                	<i class="icon-save icon-white"></i>
		                	<jdf:message code="common.button.save"/>
		                	</button>
		                </div>
		             </div>
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="Product"/>
</body>