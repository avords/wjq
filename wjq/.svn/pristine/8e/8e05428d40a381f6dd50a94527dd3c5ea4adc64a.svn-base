<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<jdf:themeFile file="ajaxfileupload.js" />
<title><jdf:message code="服务方向管理" /></title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-eject"></span>
			<jdf:message code="服务方向管理" />
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/serviceDirection/save?ajax=1"
					class="form-horizontal" id="editForm" enctype="multipart/form-data">
					<input type="hidden" name="objectId">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message=="success"?"操作成功":""}</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="serviceName" class="col-sm-4 control-label">
									<jdf:message code="服务方向名称" />
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="serviceName"name="serviceName">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="isDelete" class="col-sm-4 control-label">是否删除</label>
								<div class="col-sm-8">
									<select class="form-control" name="isDelete">
										<option value="">请选择</option>
										<jdf:select dictionaryId="109" />
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
                            <div class="col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label for="mainPicture"  class="col-sm-3 control-label">图标</label>
                                    <div class="col-sm-8">
                                    <input name="icon" type="hidden" id="mainPicture">
                                    <div id="mainImg" style="width:122px;">
                                    <c:if test="${entity.objectId != null&& entity.icon!=null }">
                                          <img id="preview" alt="" src="${dynamicDomain}${entity.icon}" width="122px">
                                    </c:if>
                                    </div>
                                    <input type="file" name="uploadFile" id="uploadFile1" style="display: inline;" onchange="javascript:setImagePreview();">
                                    <input type="button" value="默认上传" onclick="ajaxFileUpload2();" id="uploadButton2">
                                    </div>
                                </div>
                            </div>
                        </div>
					<div class="col-sm-6 col-md-6">
						<div class="form-group">
							<label for="remark" class="col-sm-3 control-label">
								<jdf:message code="备注" />
							</label>
							<div class="col-sm-8">
								<textarea cols="6" rows="3" class="form-control" id="remark" name="remark" maxlength="128"></textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12 col-md-12">
							<div class="pull-right">
								<button type="submit" class="btn btn-primary">
									<span class="glyphicon glyphicon-ok"></span><jdf:message code="common.button.save"/>
								</button>
							</div>
						</div>
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
	                    var img = '<a style="float: right;cursor: pointer;" id="mainDelete" data-path="'+filePath+'"></a>'+
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