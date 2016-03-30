<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<jdf:themeFile file="ajaxfileupload.js" />
<title><jdf:message code="友情链接编辑" /></title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-heart-empty"></span>
			<jdf:message code="友情链接管理" />
			<div class="pull-right" id="cd">
				<a href="${dynamicDomain}/links/page" class="btn btn-primary">
					<span class="glyphicon glyphicon-th-list"></span> <jdf:message code="返回" />
				</a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/links/save"
					class="form-horizontal" id="editForm" enctype="multipart/form-data">
					<input type="hidden" name="objectId">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message=="success"?"操作成功":""}</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="websiteName" class="col-sm-3 control-label">
									<jdf:message code="网站名称" />
								</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="websiteName"
										name="websiteName">
								</div>
							</div>
						</div>

						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="websiteUrl" class="col-sm-3 control-label">
									<jdf:message code="网址" />
								</label>
								<div class="col-sm-7">
									<input type="url" class="form-control" id="websiteUrl"
										name="websiteUrl" value="${entity.websiteUrl}">
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="orders" class="col-sm-3 control-label"> <jdf:message code="显示顺序" />
								</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="orders"
										name="orders" min="0">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<div class="col-sm-4">
									<input type="hidden" name="pictureWidth" id="pictureWidth"
										class="form-control" style="width: 290px;"
										value="${entity.pictureWidth!=null?entity.pictureWidth:122 }">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<div class="col-sm-4">
									<input type="hidden" name="pictureHeight" id="pictureHeight"
										class="form-control" style="width: 290px;"
										value="${entity.pictureHeight!=null?entity.pictureHeight:48 }">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="mainPicture" class="col-sm-3 control-label">图片</label>
								<div class="col-sm-7">
									<input name="pictureAddress" type="hidden" id="mainPicture">
									<div id="mainImg" style="width: 500px;">
										<c:if
											test="${entity.objectId != null&& entity.pictureAddress!=null }">
											<img id="preview" alt=""
												src="${dynamicDomain}${entity.pictureAddress}"
												style="width: 290px;">
											<!-- 点击修改按钮中出现的图片大小 -->
										</c:if>
									</div>
									<input type="file" name="uploadFile" id="uploadFile1" style="display: inline;" accept="image/*"> 
									<input type="button" value="裁剪图片" onclick="ajaxFileUpload1();" id="uploadButton1"> 
									<input type="button" value="默认上传" onclick="ajaxFileUpload2();" id="uploadButton2">
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-6">
						<div class="form-group">
							<label for="description" class="col-sm-3 control-label">
								<jdf:message code="备注" />
							</label>
							<div class="col-sm-7">
								<textarea cols="6" rows="12" class="form-control"
									id="description" name="description"></textarea>
							</div>
						</div>
					</div>

					<div class="col-sm-6 col-md-10">
						<c:if test="${message!='success'}">
							<div style="margin-left: 370px">
	                           <input type="button" onclick="validataValue()" class="btn btn-success" value="保存">
							</div>
						</c:if>
					</div>

				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="Links" />
	<script type="text/javascript">
		function ajaxFileUpload1() {
			if($("#pictureWidth").val()==''){
                alert('请填写图片宽度');
                return false;
            }
			if($("#pictureHeight").val()==''){
                alert('请填写图片高度');
                return false;
            }
	        if($("#uploadFile1").val()==''){
	            alert('请选择上传文件');
	            return false;
	        }
	        var cropWidth = $("#pictureWidth").val();
	        var cropHeight = $("#pictureHeight").val();
	        $.ajaxFileUpload({  
	            url: '${dynamicDomain}/screenshot/uploadImage?ajax=1',  
	            secureuri: false,  
	            fileElementId: 'uploadFile1',  
	            dataType: 'json',  
	            success: function(json, status) {
	                if(json.result=='true'){
	                    var filePath = json.filePath;
	                    var width = json.width;
	                    var height = json.height;
	                    var url = '${dynamicDomain}/screenshot/imageCrop?ajax=1&filePath='+filePath+"&width="+width+"&height="+height+"&cropWidth="+cropWidth+"&cropHeight="+cropHeight;
	                    $.colorbox({opacity: 0.5,href:url,fixed:true,width:"65%", height:"85%", iframe:true,onClosed:function(){ if(false){location.reload(true);}},overlayClose:false});
	                }else{
	                    alert(json.message);
	                }
	            },error: function (data, status, e)//服务器响应失败处理函数
	            {
	                alert(e);
	            }
	        }  
	    );
	        return false;  
	    } 
	    
	    function ajaxFileUpload2() {  
	    	if($("#pictureWidth").val()==''){
                alert('请填写图片宽度');
                return false;
            }
            if($("#pictureHeight").val()==''){
                alert('请填写图片高度');
                return false;
            }
	        if($("#uploadFile1").val()==''){
	            alert('请选择上传文件');
	            return false;
	        }
	        $.ajaxFileUpload({  
	            url: '${dynamicDomain}/screenshot/uploadImage?ajax=1',  
	            secureuri: false,  
	            fileElementId: 'uploadFile1',  
	            dataType: 'json',  
	            success: function(json, status) {
	                if(json.result=='true'){
	                    var filePath = json.filePath;
	                    var temp='${dynamicDomain}'+filePath;
	                    var img = '<a style="float: right;cursor: pointer;" id="mainDelete" data-path="'+filePath+'">删除</a>'+
	                    '<img alt="" src='+temp+' width="120px";height="43px;">';
	                    $("#mainPicture").val(filePath);
	                    $("#mainImg").html(img);
	                    bindPictureDelete();
	                }else{
	                    alert(json.message);
	                }
	            },error: function (data, status, e)//服务器响应失败处理函数
	            {
	                alert(e);
	            }
	        }  
	    );
	        return false;  
	    } 
	    
	    function bindPictureDelete(){
	        $('#mainDelete').click(function(){
	            var mainPicture = $(this).data('path');
	            var obj = $(this);
	            $.ajax({
	                url:"${dynamicDomain}/screenshot/deleteImage",
	                type : 'post',
	                dataType : 'json',
	                data:{'filePath':mainPicture},
	                success : function(json) {
	                        obj.parent().html('');
	                         $('#mainPicture').val('');
	                }
	            });
	            
	        });
	    }
	    function validataValue(){
	    	var mainDiv=document.getElementById('mainImg');
	    	if(mainDiv.getElementsByTagName("img").length){
	    		$("#editForm").submit(); 
	    	}else {
	    		alert("请选择上传的图片！");
	    	}
	    		
	    }
		</script>
</body>
</html>