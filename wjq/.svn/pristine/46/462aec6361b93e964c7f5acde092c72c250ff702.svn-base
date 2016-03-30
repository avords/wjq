<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="com.mvc.cms.model.Content" %>
<%@ include file="../common/header.jsp"%>
<jdf:themeFile file="css/select2.css" />
<jdf:themeFile file="select2.js"/>
<jdf:themeFile file="ckeditor/ckeditor.js" />
<jdf:themeFile file="ckeditor/config.js" />
</head>
<body>
	 <div class="box border">
		<div class="box-title">
			<h4><span class="glyphicon glyphicon-fullscreen"></span>文章发布</h4>
		</div>
	  	<div class="panel-body">
	  		<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/content/save?ajax=1" class="form-horizontal" name="RoleMenu" id="RoleMenu">
					<input type="hidden" name="objectId">
				 	<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-5">
							<div class="form-group">
								<select title="已选择栏目" name="menuId" id="selected" multiple="multiple" size="20" style="width: 80%;height: 160px;" disabled="disabled">
									<jdf:selectCollection items="haveMenus" optionValue="objectId" optionText="fullName"/>
								</select>
							</div >
						</div>
						<div class="col-sm-1">
							<div class="form-group">
								<img title="添加选中" src="<jdf:theme/>img/oneLeft.gif" id="rightToLeft" class="contentMoveButton">
								<br>
								<br>
								<img title="添加全部" src="<jdf:theme/>img/allLeft.gif" id="allRightToLeft" class="contentMoveButton">
								<br>
								<br>
								<img title="删除选中" src="<jdf:theme/>img/oneRight.gif" id="leftToRight" class="contentMoveButton">
								<br>
								<br>
								<img title="删除全部" src="<jdf:theme/>img/allRight.gif" id="allLeftToRight" class="contentMoveButton">
							</div>
						</div>
						<div class="col-sm-5">
							<div class="form-group">
								<select title="待选择栏目" name="unSelected" id="unSelected" multiple="multiple" size="20" style="width: 80%;height: 160px;" disabled="disabled">
									<jdf:selectCollection items="notHaveMenus" optionValue="objectId" optionText="fullName"/>
								</select>
							</div>
						</div>			
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="title" class="col-sm-3 control-label">
									文章标题：
								</label>
								<div class="col-sm-8">
									 <input type="text" name="title" maxlength="128" placeholder="不超过128字符" class="form-control" readonly="readonly"  />
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="keyWords" class="col-sm-3 control-label">
									关键字：
								</label>
								<div class="col-sm-6">
									 <input type="text" name="keyWords" maxlength="332" class="form-control" readonly="readonly" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="title" class="col-sm-3 control-label">
									文章摘要：
								</label>
								<div class="col-sm-8">
									 <textarea name="summary" id="summary" rows="3" maxlength="600" cols="120" rows="5" placeholder="请输入文章摘要" readonly="readonly" ></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="author" class="col-sm-3 control-label">
									作者：
								</label>
								<div class="col-sm-4">
									 <input type="text" name="author" maxlength="332" class="form-control" readonly="readonly"  />
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="origin" class="col-sm-3 control-label">
									文章来源：
								</label>
								<div class="col-sm-6">
									 <input type="text" name="origin"  class="form-control" readonly="readonly"  />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="type" class="col-sm-3 control-label">
									文章类型：
								</label>
								<div class="col-sm-4">
									<select name="type" id="select" class="form-control" disabled="disabled">
										<jdf:select dictionaryId="1502"/>
									</select>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="origin" class="col-sm-3 control-label">
									文章状态：
								</label>
								<div class="col-sm-6">
									<select name="status" id="select" class="form-control" disabled="disabled">
										<jdf:select dictionaryId="1501"/>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-9 col-md-9">
							<div class="form-group">
								<div class="col-sm-2 control-label">
									<input type="file"  id="uploadFile" name='uploadFile' style="display:none;" onchange="uploadImage()"
										accept="image/*">
									<input type="hidden" name="titleImage" id="titleImage">
								</div>
								<div class="col-sm-6">
                                	 <c:if test="${empty entity.titleImage}">
									  		<img id="imageId" src="" alt="" style="width: 330px;height: 200px;">
	                               	 </c:if>
	                               	 <c:if test="${not empty entity.titleImage}">
									  	   <img id="imageId" src="${dynamicDomain}${entity.titleImage}" alt="" style="width: 330px;height: 200px;">
	                               	 </c:if>
                                </div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12 col-md-12">
							<div class="form-group">
								<div class="col-sm-12">
									<textarea name="contentTxt.txt" id="txt"  rows="500"></textarea> 
								</div>
								<script type="text/javascript">
					            var editor =CKEDITOR.replace( 'txt', {
										  language : 'zh-cn',
										  width:'100%', 
										  height:400,
										  toolbarLocation:'top',
										  toolbarStartupExpanded :true,
										  toolbar: [
														['Source','-','Save','NewPage','Preview','-','Templates'],
														['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],
														['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
														['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
														'/',
														['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
														['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
														['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
														['Link','Unlink','Anchor'],
														['Image','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
														'/',
														['Styles','Format','Font','FontSize'],
														['TextColor','BGColor']
											    ],
										  filebrowserUploadUrl : '<%=request.getContextPath()%>/connector/upload?ajax=1',   
										  filebrowserImageUploadUrl : '<%=request.getContextPath()%>/connector/upload?ajax=1',   
										  filebrowserFlashUploadUrl : '<%=request.getContextPath()%>/connector/upload?ajax=1'  
										});
					           		 CKEDITOR.on('instanceReady', function (ev) { 
					               		 editor = ev.editor; 
					                	 editor.setReadOnly(true);  
					           		 });
								</script>
							</div>
						</div>
					</div>
				  	<div class="row">
						<div class="col-sm-12 col-md-12">
							<div class="right">
								<c:if test="${not empty view}">
									<a href="${dynamicDomain}/content/back/${entity.status}" class="btn btn-primary btn-mini">
										<span class="glyphicon glyphicon-chevron-left"></span>
										<jdf:message code="common.button.back"/>
									</a>
								</c:if>
							</div>
						</div>
					</div>
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="Content"/>
	<script type="text/javascript">

		function getEditorTextContents(EditorName) {
			var oEditor = FCKeditorAPI.GetInstance(EditorName);
			return(oEditor.EditorDocument.body.innerHTML);
		}

		function prepare() {
			var theform = document.RoleMenu;
			var userIdSelected = theform.selected;
			for(var i = userIdSelected.options.length-1; i >= 0; i--){
				userIdSelected.options[i].selected = true;
			}
			if(userIdSelected.options.length<1){
				alert("请至少选择一个栏目")
				return false;
			}
			$("#unSelected").empty();
		}
		
	</script>
</body>