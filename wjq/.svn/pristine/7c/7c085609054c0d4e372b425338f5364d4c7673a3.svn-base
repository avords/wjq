<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<jdf:themeFile file="kindeditor/kindeditor.js" />
<jdf:themeFile file="kindeditor/lang/zh_CN.js" />
<title>桥聊吧管理</title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-edit"></span>桥聊吧管理
		</div>
	  	<div class="panel-body">
	  		<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/post/save" class="form-horizontal" id="editForm">
					<input type="hidden" name="objectId">
					<input type="hidden" name="createDate">
				 	<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="name" class="col-sm-3 control-label">帖子名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="name" name="name" style="width: 360px;" readonly="readonly">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="themeId" class="col-sm-3 control-label">所属主题</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="themeId" name="themeId" value="${postTheme.name}" style="width: 360px;" maxlength= "30" readonly="readonly">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="themeId" class="col-sm-3 control-label">发帖人</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="memberId" name="memberId" value="${member.loginName}" style="width: 360px;" maxlength= "30" readonly="readonly">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="type" class="col-sm-3 control-label">标题类型</label>
								<div class="col-sm-8">
									<select class="form-control" name="type" style="width: 360px;" disabled="disabled">
										<option value="">---请选择---</option>
										<jdf:select dictionaryId="1105" />
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="latestReplyDate" class="col-sm-3 control-label"><jdf:message code="最后修改时间" /></label>
                                    <div class="col-sm-8">
                                   <input type="text" id="latestReplyDate" name="latestReplyDate" readonly="readonly" cell="date" format="yyyy-MM-dd HH:mm:ss"  style="width: 360px;">
                                </div>
                            </div>
                        </div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<div class="col-sm-8" >
									<input type="text" class="form-control" id="isTop" name="isTop" value="2" style="width: 240px; display: none" maxlength= "30">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group" >
							<label class="col-sm-3 control-label" >帖子内容</label>
				                 <div style="width:800px;margin-left: 150px;margin-top: 10px;overflow: auto;" >${entity.content}</div>
							</div>
						</div>
					</div>
				</form>
			</jdf:form>
		</div>
	</div>
	<script type="text/javascript">
	$(function(){
        $( ".js-example-placeholder-single").select2();
	});
	</script>
</body>