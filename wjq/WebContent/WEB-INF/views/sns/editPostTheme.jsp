<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/header.jsp"%>
<jdf:themeFile file="ajaxfileupload.js" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<title><jdf:message code="新增主题"/></title>
</head>
<body>
	 <div class="box border">
		<div class="box-title">
			<h4><span class="glyphicon glyphicon-edit"></span>新增主题</h4>
		</div>
	  	<div class="panel-body">
	  		<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/postTheme/save?ajax=1" class="form-horizontal" name="RoleMenu" id="RoleMenu" >
				 	<input type="hidden" name="objectId" id="objectId">
				 	<input type="hidden" name="createDate" id="createDate">
				 	<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="name" class="col-sm-3 control-label">
									主题名称：
								</label>
								<div class="col-sm-6">
									 <input type="text" name="name" maxlength="10" class="form-control"   />
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="sortNo" class="col-sm-3 control-label">
									序号：
								</label>
								<div class="col-sm-6">
									 <input type="text" name="sortNo" class="form-control"  />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="title" class="col-sm-3 control-label">
									备注：
								</label>
								<div class="col-sm-6">
									 <textarea name="remark" id="remark" cols="31"></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
                            <div class="col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label for="mainPicture"  class="col-sm-3 control-label">上传公司LOGO</label>
                                    <div class="col-sm-8">
                                    <input name="picturePath" type="hidden" id="mainPicture">
                                    <div id="mainImg" style="width:122px;">
                                    <c:if test="${entity.objectId != null&& entity.picturePath!=null }">
                                          <img id="preview" alt="" src="${dynamicDomain}${entity.picturePath}" width="122px">
                                    </c:if>
                                    </div>
                                    <input type="file" name="uploadFile" id="uploadFile1" style="display: inline;" onchange="javascript:setImagePreview();">
                                    <input type="button" value="裁剪图片" onclick="ajaxFileUpload1();" id="uploadButton1">
                                    <input type="button" value="默认上传" onclick="ajaxFileUpload2();" id="uploadButton2">
                                    </div>
                                </div>
                            </div>
                        </div>
				  	<div class="row">
						<div class="col-sm-12 col-md-12">
							<div class="right">
									<button type="button" class="btn btn-primary" onclick="window.location='<%=dynamicDomain%>/postTheme/page';">
										<span class="glyphicon glyphicon-chevron-left"></span><jdf:message code="返回" />
									</button>
									<c:if test="${empty message }">
										<button type="submit" class="btn btn-primary" id="submitBtn" >
											<span class="glyphicon glyphicon-ok"></span><jdf:message code="common.button.save"/>
										</button>
									</c:if>
							</div>
						</div>
					</div>
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="postTheme"/>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#RoleMenu").validate({
			rules : {
				name : {
					required : true,
					maxlength:30
				},
				sortNo : {
					number:true,
					digits: true ,
					min:0
					
				}
			},
			messages : {
				name : {
					required : '主题不能为空',
					maxlength:'主题名称长度最大不超过30'
				},
				sortNo : {
					number : '请输入数字',
					digits: "只能输入整数" ,
					min:'序号不能为负数'
				}
			},
		});
		
   });
	
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
	                     $('#picturePath').val('');
	            }
	        });
	        
	    });
	}

	function ajaxFileUpload1() {
	    if($("#uploadFile1").val()==''){
	        alert('请选择上传文件');
	        return false;
	    }
	    var cropWidth = 200;
	    var cropHeight = 100;
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
	                $('#picturePath').attr("value",filePath);
	                $('#preview').attr("src",'${dynamicDomain}'+filePath);
	                var temp='${dynamicDomain}'+filePath;
	                var img = '<a style="float: right;cursor: pointer;" id="mainDelete" data-path="'+filePath+'">删除</a>'+
	                '<img alt="" src="'+temp+'"  width="200px";height="160px;">';
	                $("#picturePath").val(filePath);
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
		                    var img = '<a style="float: right;cursor: pointer;" id="mainDelete" data-path="'+filePath+'">删除</a>'+
		                    '<img alt="" src="${dynamicDomain}'+filePath+'" width="500px">';
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
		    
		    function setImagePreview(avalue) {
		    	var docObj=document.getElementById("uploadFile1");
		    	var imgObjPreview=document.getElementById("preview");
		    	if(docObj.files &&docObj.files[0])
		    			{
		    			imgObjPreview.style.display = 'block';
		    			imgObjPreview.style.width = '500px';
		    			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
		    			}
		    }
	</script>
</body>