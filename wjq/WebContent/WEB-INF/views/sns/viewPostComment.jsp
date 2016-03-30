<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>桥聊吧评论管理</title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-edit"></span>桥聊吧评论管理
		</div>
	  	<div class="panel-body">
	  		<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/postComment/save?ajax=1" class="form-horizontal" id="editForm">
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="commentatorName" class="col-sm-3 control-label">评论者名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="commentatorName" name="commentatorName" readonly="readonly">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="createDate" class="col-sm-3 control-label"><jdf:message code="最后修改时间" /></label>
                                    <div class="col-sm-8">
                                   <input type="text" id="createDate" name="createDate" readonly="readonly" cell="date" format="yyyy-MM-dd HH:mm:ss"  style="width: 240px;">
                                </div>
                            </div>
                        </div>
					</div>
					<div class="row"  style="width:1000px;height:600px;">
						<p>${entity.content}</p>
					</div>
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="Role"/>
	<script type="text/javascript">
	</script>
</body>