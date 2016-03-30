<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<meta charset="utf-8">
<title>桥聊吧管理</title>
<jdf:themeFile file="ckeditor/ckeditor.js" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<jdf:themeFile file="bootstrap.min.js" />
<jdf:themeFile file="kindeditor/kindeditor.js" />
<jdf:themeFile file="kindeditor/lang/zh_CN.js" />
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-edit"></span>桥聊吧管理
		</div>
	  	<div class="panel-body">
	  		<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/post/save" class="form-horizontal" id="editForm" enctype="multipart/form-data">
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
									<input type="text" class="form-control" id="name" name="name" style="width: 240px;" maxlength= "30">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="themeId" class="col-sm-3 control-label">所属主题</label>
								<div class="col-sm-8">
									<select  name="themeId"  id="themeId" class ="js-example-placeholder-single" style="width: 240px;">
											<option value="">请选择</option>
                                            <jdf:selectCollection items="postThemes" optionValue="objectId" optionText="name" />
                                  </select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="themeId" class="col-sm-3 control-label">发帖人</label>
								<div class="col-sm-8">
									<select  name="memberId"  id="memberId" class ="js-example-placeholder-single" style="width: 240px;" readonly="readonly">
											<option value="">请选择</option>
                                            <jdf:selectCollection items="members" optionValue="objectId" optionText="loginName" />
                                  </select>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="type" class="col-sm-3 control-label">标题类型</label>
								<div class="col-sm-8">
									<select class="form-control" name="type" style="width: 240px;">
										<option value="">请选择</option>
										<jdf:select dictionaryId="1105" />
									</select>
								</div>
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
					  <div class="post"> <a id="rely"></a>
					      <div class="post-inner">
					        <div class="box">
						          <div class="editor">
						           <textarea id="editor_id" name="content"  placeholder="请输入内容"></textarea>
						          </div>
					        </div>
					      </div>
					    </div>
				  	<div class="row">
						<div class="col-sm-12 col-md-12">
							<div class="pull-right">
								<c:if test="${message!='操作成功'}">
								<button type="submit" class="btn btn-primary">
									<span class="glyphicon glyphicon-ok"></span><jdf:message code="common.button.save"/>
								</button>
								</c:if>
								<button type="button" class="btn btn-primary" onclick="window.location='<%=dynamicDomain%>/post/page';">
									<span class="glyphicon glyphicon-chevron-left"></span><jdf:message code="返回" />
								</button>
							</div>
						</div>
					</div>
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="Post"/>
	<script type="text/javascript">
	function getEditorTextContents(EditorName) {
		var oEditor = FCKeditorAPI.GetInstance(EditorName);
		return(oEditor.EditorDocument.body.innerHTML);
	}
	$(function(){
        $( ".js-example-placeholder-single").select2();
	});
	 
	KindEditor.ready(function(K) {
         editor = K.create('#editor_id',{
        	  uploadJson : '${dynamicDomain}/connector/kindUpload?ajax=1',
              afterBlur: function(){this.sync();},
              allowFileManager : true,
       		  width:658,
       		  height:250,
       		  minWidth:658,
       		  minHeight:250,
       		  resizeType:0,
       		  items:['link','image','media','emoticons','baidumap']
         });
   });
	</script>
</body>