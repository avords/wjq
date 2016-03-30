<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.mvc.security.SecurityConstants"%>
<%@ include file="../common/header.jsp"%>
<jdf:themeFile file="ajaxfileupload.js" />
<title>合作单位管理</title>
<script type="text/javascript">
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
	    
	    function replaceSpace(obj){
	    	   obj.value = obj.value.replace("%","")
	    	 }
		</script>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-lock"></span>合作单位管理
			<div class="pull-right">
				<a href="${dynamicDomain}/cooperativeEnterprise/page" class="btn btn-primary"> <span class="glyphicon glyphicon-chevron-left"></span>
					<jdf:message code="返回列表" />
				</a>
			</div>
		</div>
		
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/cooperativeEnterprise/save" class="form-horizontal" id="editForm" enctype="multipart/form-data">
					<input type="hidden" name="objectId">
					<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
					</div>
					<div class="row">
					  <div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="company" class="col-sm-3 control-label">公司名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="company" name="company" maxlength="50">
									<span id="notUniqueUser" style="color: red;"></span>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="companyURL" class="col-sm-3 control-label">公司网址</label>
								<div class="col-sm-8">
									<input type="url" class="form-control" id="companyURL" name="companyURL" value="${entity.companyURL}">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
					 <div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="address" class="col-sm-3 control-label">联系地址</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="address" name="address">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="rank" class="col-sm-3 control-label">业内排名</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="rank" name="rank" min=0  value="${entity.rank}">
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
					 <div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="email" class="col-sm-3 control-label">邮箱</label>
								<div class="col-sm-8">
									<input type="email" class="form-control" id="email" name="email" value="${entity.email}">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="cellPhone" class="col-sm-3 control-label">手机号码</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="cellPhone" name="cellPhone"   value="${entity.cellPhone}">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
					 <div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="telePhone" class="col-sm-3 control-label">固定电话</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="telePhone"  name="telePhone" value="${entity.telePhone}" value="${entity.telePhone }" >
								</div>
							</div>
						</div>
					<div class="col-sm-6 col-md-6">
						<div class="form-group">
								<label for="fax" class="col-sm-3 control-label">传真</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="fax" name="fax"  value="${entity.fax}">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="instruction" class="col-sm-3 control-label">公司介绍</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="instruction" name="instruction" value="${entity.instruction}">
								</div>
							</div>
						 </div>
						 <div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="name" class="col-sm-3 control-label">法人代表</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="name" name="name">
								</div>
						   </div>
					   </div>
					  </div>
					 <div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="idCardNo" class="col-sm-3 control-label">身份证号</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="idCardNo" name="idCardNo" >
								</div>
							</div>
						</div>
						 <div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="cotimes" class="col-sm-3 control-label">合作次数</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="cotimes" name="cotimes"  value="${entity.cotimes }" min=0 >
								</div>
						   </div>
					   </div>
					 </div>
					
                   <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="pictureWidth">
                                </label>
                                <div class="col-sm-4">
                                    <input type="text" name="pictureWidth" id="pictureWidth" class="form-control" style="width: 200px; display:none "  value=122>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="pictureHeight">
                                </label>
                                <div class="col-sm-4">
                                    <input type="text" name="pictureHeight" id="pictureHeight" class="form-control" style="width: 200px; display:none" value=48>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    <div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="creditRating" class="col-sm-3 control-label">信用评级</label>
								<div class="col-sm-8">
									<select class="form-control" name="creditRating">
										<option value="">请选择</option>
										<jdf:select dictionaryId="1021" />
									</select>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="serviceType" class="col-sm-3 control-label">服务类型</label>
								<div class="col-sm-8">
									<select class="form-control" name="serviceType">
										<option value="">请选择</option>
										<jdf:select dictionaryId="1111" />
									</select>
								</div>
							</div>
						</div>
                     </div>
				 	<div class="row">
                            <div class="col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label for="mainPicture"  class="col-sm-3 control-label">上传公司LOGO</label>
                                    <div class="col-sm-8">
                                    <input name="pictureAddress" type="hidden" id="mainPicture">
                                    <div id="mainImg" style="width:122px;">
                                    <c:if test="${entity.objectId != null&& entity.pictureAddress!=null }">
                                          <img id="preview" alt="" src="${dynamicDomain}${entity.pictureAddress}" width="122px">
                                    </c:if>
                                    </div>
                                    <input type="file" name="uploadFile" id="uploadFile1" style="display: inline;" onchange="javascript:setImagePreview();">
                                    <input type="button" value="裁剪图片" onclick="ajaxFileUpload1();" id="uploadButton1">
                                    <input type="button" value="默认上传" onclick="ajaxFileUpload2();" id="uploadButton2">
                                    </div>
                                </div>
                            </div>
                        </div>
                    <c:if test="${message!='操作成功'}">
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="pull-right">
								<button type="submit" class="btn btn-primary" id="submitBtn" >
									<span class="glyphicon glyphicon-ok"  ></span><jdf:message code="common.button.save"/>
								</button>
							</div>
						</div>
					</div>
					</c:if>
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="CooperativeEnterprise" />
	<script type="text/javascript">
	$(document).ready(function() {
		jQuery.validator.addMethod( "isIdCardNo",function(value,element){    
			return this.optional(element) || isIdCardNo(value);
	   } ,  " 请输入有效的身份证信息");
		
    	$("#idCardNo").rules("add",{
    		required:true,
    		isIdCardNo:true,
    		maxlength:18,
    		minlength:15,
    		messages:{
    			required:'身份证号不能为空',
        		maxlength:'身份证号最小为15位',
        		minlength:'身份证号最大为18位',
        		isIdCardNo:'身份证格式不正确'
            }
    	});
    	$("#cellPhone").rules("add",{
    		required:true,
    		number:true,
    		maxlength:11,
    		minlength:11,
    		messages:{
    			required:'不能为空',
        		maxlength:'手机号码为11位数字',
        		minlength:'手机号码为11位数字',
        		number:'请输入数字'
            }
    	});
    	$("#telePhone").rules("add",{
    		number:true,
    		maxlength:20,
    		minlength:7,
    		messages:{
    			minlength:'固定电话最少7位数字',
        		maxlength:'固定电话不超过20位数字',
        		number:'请输入数字'
            }
    	});
    	$("#fax").rules("add",{
    		number:true,
    		maxlength:11,
    		messages:{
        		maxlength:'请输入最多11位数字',
        		number:'请输入数字'
            }
    	});
	});
	
	function isIdCardNo(num) {
	    var factorArr = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1);
	    var parityBit = new Array("1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2");
	    var varArray = new Array();
	    var intValue;
	    var lngProduct = 0;
	    var intCheckDigit;
	    var intStrLen = num.length;
	    var idNumber = num;
	    // initialize
	    if ((intStrLen != 15) && (intStrLen != 18)) {
	        return false;
	    }
	    // check and set value
	    for (i = 0; i < intStrLen; i++) {
	        varArray[i] = idNumber.charAt(i);
	        if((varArray[i]>'9'||varArray[i]<'0')&&(i!=17)){
	        	return false;
	        }
	       else if (i < 17) {
	            varArray[i] = varArray[i] * factorArr[i];
	        }
	    }
	    if (intStrLen == 18) {
	        //check date
	        var date8 = idNumber.substring(6, 14);
	        if (isDate8(date8) == false) {
	            return false;
	        }
	        // calculate the sum of the products
	        for (i = 0; i < 17; i++) {
	            lngProduct = lngProduct + varArray[i];
	        }
	        // calculate the check digit
	        intCheckDigit = parityBit[lngProduct % 11];
	        // check last digit
	        if (varArray[17] != intCheckDigit) {
	            return false;
	        }
	    }
	    else {        //length is 15
	        //check date
	        var date6 = idNumber.substring(6, 12);
	        if (isDate6(date6) == false) {
	            return false;
	        }
	    }
	    return true;
	}
	function isDate6(sDate) {
	    if (!/^[0-9]{6}$/.test(sDate)) {
	        return false;
	    }
	    var year, month, day;
	    year = sDate.substring(0, 4);
	    month = sDate.substring(4, 6);
	    if(year<1700||year>2500){
	    	return false
	    }
	    if(month<1||month>12){
	    	return false;
	    }
	    return true
	}

	function isDate8(sDate) {
	    if (!/^[0-9]{8}$/.test(sDate)) {
	        return false;
	    }
	    var year, month, day;
	    year = sDate.substring(0, 4);
	    month = sDate.substring(4, 6);
	    day = sDate.substring(6, 8);
	    var iaMonthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
	    if(year<1700||year>2500){
	    	return false
	    }
	    if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) iaMonthDays[1] = 29;
	    if(month<1||month>12){
	    	return false;
	    }
	    if(day<1||day>iaMonthDays[month-1]){
	    	return false;
	    }
	    return true
	}

	</script>
</body>
</html>