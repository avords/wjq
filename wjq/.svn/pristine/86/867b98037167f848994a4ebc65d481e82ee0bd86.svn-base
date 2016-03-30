<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>订单管理中心</title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span><jdf:message code="订单管理中心"/>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/order/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					
					<div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="search_EQS_orderNumber" class="col-sm-2 control-label"> <jdf:message code="订单号" /></label>
                                <div class="col-sm-8">
                                	<input type="text" name="search_EQS_orderNumber" style="width: 240px;"  class="input-medium" onkeyup="replaceSpace(this)" onkeydown="replaceSpace(this)">
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="search_EQI_orderStatus" class="col-sm-2 control-label"> <jdf:message code="订单状态" /></label>
                                <div class="col-sm-8">
                                	<select name="search_EQI_orderStatus" style="width: 240px;"  class="input-medium">
										 <option value="">全部</option>
										 <jdf:select dictionaryId="1301"/>
									 </select>
                                </div>
                            </div>
                        </div>
                     </div>   
                        <div class="row">
                        <div class="col-sm-12  col-md-12">
                            <div class="pull-right">
                                <button type="button" class="btn" onclick="clearForm(this)">
                                    <span class="glyphicon glyphicon-remove"></span>
                                    <jdf:message code="common.button.clear" />
                                </button>
                                <button type="submit" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-search"></span>
                                    <jdf:message code="common.button.query" />
                                </button>
                            </div>
                        </div>
                    </div>
				 </form>
			</jdf:form>
			<div id="tableDiv" class="row">
				<div class="col-sm-12 col-md-12">
					<jdf:table items="items" var="currentRowObject" retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
						<jdf:export view="csv" fileName="order.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="order.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="orderNumber" title="订单号" style="width:10%" />
			                <jdf:column property="orderDate" title="下单日期" style="width:10%" cell="date" format="yyyy-MM-dd"/>
			                <jdf:column property="consigneeName" title="收货人" style="width:10%" />
			                <jdf:column property="consigneePhone" title="联系电话" style="width:10%" />
			                <jdf:column property="deposit" title="定金" style="width:10%" />
			                <jdf:column property="amount" title="总金额" style="width:10%" />
                            <jdf:column property="orderStatus" title="订单状态" headerStyle="width:10%;">
								<jdf:dictionaryName value="${currentRowObject.orderStatus }" dictionaryId="1301" />
							</jdf:column>
							<jdf:column alias="查看订单" title="查看订单" sortable="false" viewsAllowed="html" style="width:10%">
								<a href="${dynamicDomain}/order/view/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<span class="glyphicon glyphicon-fullscreen"></span><jdf:message code="查看"/>
								</a>
							</jdf:column>	
							<jdf:column alias="订单核对" title="订单核对" sortable="false" viewsAllowed="html" style="width:10%">
								<c:if test="${currentRowObject.orderStatus==1}">
	                                    <a href="javascript:;" class="btn btn-warning btn-mini" onclick="show_audit_confirm2('${dynamicDomain}/order/check/${currentRowObject.objectId}?orderStatus=2');">
	                                        <span class="glyphicon glyphicon-check"></span><jdf:message code="确认定金支付"/>
	                                    </a>
                                </c:if>
                                <c:if test="${currentRowObject.orderStatus==2}">
                                    <a href="javascript:;" class="btn btn-danger btn-mini" onclick="show_audit_confirm3('${dynamicDomain}/order/check/${currentRowObject.objectId}?orderStatus=3');">
                                        <span class="glyphicon glyphicon-check"></span><jdf:message code="确认总金额支付"/>
                                    </a>
                                </c:if>
                                <c:if test="${currentRowObject.orderStatus==3}">
                                    <a href="javascript:;" class="btn btn-success btn-mini" onclick="show_audit_confirm4('${dynamicDomain}/order/confirm/${currentRowObject.objectId}?orderStatus=4');">
                                        <span class="glyphicon glyphicon-check"></span><jdf:message code="确认订单完成"/>
                                    </a>
                                </c:if>
                                <c:if test="${currentRowObject.orderStatus==4}">
                                        <jdf:message code="订单完成"/>
                                </c:if>
							</jdf:column>
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width:8%">
								<a href="javascript:toDeleteUrl('${dynamicDomain}/order/delete/${currentRowObject.objectId}')" class="btn btn-danger btn-mini">
									<span class="glyphicon glyphicon-trash"></span>
									<jdf:message code="common.button.delete"/>
								</a>
							</jdf:column>
						</jdf:row>
					</jdf:table>
				</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
    function show_audit_confirm2(url){
    var r=confirm("确定定金已支付吗?");
    if (r==true){
      window.location.href=url;
    }else{
      }
    }
    function show_audit_confirm3(url){
        var r=confirm("确定总金额已支付吗?");
        if (r==true){
          window.location.href=url;
        }else{
          }
        }
    function show_audit_confirm4(url){
        var r=confirm("确定订单已完成吗?");
        if (r==true){
          window.location.href=url;
        }else{
          }
        }
    function replaceSpace(obj){
    	   obj.value = obj.value.replace("%","")
    	 }
    
    </script>	
	
</body>
</html>