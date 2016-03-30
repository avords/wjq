<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>会员管理</title>
<script type="text/javascript">
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

</script>
</head>
<body>
	<div class="panel">
		<div class="panel-header">
			<i class="icon-edit"></i>会员管理
		</div>
		<div class="panel-content">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/adminMember/save?ajax=1" class="form-horizontal" id="member">
					<input type="hidden" name="objectId">
					<div class="row">
						<div class="span12 alert alert-info" id="messageBox">
							${message}
						</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="loginName" class="col-sm-4 control-label">登录名</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="loginName" name="loginName" >
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="name" class="col-sm-4 control-label">真实姓名</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="name" name="name">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="cellPhone" class="col-sm-4 control-label">手机号码</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="cellPhone"
										name="cellPhone"
										value="${entity.cellPhone }">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="email" class="col-sm-4 control-label">邮箱</label>
								<div class="col-sm-8">
									<input type="email" class="form-control" id="email"
										name="email" value="${entity.email }">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="weChatNu" class="col-sm-4 control-label">微信号</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="weChatNu"
										name="weChatNu">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="fax" class="col-sm-4 control-label">传真</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="fax" name="fax" value="${entity.fax}" >
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
								<div class="form-group">
									<label for="passpordNo" class="col-sm-4 control-label">护照号</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="passpordNo"
											name="passpordNo">
									</div>
								</div>
							</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="idCard" class="col-sm-4 control-label">身份证号</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="idCardNo" name="idCardNo" value="${entity.idCardNo}">
								</div>
							</div>
						</div>
					</div>
				    <div class="row">
				    	<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="birthday" class="col-sm-4 control-label">出生日期</label>
								<div class="col-sm-8">
									<div class="input-append date" id="birthday">
										<input class="input-medium" size="14" type="text"name="birthday" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" style="width: 100% ;">
										<span class="add-on"><i class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-8 col-md-8">
							<div class="form-group">
								<label for="areaCode" class="col-sm-3 control-label">地区</label>
								<div class="col-sm-8">
									<wjq:areaSelect code="${entity.areaCode}" district="areaCode" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
									<label for="address" class="col-sm-4 control-label">联系地址</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="address" name="address" value="${entity.address}">
									</div>
							</div>
						</div>	
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="zip" class="col-sm-4 control-label">邮编</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="zip" name="zip" value="${entity.zip}">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="memberRank" class="col-sm-4 control-label">会员等级</label>
								<div class="col-sm-8">
									<select class="form-control" name="memberRank">
										<option value="">请选择</option>
										<jdf:select dictionaryId="1112" />
									</select>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="company" class="col-sm-4 control-label">所在公司</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="company" name="company" maxlength="50">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="creditRating" class="col-sm-4 control-label">信用评级</label>
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
								<label for="serviceType" class="col-sm-4 control-label">服务类型</label>
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
								<label for="status" class="col-sm-4 control-label">性别</label>
								<div class="col-sm-8">
									<select class="form-control" name="sex">
										<option value="">请选择</option>
										<jdf:select dictionaryId="100" />
									</select>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="status" class="col-sm-4 control-label"><jdf:message
										code="common.lable.status" /></label>
								<div class="col-sm-8">
									<select class="form-control" name="status" id="status">
										<option value="">请选择</option>
										<jdf:select dictionaryId="111" />
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="remark" class="col-sm-4 control-label">备注</label>
								<div class="col-sm-8">
									<textarea class="form-control"  rows="3" cols="30" id="remark"name="remark"  maxlength="128"></textarea>
								</div>
							</div>
						</div>
					</div>
					<input type="hidden" name="password" value="${entity.password}">
						<c:if test="${message!='操作成功'}">
						<div class="span12 pull-right text-right">
		                	<button type="submit" class="btn btn-primary" id="button"><i class="icon-save icon-white"></i><jdf:message code="common.button.save"/></button>
		                </div>
		                </c:if>
					</div>
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain=" Member"/>
	<script type="text/javascript">
	$(document).ready(function() {
		jQuery.validator.addMethod( "isIdCardNo",function(value,element){    
			return this.optional(element) || isIdCardNo(value);
	   } ,  " 请输入有效的身份证信息");
		
        $("#loginName").rules("add",{
        	maxlength:30,
            remote : {
                url : "${dynamicDomain}/adminMember/isUnique?ajax=1&fieldName=loginName&objectId=${entity.objectId}",
                type : "post",
                data: {
                    value: function () {
                        return $('#loginName').val();
                    }
                },
                dataType : "json"
            },
            messages : {
                remote : "该用户已注册",
                maxlength:'最多能输入30个字符串',
            }
        });
        
        $("#cellPhone").rules("add",{
            remote : {
                url : "${dynamicDomain}/adminMember/isUnique?ajax=1&fieldName=cellPhone&objectId=${entity.objectId}",
                type : "post",
                data: {
                    value: function () {
                        return $('#cellPhone').val();
                    }
                },
                dataType : "json"
            },
            messages : {
                remote : "该手机号码已注册",
            }
        });
        
        $("#email").rules("add",{
            remote : {
                url : "${dynamicDomain}/adminMember/isUnique?ajax=1&fieldName=email&objectId=${entity.objectId}",
                type : "post",
                data: {
                    value: function () {
                        return $('#email').val();
                    }
                },
                dataType : "json"
            },
            messages : {
                remote : "该邮箱已注册",
            }
        });
        refreshParentPage(true);
        
        $("#status").rules("add",{
        	required:true,
    		messages:{
    			required:'不能为空',
            }
    	});
        
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
    		required:true,
    		number:true,
    		maxlength:20,
    		minlength:7,
    		messages:{
    			required:'不能为空',
    			minlength:'固定电话最少7位数字',
        		maxlength:'固定电话不超过20位数字',
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