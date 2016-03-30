<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>桥聊吧管理</title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span>桥聊吧管理
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/post/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_name" class="col-sm-3 control-label">帖子名称</label>
									<input type="text" class="form-control" id="search_LIKES_name" name="search_LIKES_name" style="width: 240px;">
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQL_themeId" class="col-sm-3 control-label">所属主题</label>
								 <select  name="search_EQL_themeId"  id="search_EQL_themeId" class ="js-example-placeholder-single"  style="width: 240px;">
                                     <option value="">请选择</option>
                                    <jdf:selectCollection items="postThemes" optionValue="objectId" optionText="name" />
                                  </select>
							</div>
						</div>
					</div>	
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQL_memberId" class="col-sm-3 control-label">发帖人</label>
								 <select  name="search_EQL_memberId"  id="search_EQL_memberId" class ="js-example-placeholder-single" style="width: 240px;">
                                            <option value="">请选择</option>
                                            <jdf:selectCollection items="members" optionValue="objectId" optionText="loginName" />
                                  </select>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_type" class="col-sm-3 control-label">标题类型</label>
									<select name="search_EQI_type"  id="search_EQI_type" class="input-medium" style="width: 240px;">
										 <option value="">请选择</option>
										 <jdf:select dictionaryId="1105"/>
									 </select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12  col-md-12">
							<div class="pull-right">
								<button type="button" class="btn" onclick="clearFunction()" id="clear">
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
					<jdf:table items="items" retrieveRowsCallback="limit" var="currentRowObject" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
						<jdf:export view="csv" fileName="Role.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="Role.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<input type="hidden" name="isTop" value="${currentRowObject.isTop}" id="isTop">
							<jdf:column property="name" title="帖子名称" style="width: 15%">
								<a href="${dynamicDomain}/postComment/list?postId=${currentRowObject.objectId}">
										${currentRowObject.name}
								</a>
							</jdf:column>
						    <jdf:column property="themeId" title="所属主题" style="width: 10%" >
			                <jdf:columnCollectionValue items="postThemes" nameProperty="name" value="${currentRowObject.themeId}"/>
							</jdf:column>
							<jdf:column property="memberId" title="发帖人" style="width: 10%" >
			                <jdf:columnCollectionValue items="members" nameProperty="loginName" value="${currentRowObject.memberId}"/>
							</jdf:column>
							<jdf:column property="latestReplyDate" cell="date" title="最后回帖时间" headerStyle="width:10%;" />
							<jdf:column property="type" title="标题类型" style="width:10%;">
								 	<jdf:columnValue dictionaryId="1105" value="${currentRowObject.type}" />
							</jdf:column>
							<jdf:column property="isTop" title="是否置顶" style="width:10%;" >
								 	<jdf:columnValue dictionaryId="109" value="${currentRowObject.isTop}" />
								 	<c:if test="${currentRowObject.isTop==2}">
								<a href="${dynamicDomain}/post/isTop/${currentRowObject.objectId}" class="btn btn-primary btn-mini ">
									<span class="glyphicon glyphicon-arrow-up"></span>
									<jdf:message code="置顶"/>
								</a>
								</c:if>
								<c:if test="${currentRowObject.isTop==1}">
								<a href="${dynamicDomain}/post/isTop/${currentRowObject.objectId}" class="btn btn-primary btn-mini ">
									<span class="glyphicon glyphicon-arrow-down"></span>
									<jdf:message code="取消"/>
								</a>
								</c:if>
							</jdf:column>
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 20%;">
								<a href="${dynamicDomain}/post/viewPost/${currentRowObject.objectId}" class="btn btn-success btn-mini ">
									<span class="glyphicon glyphicon-fullscreen"></span>
									<jdf:message code="帖子详情"/>
								</a>
								<a href="javascript:toDeleteUrl('${dynamicDomain}/post/delete/${currentRowObject.objectId}')" class="btn btn-danger btn-mini">
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
	$(function(){
		$(".js-example-placeholder-single").select2();
	});
	function clearFunction(){
		$('#search_LIKES_name').val("");
		$("#search_EQI_type").val("");
		$("#search_EQL_memberId").select2("val", ""); 
		$("#search_EQL_themeId").select2("val", ""); 
	}
	</script>	
</body>
</html>