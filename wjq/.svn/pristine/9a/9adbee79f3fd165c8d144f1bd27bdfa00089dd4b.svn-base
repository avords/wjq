<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.mvc.security.SecurityConstants"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="栏目编辑" /></title>
<jdf:themeFile file="ajaxfileupload.js" />
<script type="text/javascript">
$(function() {
	$("#editForm").validate({
		rules : {
			name : {
				required : true,
			},
			
			priority : {
				required : true,
				digits:true
			},
			
			positionCode : {
				required : true,
			},
			
			displayLocation : {
				required : true,
				number:true
			},
			
			isDisplay : {
				required : true,
				number:true
			},
			
			pictureWidth : {
				required : true,
			},
			
			pictureHeight : {
				required : true,
			},
			
		},
		
		messages : {
			name : {
				required : '必填字段'
			},
			
			positionCode : {
				required : '请输入字母和数字组成的编码'
			},
			
			priority : {
				required : '必填字段',
				digits: '请输入整数顺序编码'
			},
			
			displayLocation : {
				required : '必填字段',
				number :'请点击选择显示位置'
			},
			
			isDisplay : {
				required : '必填字段',
				number :'请点击选择是否展示'
			},
			
			pictureWidth : {
				required : '请输入图片的宽度'
			},
			
			pictureHeight : {
				required : '请输入图片的高度'
			},
			
			
		},
		highlight : function(element) {
			$(element).closest('.form-group').addClass('has-error');
		},
		unhighlight : function(element) {
			$(element).closest('.form-group').removeClass('has-error');
		},
		errorElement : 'span',
		errorClass : 'help-block',
		errorPlacement : function(error, element) {
			if (element.parent('.input-group').length) {
				error.insertAfter(element.parent());
			} else {
				error.insertAfter(element);
			}
		}
	});
});
</script>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="menu-icon glyphicon glyphicon-align-left icon-white"></span><jdf:message code="栏目管理" />
			<div class="pull-right">
			<button type="button" class="btn btn-primary" onclick="window.location='<%=dynamicDomain%>/channel/page'">
					<span class="glyphicon glyphicon-chevron-left"></span><jdf:message code="返回" />
			</button>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/channel/save" class="form-horizontal" id="editForm" enctype="multipart/form-data">
					<input id="objectId" type="hidden" name="objectId">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="name">
								 <jdf:message code="栏目名称 " />
								  </label>
								<div class="col-sm-8">
									<input type="text" maxlength="16" placeholder="最多输入16字符" class="form-control" name="name">
								</div>
							</div>
						</div>
						
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="positionCode">
								<jdf:message code="栏目编码 " />
								</label>
								<div class="col-sm-8">
									<input type="text" onblur="isNewPositionCode(this)" name="positionCode" id="positionCode"  class="form-control">
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="parentId">
								<jdf:message code="父栏目" />
								</label>
								<div class="col-sm-8">
									<select id="parentId" name="parentId" class="js-example-placeholder-single" style="width: 100%;background-color: white;" id="parentId">
										<option value="">请选择</option>
										<jdf:selectCollection items="channels" optionValue="objectId" optionText="fullName" />
									</select>
								</div>
							</div>
						</div>
						
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="priority">
								<jdf:message code="顺序" />
								</label>
								<div class="col-sm-8">
									<input type="text" name="priority" id="priority" onchange="isGreaterThenZero(this)" class="form-control">
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">	
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="path">
								<jdf:message code="内部路径" />
								</label>
								<div class="col-sm-8">
									<input type="text" id="path" name="path" id="path" class="form-control">
								</div>
							</div>
						</div>
						
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="isDisplay">
								<jdf:message code="是否显示" />
								</label>
								<div class="col-sm-8">
									<select id="isDisplay" id="isDisplay" name="isDisplay" class="form-control">
										<option>请选择</option>
										<jdf:select dictionaryId="109" valid="true" />
									</select>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="displayLocation">
								<jdf:message code="显示位置" />
								</label>
								<div class="col-sm-8">
									<select id="displayLocation" name="displayLocation" class="form-control">
										<option>请选择</option>
										<jdf:select dictionaryId="1500" valid="true" />
									</select>
								</div>
							</div>
						</div>

						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="isBlank">
								<jdf:message code="是否新窗口" />
								</label>
								<div class="col-sm-8">
									<select id="isBlank" name="isBlank" class="form-control">
										<option>请选择</option>
										<jdf:select dictionaryId="109" valid="true" />
									</select>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="fullName">
								<jdf:message code="完整名称" />
								</label>
								<div class="col-sm-8">
									<input type="text" disabled="disabled" name="fullName" id="fullName" class="form-control" >
								</div>
							</div>
						</div>
						
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="channelExplian">
								<jdf:message code="备注" />
								</label>
								<div class="col-sm-8">
									<textarea maxlength="512" placeholder="最多输入512字符" name="channelExplian" id="channelExplian" class="form-control"></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="row" id="parentBlock">
					  <c:if test="${entity.parentId!=null }">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="pictureWidth">
                                <jdf:message code="本栏目图片宽度" />
                                </label>
                                <div class="col-sm-8">
                                    <input type="text" id="selfPictureWidth" class="form-control" disabled="disabled" value="${parentChannel.pictureWidth }">
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="pictureHeight">
                                <jdf:message code="本栏目图片宽度" />
                                </label>
                                <div class="col-sm-8">
                                    <input type="text" id="selfPictureHeight" class="form-control" disabled="disabled" value="${parentChannel.pictureHeight }">
                                </div>
                            </div>
                        </div>
                      </c:if>
                    </div>
                    
					<div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="pictureWidth">
                                <jdf:message code="子栏目图片宽度" />
                                </label>
                                <div class="col-sm-8">
                                    <input type="text" name="pictureWidth" id="pictureWidth" class="form-control" >
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="pictureHeight">
                                <jdf:message code="子栏目图片高度" />
                                </label>
                                <div class="col-sm-8">
                                    <input type="text" name="pictureHeight" id="pictureHeight" class="form-control" >
                                </div>
                            </div>
                        </div>
                    </div>
                    
					<div class="row">
                            <div class="col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label for="mainPicture"  class="col-sm-3 control-label">图片</label>
                                    <div class="col-sm-8" style="width:auto;">
                                    <input name="pictureAddress" type="hidden" id="mainPicture">
                                    <div id="mainImg" style="width: 200px;">
                                    <c:if test="${entity.objectId != null&& entity.pictureAddress!=null &&entity.pictureAddress!=''}">
                                          <a style="float: right;cursor: pointer;" id="mainDelete" data-path="${entity.pictureAddress }">删除</a>
                                          <img alt="" src="${dynamicDomain}${entity.pictureAddress}" width="200px">
                                    </c:if>
                                    </div>
                                    <input type="file" name="uploadFile" id="uploadFile1" style="display: inline;">
                                    <span id="imageOperation">
                                    </span>
                                    </div>
                                </div>
                            </div>
                     </div>
					
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="pull-right">
							<c:if test="${message!='操作成功'}">
								<button  onclick="validate()" class="btn btn-primary">
									<span class="glyphicon glyphicon-ok"></span>
									<jdf:message code="common.button.save" />
								</button>
								</c:if>
							</div>
						</div>
					</div>
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="Channel" />
	<script type="text/javascript">
	    $(function(){
	    	$(".js-example-placeholder-single").select2();
	    	bindPictureDelete();
	    	$('#parentId').change(function(){
	    		var value = $(this).val();
	    		if(value!=''){
	    			$.ajax({
	                    url:"${dynamicDomain}/channel/getChannel",
	                    type : 'post',
	                    dataType : 'json',
	                    data:{'objectId':value},
	                    success : function(json) {
	                        if(json.result){
	                            var parentChannel = json.channel;
	                            var content = '<div class="col-sm-6 col-md-6">'+
					                            '<div class="form-group">'+
					                                '<label class="col-sm-3 control-label" for="pictureWidth">'+
					                                '<jdf:message code="本栏目图片宽度" />'+
					                                '</label>'+
					                                '<div class="col-sm-8">'+
					                                    '<input type="text" id="selfPictureWidth" class="form-control" disabled="disabled" value="'+parentChannel.pictureWidth+'">'+
					                                '</div>'+
					                            '</div>'+
					                        '</div>'+
					                        '<div class="col-sm-6 col-md-6">'+
					                            '<div class="form-group">'+
					                                '<label class="col-sm-3 control-label" for="pictureHeight">'+
					                                '<jdf:message code="本栏目图片宽度" />'+
					                                '</label>'+
					                                '<div class="col-sm-8">'+
					                                    '<input type="text" id="selfPictureHeight" class="form-control" disabled="disabled" value="'+parentChannel.pictureHeight+'">'+
					                                '</div>'+
					                            '</div>'+
					                        '</div>';
					           $('#parentBlock').html(content);
					           $('#imageOperation').html('<input type="button" value="裁剪图片" onclick="ajaxFileUpload1();" id="uploadButton1">');
	                        }
	                    }
	                });
	    		}else{
	    			$('#parentBlock').html('');
	    			$('#imageOperation').html('<input type="button" value="默认上传" onclick="ajaxFileUpload11();">');
	    		}
	    	}).change();
	    	
	    	$("#displayLocation").change(function(){
	    		var loctionVar=$(this).val();
	    		if(loctionVar==2){
	    			$("#isBlank").hide();
	    			$("#isBlank").val("2");
	    		}else{
	    			$("#isBlank").show();	
	    		}
	    	}).change();
	    	
	    });
		function ajaxFileUpload1() {
			if($("#selfPictureWidth").val()==''||$("#selfPictureWidth").val()=='0'){
                alert('请在父栏目定义本栏目宽度');
                return false;
            }
			if($("#selfPictureHeight").val()==''||$("#selfPictureHeight").val()=='0'){
                alert('请在父栏目定义本栏目高度');
                return false;
            }
	        if($("#uploadFile1").val()==''){
	            alert('请选择上传文件');
	            return false;
	        }
	        var cropWidth = $("#selfPictureWidth").val();
	        var cropHeight = $("#selfPictureHeight").val();
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
	                    $.colorbox({opacity:0.2,href:url,scrolling:true,fixed:true,width:"65%", height:"85%", iframe:true,onClosed:function(){ if(false){location.reload(true);}},overlayClose:false});
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
	    } ;
	    
	    function ajaxFileUpload11() {  
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
	                    '<img alt="" src="${dynamicDomain}'+filePath+'" width="100px" height="100px;">';
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
	    } ;
	    
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
	    };
	    
	    function isNewPositionCode(obj){
	    	var code=obj.value;
	    	var objId=$("#objectId").val();
	    	var dataModel={"positionCode":code,"objId":objId};
	    	$.ajax({
	            url:'${dynamicDomain}/channel/isNewPositionCode',
	            type : 'post',
	            dataType: 'json', 
	            data:dataModel,
	            success:function(json) {
	            	if(!json.result){
	            		alert("该编号已存在,请重新改!");
	            		$("#"+obj.id).val("");
	            	}
	            },
	            error: function (data, status, e)//服务器响应失败处理函数
	            {
	                alert("服务器开小差了:"+e);
	            }
	        });
	    };
	    
	    function isGreaterThenZero(obj){
	    	var num=obj.value;
	    	var id=obj.id;
	    	if(num<1){
	    		alert("请输入大于1的整数!");
	    		$("#"+id).val("");
	    	}
	    };
	    
	    function validate(){
	    	$("#editForm").submit();
	    };
	    
		</script>
</body>