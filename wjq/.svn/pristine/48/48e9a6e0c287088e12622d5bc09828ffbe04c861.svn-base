<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>
	<c:if test="${2==status}">
		文章审核
	</c:if>
	<c:if test="${3==status}">
		文章复核
	</c:if>
	<c:if test="${4==status}">
		文章发布
	</c:if>
</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-cog"></span>
				<c:if test="${2==status}">
					文章审核
				</c:if>
				<c:if test="${3==status}">
					文章复核
				</c:if>
				<c:if test="${4==status}">
					文章发布
				</c:if>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}${action}" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<input type="hidden" class="form-control" id="status" name="status">
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_title" class="col-sm-3 control-label">文章标题</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="search_LIKES_title" name="search_LIKES_title">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_type" class="col-sm-3 control-label">文章类别</label>
								<div class="col-sm-6">
									<select class="form-control" name="search_EQI_type" id="search_EQI_type">
										<option value="">全部</option>
										<jdf:select dictionaryId="1502" />
									</select>
								</div>
							 </div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-12  col-md-12">
							<div class="pull-right">
								<button type="button" class="btn" onclick="clearForm(this)">
									<span class="glyphicon glyphicon-remove"></span><jdf:message code="common.button.clear" />
								</button>
								<button type="submit" class="btn  btn-primary">
									<span class="glyphicon glyphicon-search"></span><jdf:message code="common.button.query" />
								</button>
							</div>
						</div>
					</div>
				</form>
			</jdf:form>
			<div id="tableDiv" class="row">
				<div class="col-sm-12 col-md-12">
					<jdf:table items="items" retrieveRowsCallback="limit" var="currentRowObject" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
						<jdf:export view="csv" fileName="User.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="User.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="title" title="文章标题" headerStyle="width:15%;" />
							<jdf:column property="type" title="文章类型" headerStyle="width:15%;" >
								<jdf:dictionaryName value="${currentRowObject.type }"  dictionaryId="1502"/>
							</jdf:column>
							<jdf:column property="status" title="文章状态" headerStyle="width:15%;" >
								<jdf:dictionaryName value="${currentRowObject.status }"  dictionaryId="1501"/>
							</jdf:column>
							 
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 15%">
                                    <a href="${dynamicDomain}/content/view/${currentRowObject.objectId}" class="btn btn-primary btn-mini">
                                       <jdf:message code="查看"/>
                                    </a>
                                    <c:if test="${currentRowObject.status==2}">
	                                    <a href="javascript:;" class="btn btn-primary btn-mini" onclick="show_audit_confirm2('${dynamicDomain}/content/check/${currentRowObject.objectId}?status=2');">
	                                        <i class="icon-trash icon-white"></i><jdf:message code="审核通过"/>
	                                    </a>
	                                </c:if>
	                                <c:if test="${currentRowObject.status==3}">
	                                    <a href="javascript:;" class="btn btn-primary btn-mini" onclick="show_audit_confirm3('${dynamicDomain}/content/check/${currentRowObject.objectId}?status=3');">
	                                        <i class="icon-trash icon-white"></i><jdf:message code="复核通过"/>
	                                    </a>
	                                </c:if>
	                                <c:if test="${currentRowObject.status==4}">
	                                    <a href="javascript:;" class="btn btn-primary btn-mini" onclick="show_audit_confirm4('${dynamicDomain}/content/check/${currentRowObject.objectId}?status=4');">
	                                        <i class="icon-trash icon-white"></i><jdf:message code="发布"/>
	                                    </a>
	                                </c:if>
                            </jdf:column>
						</jdf:row>
					</jdf:table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
    function show_audit_confirm2(url){
    var r=confirm("确定要审核通过吗?");
	    if (r==true){
	      window.location.href=url;
	    }else{
	      }
    }
    function show_audit_confirm3(url){
        var r=confirm("确定要复核通过吗?");
        if (r==true){
          window.location.href=url;
        }else{
          }
        }
    function show_audit_confirm4(url){
        var r=confirm("确定要发布通过吗?");
        if (r==true){
          window.location.href=url;
        }else{
          }
        }
    </script>
</body>
</html>