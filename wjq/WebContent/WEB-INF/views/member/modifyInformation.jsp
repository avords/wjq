<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<%@page import="com.mvc.framework.util.DomainUtils"%>
<%
	String dynamicDomain = DomainUtils.getDynamicDomain();
	request.setAttribute("dynamicDomain", dynamicDomain);
%>
<!DOCTYPE html>
<html>
<head>
<jdf:themeFile file="css/home_merber.css" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<jdf:themeFile file="jquery.validate.min.js" />
<jdf:themeFile file="jquery.validate_zh.js" />
<jdf:themeFile file="common.js" />
<jdf:themeFile file="ajaxfileupload.js" />
<title>资料修改</title>
<style type="text/css">
	.loginClass{
 		font-size:14px;
 		height:24px;
 		width:160px;
 		border:0px ;
 		box-shadow: inset 1px 1px 5px #d5e0e9;
 		margin-left: -50px;
	}
    
    .mytitle{
       font-size:15px; 
    }
    .help-block {
	color: red;
	}
</style>
<script type="text/javascript">
var processMessage = "";
  $(function() {
	$("#vForm").validate({
		rules : {
			zip : {
				maxlength:6,
				minlength:6
			},
			company : {
				required : true,
				maxlength:50,
				minlength:1
			},
			name : {
				required : true,
				maxlength:30,
				minlength:1
			},
			weChatNu : {
				maxlength:16
			},
			
			address : {
				required : true,
				maxlength:128,
				minlength:1
			},
		},
		
		messages : {
			zip : {
				maxlength:'邮编必须为6位',
				minlength:'邮编必须为6位'
			},
			
			weChatNu : {
				maxlength:'微信号不能超过16位'
			},
			
			name : {
				required : '昵称不能为空',
				maxlength:'最多输入30位',
				minlength:'昵称不能为空'
			},
			company : {
				required : '工作单位不能为空',
				maxlength:'最多输入50位',
				minlength:'工作单位不能为空'
			},
			address : {
				required : '地址不能为空',
				maxlength:'地址最多输入128位',
				minlength:'地址不能为空'
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

	
	function upLoadFile(){
		document.RoleMenu.uploadFile.click()
	}
	
	function uploadImage(){
		 $.ajaxFileUpload({  
		    url: '${dynamicDomain}/member/uploadImage',
            secureuri: false,  
            fileElementId: 'uploadFile',  
            dataType: 'json',  
            success: function(data) {
            	$('#imageId').attr("src",'${dynamicDomain}'+data.filePath);
				$('#titleImage').attr("value",data.filePath);
            }
	})
	}
	function initDefaultArea(areaCode){
		var first = "province";
		var second = "city";
		var third = "_areaCode";
		initArea(areaCode,first,second,third);
	}
	function initArea(areaCode,first,second,third){
		if(areaCode.length>=2){
			var code = areaCode.substr(0,2);
			$("#" + first).val(code);
			$.ajax({
				url: '${dynamicDomain}/home/area/getChildren/' + code,
				type : 'post',
				dataType : 'json',
				success : function(data) {
					 var name = $("#" + second + "");
				     name.children().remove();
				     var options = "<option value=''>请选择</option>";
					 for(var i=0;i<data.areas.length;i++){
						options +=("<option value='" +data.areas[i].code + "'>" + data.areas[i].name+"</option>");
					 }
					 name.append(options);
					 name.val(code);
					 if(areaCode.length>=4){
						 code = areaCode.substr(0,4);
						 name.val(code);
						 $.ajax({
							url: '${dynamicDomain}/home/area/getChildren/' + code,
							type : 'post',
							dataType : 'json',
							success : function(data) {
								 var name = $("#" + third + "");
							     name.children().remove();
							     var options = "<option value=''>请选择</option>";
								 for(var i=0;i<data.areas.length;i++){
									options +=("<option value='" +data.areas[i].code + "'>" + data.areas[i].name+"</option>");
								 }
								 name.append(options);
								 name.val(areaCode);
							}
						 });
					 }
				}
			});
		}
	}
	function getAreaChildren(child,parent){
		var code = $(parent).val();
		if(code!=""){
			$.ajax({
				url: '${dynamicDomain}/home/area/getChildren/' + code,
				type : 'post',
				dataType : 'json',
				success : function(data) {
					if(data.areas.length == 0){
						$("#city").css('display','none');
					}else{
						 $("#city").css('display','inline-block');
						 var name = $("#" + child + "");
					     name.children().remove();
					     var options = "<option value=''>请选择</option>";
						 for(var i=0;i<data.areas.length;i++){
							options +=("<option value='" +data.areas[i].code + "'>" + data.areas[i].name+"</option>");
						 }
						 name.append(options);
					 }
					 if(child == "city"){
					 	$("#_departmentId").css('display','none');
					 } else{
						$("#_departmentId").css('display','inline-block');
					 }
				}
			});
		}else{
			var name = $("#" + child + "");
			name.val("");
			name.change();
		}
	}
	function setAreaCode(trigger, type) {
		var code = $(trigger).val();
		var district = $('#areaCode');
		if (type == 1) {
			district.val(code);
		} else if (type == 2) {
			if (code == '') {
				district.val($('#province').val());
			} else {
				district.val(code);
			}
		} else if (type == 3) {
			if (code == '') {
				var t = $('#city').val();
				if (t == '') {
					t = $('#province').val();
				}
				district.val(t);
			} else {
				district.val(code);
			}
		}
	}
	
	function info(){
		alert("恭喜，资料修改完成！");
	}
</script> 
</head>
<body>
	<div class="box clearfix">
		<div class="container">
			<%@ include file="member_left.jsp" %>
			<div class="merberBody">
				<%@ include file="member_header.jsp" %>
				<div class="ind-box" >
					<div class="title" >基本资料</div><hr style="border: 1px solid #f2f2f2;">
					<form id="vForm" name="vForm"
						action="${dynamicDomain}/member/saveModify"
						class="form-horizontal">
						<div class="divCenter" style="margin-left: 100px; width: 400px; height: auto">
							<table style="height: 300px;width:500px;padding-left:0px;">
								<tr>
									<td><label class="mytitle" >用户性别:</label></td>
									<td>
										<label style="width:80px;font-size: 15px;display: inline-block;"><input type="radio"  name="sex" value="1" checked="true">男</label>
										<label style="width:80px;font-size: 15px;display: inline-block;"><input type="radio"  name="sex" value="2" id="women">女</label>
									</td>
								</tr>
								<tr>
									<td><label class="mytitle" for="name">用户昵称:</label> </td>
									<td><input type="text" id="name" name="name" value="${member.name}" class="loginClass"><span class="red">*</span>
										</td>
								</tr>
								<tr>
									<td><label class="mytitle"  for=""weChatNu"">微信号码:</label> </td>
									<td><input type="text" class="loginClass"  value="${member.weChatNu}" name="weChatNu" id="weChatNu" /></td>
								</tr>
								<tr>
									<td><label class="mytitle"  for="zip">邮政编号:</label></td>
									<td> <input type="text" class="loginClass" value="${member.zip}" name="zip" id="zip" /></td>
								</tr>
								
								<tr>
									<td><label class="mytitle"  for="company">工作单位:</label></td>
									<td> <input type="text" class="loginClass" value="${member.company}" name="company" id="company" /><span class="red">*</span></td>
								</tr>
								<tr>
									<td><label class="mytitle"  for="idCardNo">身份证号:</label></td>
									<td> <input type="text" class="loginClass" value="${member.idCardNo}" name="idCardNo" id="idCardNo" /></td>
								</tr>
								<tr>
									<td><label class="mytitle"  for="passpordNo">护照编号:</label></td>
									<td> <input type="text" class="loginClass" value="${member.passpordNo}" name="passpordNo" id="passpordNo" /></td>
								</tr>
								<tr>
									<td><span class="mytitle" >联系地址:</span></td>
									<td><span class="loginClass"><wjq:areaSelect code="${member.areaCode}" district="areaCode" /></span></td>
								</tr>
								<tr>
									<td><label class="mytitle"  for="address">详细地址:</label></td>
									<td> <input type="text" class="loginClass" value="${member.address}" name="address" id="address" /><span class="red">*</span></td>
								</tr>
								
								<tr>
									<td>
										<button type="button" class="btn btn-primary"
											onclick="window.location='<%=dynamicDomain%>/member/memberCenter';">
											<jdf:message code="返回" />
										</button>
										<button type="submit" id="save" class="btn btn-primary">保存</button>
									</td>
								</tr>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="Member" />
	 <script type="text/javascript">
	$(document).ready(function() {
		  var sex=${member.sex};
    	if (sex==2) {
    		$("#women").prop("checked",true);
    	}
		 
    	if (${message=="success"}) {
    		info();
    	}
    	
		jQuery.validator.addMethod( "isIdCardNo",function(value,element){    
			return this.optional(element) || isIdCardNo(value);
	   } ,  " 请输入有效的身份证信息");
		
    	$("#idCardNo").rules("add",{
    		isIdCardNo:true,
    		maxlength:18,
    		minlength:15,
    		
    		messages:{
        		maxlength:'身份证号最小为15位',
        		minlength:'身份证号最大为18位',
        		isIdCardNo:'身份证格式不正确'
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