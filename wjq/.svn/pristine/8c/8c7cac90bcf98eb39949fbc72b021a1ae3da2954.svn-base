<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="com.mvc.cms.model.Content" %>
<%@ include file="../common/header.jsp"%>
<jdf:themeFile file="css/select2.css" />
<jdf:themeFile file="select2.js"/>
<jdf:themeFile file="ckeditor/ckeditor.js" />
<jdf:themeFile file="ckeditor/config.js" />
<jdf:themeFile file="FilterMultSelect.js" />
</head>
<title>文章新增</title>
<body>
	 <div class="box border">
		<div class="box-title">
			<h4><span class="glyphicon glyphicon-edit"></span>文章新增</h4>
		</div>
	  	<div class="panel-body">
	  		<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/content/save?ajax=1" class="form-horizontal" name="RoleMenu" id="RoleMenu" >
					<input type="hidden" name="objectId" id="objectId">
				 	<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4 col-sm-offset-6">
							<div class="form-group">
							 <input type="text" id="rightInput" name="rightInput"  />
							 <button type="button" class="btn"  id="rightFilter" onclick="filterUnselected();"><jdf:message code="common.lable.filter"/></button>
							</div>
						</div>			
					</div>
					<div class="row">
						<div class="col-sm-5">
							<div class="form-group">
								<select title="已选择栏目" name="menuId" id="selected" multiple="multiple" size="20" style="width: 80%;height: 160px;">
									<jdf:selectCollection items="haveMenus" optionValue="objectId" optionText="fullName"/>
								</select>
							</div >
						</div>
						<div class="col-sm-1">
							<div class="form-group">
								<br>
								<br>
								<img title="添加选中" src="<jdf:theme/>img/oneLeft.gif" id="rightToLeft" class="contentMoveButton">
								<br>
								<br>
								<img title="删除选中" src="<jdf:theme/>img/oneRight.gif" id="leftToRight" class="contentMoveButton">
								
							</div>
						</div>
						<div class="col-sm-5">
							<div class="form-group">
								<select title="待选择栏目" name="unSelected" id="unSelected"  multiple="multiple" size="20" style="width: 80%;height: 160px;">
									<jdf:selectCollection  items="notHaveMenus" optionValue="objectId" optionText="fullName"/>
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
								<div class="col-sm-6">
									 <input type="text" name="title" id="title" maxlength="64" placeholder="不超过64字符" class="form-control"  />
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="keyWords" class="col-sm-3 control-label">
									关键字：
								</label>
								<div class="col-sm-6">
									 <input type="text" name="keyWords" maxlength="32" class="form-control"  />
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
								<div class="col-sm-9">
									 <textarea name="summary" id="summary" rows="3" cols="120" placeholder="请输入文章摘要"></textarea>
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
								<div class="col-sm-6">
									 <input type="text" name="author" maxlength="32" class="form-control"  />
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="origin" class="col-sm-3 control-label">
									文章来源：
								</label>
								<div class="col-sm-6">
									 <input type="text" name="origin" maxlength="32"  class="form-control"   />
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
								<div class="col-sm-6">
									<select name="type" id="select" class="form-control"   >
										<option value="">请选择</option>
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
									<select name="status" id="select" class="form-control"  disabled="disabled">
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
									<button type="button" class="btn btn-primary" onclick="upLoadFile();">
										<span class="glyphicon glyphicon-save"></span><jdf:message code="导入封面图片" />
									</button>
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
									CKEDITOR.replace( 'txt', {
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
								</script>
							</div>
						</div>
					</div>
				  	<div class="row">
						<div class="col-sm-12 col-md-12">
							<div class="right">
									<button type="button" class="btn btn-primary" onclick="window.location='<%=dynamicDomain%>/content/page';">
										<span class="glyphicon glyphicon-chevron-left"></span><jdf:message code="返回" />
									</button>
									<c:if test="${entity.status==1 }">
										<a href="${dynamicDomain}/content/submit/${entity.objectId}" class="btn btn-primary">
											<span class="glyphicon glyphicon-chevron-up"></span>
											<jdf:message code="common.button.submit"/>
										</a>
									</c:if>
							
									<button type="button" class="btn btn-primary" id="submitBtn" onclick="submitFun();" >
									<span class="glyphicon glyphicon-ok"></span><jdf:message code="common.button.save"/>
									</button>
								
							</div>
						</div>
					</div>
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="Content"/>
	<script type="text/javascript">
		
	$(document).ready(function() {
		selectMove("selected","unSelected","rightToLeft","leftToRight","rightInput");
		refreshParentPage(false);
		$("#RoleMenu").validate({
			rules : {
				summary : {
					maxlength:512,
				}
			},
			messages : {
				summary : {
					maxlength : "文章摘要最大长度为512"
				}
			}
			});
  	 });
	
		function getEditorTextContents(EditorName) {
			var oEditor = FCKeditorAPI.GetInstance(EditorName);
			return(oEditor.EditorDocument.body.innerHTML);
		}

		function selectMove(left,right,toLeft,toRight,rightFilterInput){
			init(left,right);
			$("#" + toLeft).bind("click",function(){moveIt(document.getElementById(right),document.getElementById(left),2);});					//左边到右边
			$("#" + toRight).bind("click",function(){moveIt(document.getElementById(left),document.getElementById(right),1);});					//右边到左边
			$("#" + left).bind("dblclick",function(){moveIt(document.getElementById(left),document.getElementById(right),1);});		//left中数据到right中的双击事件
			$("#" + right).bind("dblclick",function(){moveIt(document.getElementById(right),document.getElementById(left),2);});		//right中到left中的双击事件unauthorized
			
			$("#" + rightFilterInput).bind("keypress",function(event){
				event = event ? event :(window.event ? window.event : null);
				if(event.keyCode==13){
					event.keyCode=9; 
					doMyFilter($(this).val(),document.getElementById(right),2);
					return false;
				}
			});
		}
		
		function filterUnselected(){
			var rightInput=$('#rightInput').val();
			var right=document.getElementById('unSelected');
			doMyFilter(rightInput,right,2);
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
			var summary=$('#summary').val();
			if(summary.length>512){
				return false;
			}
			var title=$('#title').val();
			if(title.length<1){
				return false;
			}
			return true;
		}
		
		function submitFun(){
			var temp=prepare();
			if(temp){
				document.RoleMenu.submit();
			}
		}
		
		function upLoadFile(){
			document.RoleMenu.uploadFile.click();/* 弹出上传会话框 */
		}
		function uploadImage(){
			$.ajax({
				 url:'<%=dynamicDomain%>/content/uploadImage/',
				 type:'post',
				 cache: false,
				 data:new FormData($('#RoleMenu')[0]),
				 processData: false,
				 contentType: false,
				 success: function (data) {
					if(data!=null){
						$('#imageId').attr("src",'${dynamicDomain}'+data.imageSrc);
						$('#titleImage').attr("value",data.imageSrc);
					 }
				 }
			});
		}
		
	</script>
</body>