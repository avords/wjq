<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>有话说说-详细</title>
<jdf:themeFile file="css/home_tieba.css" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<jdf:themeFile file="bootstrap.min.js" />
<jdf:themeFile file="kindeditor/kindeditor.js" />
<jdf:themeFile file="kindeditor/lang/zh_CN.js" />
<%
	String postId =String.valueOf((request.getAttribute("postId")));
	Integer total=(Integer)request.getAttribute("praiseNumber");
%>
</head>

<body>
<div class="box">
  <div class="tieba"> 
    
    <!--贴吧头部-->
    <div class="head clearfix">
      <div class="hd-title">
        <h3><i></i>有话说说<small>出国人士、学生游子交流平台</small></h3>
      </div>
      <div class="hd-btn">
        <div class="text">主题：<span class="red">${themeNum }</span> 　帖子：<span class="red">${postNum }</span></div>
      </div>
    </div>
    <!--/贴吧头部-->
    
    <div class="body">
      <div class="content clearfix">
        <div class="tieba-page">
          <div class="page-title">
            <h1>${post.name}</h1>
            <div class="zan"> <a href="javascript:void(0);" class="icon1" onclick="postPraise()"><i></i>赞(<span id="demo">${praiseNumber}</span>)</a> <a href="#rely" class="icon2">回复</a> </div>
          </div>
          <c:if test="${pageSearch.currentPage==1 }">
          <div class="page-cont">
            <div class="left">
              <div class="lz"></div>
              <div class="pic">
                  <c:choose>
		          <c:when test="${member.pictureAddress!= null}">
		          <img src="${dynamicDomain}${member.pictureAddress}"/>
		          </c:when> 
		          <c:otherwise> 
		          <img src="<jdf:theme/>img/home/default_tx.jpg" />
		          </c:otherwise> 
		          </c:choose>
                <p>${asl.memberLoginName}</p>
              </div>
            </div>
            <div class="right">
              <p>${post.content}</p>
              <div>1楼　<fmt:formatDate value="${post.createDate}" pattern="yyyy-MM-dd hh:mm"/></div>
            </div>
          </div>
          </c:if>
          <c:forEach items="${pageSearch.list}" var="asl" >
          <div class="page-cont">
            <div class="left">
              <div class="pic">
             	 <c:choose>
		          <c:when test="${asl.member.pictureAddress!= null}">
		          <img src="${dynamicDomain}${asl.member.pictureAddress}"/>
		          </c:when> 
		          <c:otherwise> 
		          <img src="<jdf:theme/>img/home/default_tx.jpg" />
		          </c:otherwise> 
		          </c:choose>
                <p>${asl.commentatorName}</p>
              </div>
            </div>
            <div class="right">
              <p>${asl.content}</p>
              <div>${asl.levelCount}楼　<fmt:formatDate value="${asl.createDate}" pattern="yyyy-MM-dd HH:mm"/></div>
            </div>
          </div>
          </c:forEach>
           <!-- 分页 -->
           	<div class="Pagination" id="pagination">
			</div>
          <!--/ 分页 --> 
        </div>
        <div class="side">
        <c:if test="${adminMember!=null}">
          <div class="side-tx"> 
          <c:choose>
          <c:when test="${adminMember.pictureAddress!= null}">
          <img src="${dynamicDomain}${adminMember.pictureAddress}"/>
          </c:when> 
          <c:otherwise> 
          <img src="<jdf:theme/>img/home/default_tx.jpg" />
          </c:otherwise> 
          </c:choose>
            <h4>${adminMember.loginName}</h4>
            <p>等级: <span class="red"><jdf:columnValue dictionaryId="1112" value="${adminMember.memberRank}"/></span></p>
          </div>
          </c:if>
          <div class="notice">
            <h4>公告</h4>
            <p>吧内请勿发布广告、请勿进行商业宣传、勿留联系方式。违者删帖封号，对于删帖封号有任何疑问可以通过申诉解决。请大家爱护贴吧，共同维护良好的交流环境么么哒。</p>
          </div>
          <div class="tel"><img src="<jdf:theme/>img/tieba_tel.png" width="182" height="112"></div>
        </div>
      </div>
    </div>
    
    <!--发表新帖-->
    <div class="post"> <a id="rely"></a>
      <div class="post-inner">
        <h3><span>发贴请遵守万家桥贴吧协议及规范</span>发表回复</h3>
        <div class="box">
         <form action="${dynamicDomain}/member/postCommentSave?postId=${postId}" method="post" id="postCommentForm">
	          <div class="editor">
	           <textarea id="editor_id" name="content"  placeholder="请输入内容"></textarea>
	          </div>
	          <div class="submit">
	            <input type="button" onclick="validataValue()" value="发表">
	          </div>
          </form>
        </div>
      </div>
    </div>
    <!--/发表新帖--> 
  </div>
</div>
<script type="text/javascript">

function validataValue(){
	if(${empty sessionScope.m_loginName }){
		var r=confirm("尚未登录,立刻登录吗?");
		if (r==true){
			window.location.href='${dynamicDomain}/home/login';
		    }else{
		      }
		return;
	}
	//敏感词过滤
	var title="";
	var content=$("#editor_id").val();
	
	if(isAllBlank(content)){
		alert("回帖内容不能为空!");
		return;
	}
	$.ajax({
		type:'post',
		url:'${dynamicDomain}/member/sensitiveWord',
		dataType:'json',
		data:"title="+ title+"&content="+content,
       success:function(msg){
        	if(msg.isHaveSensitiveword){
        		alert("请不要发表敏感言论!");
        	}else {
        		$("#postCommentForm").submit();
        		alert("回帖成功!");
        	}
	     }
   });
	
	 function isAllBlank(str){
	    	str=str.replace(/&nbsp;|\s/g,"");
	    	if ( str.length == 0 ){
	    		return true;
	    	}
	    	    return false;
	    }
}

	$(function(){
		$('[data-toggle="popover"]').popover();
		
		<c:if test="${pageSearch.totalPage != 0}">
	    $("#pagination").twbsPagination({
	          totalPages: ${pageSearch.totalPage},
	          visiblePages: 5,
	          startPage:${pageSearch.currentPage},
	          onPageClick: function (event, page) {
	            $('#page-content').text('Page ' + page);
	            window.location.href = "${dynamicDomain}/home/postComment?postId=${postId}&ec_p="+page;
	       }
	    });
	   </c:if>
	});
	
	 KindEditor.ready(function(K) {
         editor = K.create('#editor_id',{
        	  uploadJson : '${dynamicDomain}/connector/kindUpload?ajax=1',
              afterBlur: function(){this.sync();},
              allowFileManager : true,
       		  width:658,
       		  height:250,
       		  minWidth:658,
       		  minHeight:250,
       		  resizeType:0,
       		  items:['link','image','media','emoticons','baidumap']
         });
   });
	
function postPraise(){
	var postId =${post.objectId};
	$.ajax({
        url:'${dynamicDomain}/home/postPraise/'+postId,
        type : 'post',
        dataType: 'json', 
        success:function(json) {
        	var temp=json.praiseNumber;
			var x =document.getElementById("demo");
			x.innerHTML=temp;
        },
    });
}

</script>
</body>
</html>
