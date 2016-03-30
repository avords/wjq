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
<jdf:themeFile file="css/home_tieba.css" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<jdf:themeFile file="bootstrap.min.js" />
<jdf:themeFile file="kindeditor/kindeditor.js" />
<jdf:themeFile file="kindeditor/lang/zh_CN.js" />
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
</script> 
</head>
<body>
	<div class="box clearfix">
		<div class="container">
			<%@ include file="member_left.jsp" %>
			<div class="merberBody">
				<%@ include file="member_header.jsp" %>
				<div class="ind-box" >
					<div class="title" >我的发言</div><hr style="border: 1px solid #f2f2f2;">
			          <c:forEach items="${pageSearch.list}" var="asl" >
				          <div class="list-cont clearfix"  style="height: 30px;overflow:visible;margin: 0;">
				            <div class="con-text">
				              <div class="in" style="margin: 0;">
				              	   <h3 style="font-size: 15px;">
				              	   		<a style="text-decoration: none;" href="${dynamicDomain}/home/postComment?postId=${asl.objectId}" target="_blank">【<jdf:columnValue dictionaryId="1105" value="${asl.type }"/>】&nbsp;&nbsp;&nbsp;${asl.name }</a>
				              	   		<span style="position: relative;top:3px;left:2px;"></span>
				              	   		<div class="con-date" style="float: right;"> <span style="width: 120;"><fmt:formatDate value="${asl.createDate}" pattern="yyyy-MM-dd HH:mm"/></span></div>
				              	   </h3>
				              </div>
				            </div>
				          </div>
			          </c:forEach>
			          <!-- 分页 -->
			          <div class="Pagination" id="pagination" >
						  <div class="page_numbers"></div>
					  </div>
			          <!--/ 分页 --> 
			        </div>
				</div>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="Member" />
	 <script type="text/javascript">
	 $(function(){
			$('[data-toggle="popover"]').popover();
			
			<c:if test="${pageSearch.totalPage != 0}">
		    $("#pagination").twbsPagination({
		          totalPages: ${pageSearch.totalPage},
		          visiblePages: 5,
		          startPage:${pageSearch.currentPage},
		          onPageClick: function (event, page) {
		            $('#page-content').text('Page ' + page);
		            window.location.href = "${dynamicDomain}/member/myWord?ec_p="+page;
		       }
		    });
		   </c:if>
		});
	 

	</script> 
</body>
</html>