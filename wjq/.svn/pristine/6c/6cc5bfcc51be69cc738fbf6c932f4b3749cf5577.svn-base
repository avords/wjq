<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="订单编辑"/></title>
</head>
<body>
<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span><jdf:message code="订单编辑"/>
		</div>
	  	<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/order/save?ajax=1" class="form-horizontal" id="editForm">
					<input type="hidden" name="objectId">
			 		<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message} 
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="orderNumber" class="col-sm-3 control-label"> <jdf:message code="订单号" /></label>
                                <div class="col-sm-8">
                                	<input type="text" name="orderNumber"  class="input-medium" readonly="readonly" style="width: 240px;">
                                </div>
                            </div>
                        </div>
                         <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="customerId" class="col-sm-3 control-label"> <jdf:message code="客户id" /></label>
                                <div class="col-sm-8">
                                   <input type="text" name="customerId" readonly="readonly" style="width: 240px;">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="consigneeName" class="col-sm-3 control-label"><jdf:message code="收货人" /></label>
                                <div class="col-sm-5">
                                	<input type="text" name="consigneeName" readonly="readonly" style="width: 240px;">
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="consigneePhone" class="col-sm-3 control-label"><jdf:message code="联系方式" /></label>
                                    <div class="col-sm-8">
                                    	<input type="text"  name="consigneePhone" readonly="readonly" style="width: 240px;">
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="consigneeAddress" class="col-sm-3 control-label"><jdf:message code="收货地址" /></label>
                                <div class="col-sm-5">
                                	<input type="text" name="consigneeAddress" readonly="readonly" style="width: 240px;">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="deposit" class="col-sm-3 control-label"><jdf:message code="定金" /></label>
                                    <div class="col-sm-8">
                                    	<input type="text" value="${entity.deposit }" readonly="readonly" style="width: 240px;">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="amount" class="col-sm-3 control-label"><jdf:message code="总金额" /></label>
                                <div class="col-sm-5">
                                	<input type="text" value="${entity.amount}" readonly="readonly" style="width: 240px;">
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="orderStatus" class="col-sm-3 control-label"><jdf:message code="订单状态" /></label>
                                    <div class="col-sm-8">
                                    	<select name="orderStatus"  class="input-medium" disabled="disabled" style="width: 240px;">
										    <option value=""></option>
										   <jdf:select dictionaryId="1301"/>
									 </select>
                                </div>
                            </div>
                        </div>
                    </div>
                  <div class="row">  
                    <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="checkPersonId" class="col-sm-3 control-label"><jdf:message code="订单核对" /></label>
                                <div class="col-sm-8">
                                	<input type="text" name="checkPersonId" readonly="readonly" style="width: 240px;">
                                </div>
                            </div>
                      </div>
                   <div class="col-sm-6 col-md-6">
                        	<div class="form-group">
                                <label for="detail" class="col-sm-3 control-label"><jdf:message code="摘要" /></label>
                                <div class="col-sm-8">
                                	<input type="text" name="detail" readonly="readonly" style="width: 240px;">
                                </div>
                            </div>
                       </div> 
                   </div>       
                   <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="orderDate" class="col-sm-3 control-label"><jdf:message code="下单时间" /></label>
                                <div class="col-sm-8">
                                	<div class="input-append date" id="orderDate">
										<input class="input-medium" size="14" type="text" name="orderDate" readonly="readonly" cell="date" format="yyyy-MM-dd HH:mm:ss" style="width: 240px;">
									</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="confirmDate" class="col-sm-3 control-label"><jdf:message code="确认时间" /></label>
                                <div class="col-sm-8">
                                	 <div class="input-append date" id="requiredDate">
										<input class="input-medium" size="14" type="text" name="confirmDate" readonly="readonly" cell="date" format="yyyy-MM-dd HH:mm:ss" style="width: 240px;">
									</div>
                                </div>
                            </div>
                        </div>
                    </div> 
				</form>
			</jdf:form>
		<div id="tableDiv" class="row">
			<h2 style="font-weight:700;font-size: 15px;color: green">商品列表</h2>
			<table id="productList" class="table table-hover">
		 		<tr>
		 			<th class="title">商品名称</th>
		 			<th class="title">订购数量</th>
		 			<th class="title">查看商品</th>
		 		</tr>
 		
		 		<c:forEach items="${productList }" var="asl" >
			 		<tr class="contain">
			 			<td >${asl.name }</td>
			 			<td >
			 			<c:forEach items="${orderDetailsList }" var="ods" >
			 				<c:if test="${ods.productId==asl.objectId}">${ods.productId}</c:if>
			 			</c:forEach>
			 			</td>
			 			<td ><button class="btn btn-info" type="button" onclick="window.location.href='${dynamicDomain}/product/view/${asl.objectId}?ajax=1'">查看详情</button></td>
			 		</tr>
		 		</c:forEach>
			</table>
		</div>
	</div>
</div>

<script type="text/javascript">
	 $(function(){
		 parent.reloadParent= false;
        });
	</script>
</body>
</html>