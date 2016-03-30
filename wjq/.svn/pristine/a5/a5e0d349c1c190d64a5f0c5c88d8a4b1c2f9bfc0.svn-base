<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Cache" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-control" content="no-cache">
<meta http-equiv="Cache" content="no-cache">
<title>有话说说</title>
<jdf:themeFile file="css/home_tieba.css" />
<jdf:themeFile file="css/home_base.css" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<jdf:themeFile file="kindeditor/kindeditor.js" />
<jdf:themeFile file="kindeditor/lang/zh_CN.js" />
<jdf:themeFile file="bootstrap.min.js" />
<style type="text/css">
	.page{
		
	}

</style>

</head>

<body>
<div class="box">
  <div class="tieba"> 
    
    <!--贴吧头部-->
    <div class="head clearfix">
      <div class="hd-title">
        <h3><i></i>有话说说<small>出国人士、学生游子交流平台</small></h3>
      </div>
      <div class="hd-btn"> <a class="btn" href="#rely"><i></i>发表新帖</a>
        <div class="text">主题：<span class="red">${themeNum }</span> 　帖子：<span class="red">${postNum }</span></div>
      </div>
    </div>
    <!--/贴吧头部-->
    <c:if test="${!empty message }">
    <div class="head clearfix" style="font-size: 100%" >
			${message}
	</div>
	</c:if>
	
    <div class="body"> 
      <!--板块分类-->
      <div class="category clearfix">
        <ul>
          <li><a id="themeAll" class="active" href="${dynamicDomain}/home/post">全部</a></li>
          <c:forEach items="${themes }" var="asl" >
          	 <c:if test="${asl.objectId==themeId}"><li><a class="active" href="${dynamicDomain}/home/post?themeId=${asl.objectId}" >${asl.name}</a></li></c:if>
			 <c:if test="${asl.objectId!=themeId}"><li><a href="${dynamicDomain}/home/post?themeId=${asl.objectId}" >${asl.name}</a></li></c:if>
		  </c:forEach>
        </ul>
        
        <form class="tb-search" action="${dynamicDomain}/home/post" method="post">
             <input class="tb-searchKey" id="searchText" name="searchText" value="${searchText }" type="text" placeholder="帖子搜索"/>
             <input type="hidden" name="themeId" id="themeId" value="${themeId}"/>
             <input type="hidden" name="type" id="type" value="${type}"/>
             <input class="tb-searchBtn" type="submit" value=""/>
        </form>
      </div>
      <!--/板块分类-->
      
      <div class="content clearfix">
        <div class="list">
          <ul class="list-type clearfix">
            <li><a id="typeAll" class="active" onclick="doClick(0)">全部</a></li>
            <c:forEach items="${types }" var="asl" >
          	 <c:if test="${asl.value==type}"><li><a class="active" onclick="doClick(${asl.value})">${asl.name}</a></li></c:if>
			 <c:if test="${asl.value!=type}"><li><a class="" onclick="doClick(${asl.value})">${asl.name}</a></li></c:if>
		    </c:forEach>
          </ul>
          
          <c:forEach items="${pageSearch.list }" var="asl" >
	          <div class="list-cont clearfix">
	            <div class="con-text">
	              <div class="in" style="margin: 0 200px 0 50px;">
	              		<c:if test="${asl.isTop==1}"><h3 style="font-size: 14px;"><a style="text-decoration: none;" href="${dynamicDomain}/home/postComment?postId=${asl.objectId}" target="_blank">【<jdf:columnValue dictionaryId="1105" value="${asl.type }"/>】&nbsp;&nbsp;${asl.name }</a><span style="position: relative;top:3px;left:2px;"><img src="<jdf:theme/>img/zding.gif" /></span></h3></c:if>
		              	<c:if test="${asl.isTop==2}"><h3 style="font-size: 14px;"><a style="text-decoration: none;" href="${dynamicDomain}/home/postComment?postId=${asl.objectId}" target="_blank">【<jdf:columnValue dictionaryId="1105" value="${asl.type }"/>】&nbsp;&nbsp;${asl.name }</a></h3></c:if>
		                <p style="margin-left:10px;">${asl.content }</p>
	              </div>
	            </div>
	            <div class="con-num">
	              <div><span>${asl.commentNumber }</span></div>
	            </div>
	            <c:if test="${asl.latestReplyName!=null}"><div class="con-date"> <span class="icon-author">${asl.memberLoginName}</span><span class="icon-rely">${asl.latestReplyName}</span> <span  style="top: 30px;margin-left:80px;"><fmt:formatDate value="${asl.latestReplyDate}" pattern="yyyy-MM-dd HH:mm"/></span> </div></c:if>
	            <c:if test="${asl.latestReplyName==null}"><div class="con-date"> <span class="icon-author">${asl.memberLoginName}</span></div></c:if>
	          </div>
          </c:forEach>
          <!-- 分页 -->
          <div class="Pagination" id="pagination" >
			  <div class="page_numbers"></div>
		  </div>
          <!--/ 分页 --> 
        </div>
        <div class="side">
          <c:if test="${member!=null}">
	          <div class="side-tx">
	            <c:if test="${member.pictureAddress!=null}"><img src="${dynamicDomain}${member.pictureAddress}" /></c:if>
	          	<c:if test="${member.pictureAddress==null}"><img src="<jdf:theme/>img/home/default_tx.jpg" /></c:if>
	            <h4>${member.loginName }</h4>
	            <p>等级：<span class="red"><jdf:dictionaryName value="${member.memberRank==null?1:member.memberRank }" dictionaryId="1112"/></span></p>
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
        <h3><span>发贴请遵守万家桥贴吧协议及规范</span>发表新帖</h3>
        <div class="box">
          <form id="postForm" action="${dynamicDomain}/member/postSave" method="post" >
	        <div class="form-group">
	            <label>主题：</label>
	            <select id="selectThemeId" name="themeId" style="width:300px;" class="form-control">
	              <option selected="selected" style="display:none;">请选择发帖主题</option>
	              <jdf:selectCollection items="themes" optionValue="objectId" optionText="name" />
	            </select>
	          </div>
	          <div class="form-group">
	            <label>标题：</label>
	            <select id="selectTypeId" name="type" class="form-control" >
	              <option selected="selected" style="display:none;">请选择标题类型</option>
	              <jdf:select dictionaryId="1105" />
	            </select>
	            <input id="nameId" name="name" style="width:400px;" maxlength="24" type="text" placeholder="请输入少于24个字的帖子标题" />
	          </div>
	          <div class="editor">
	           <textarea id="editor_id" name="content"></textarea>
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
	$(function(){
		var themeId='${themeId}';
		var type='${type}';
		if (themeId!=0) {
			document.getElementById("themeAll").className=" ";
		}
		if (type!=0) {
			document.getElementById("typeAll").className=" ";
		}
		
		if('${pageSearch.totalPage != 0}'){
	        $("#pagination").twbsPagination({
	              totalPages: ${pageSearch.totalPage},
	              visiblePages:5,
              startPage: ${pageSearch.currentPage},
	              onPageClick: function (event, page) {
	                $('#page-content').text('Page ' + page);
	                window.location.href = "${dynamicDomain}/home/post?themeId=${themeId}&type=${type}&searchText=${searchText}&ec_p="+page;
	           }
	        });
		}
	})

	function doClick(type) {
		var themeId='${themeId}';
		if (themeId!=0) {
			window.location.href="${dynamicDomain}/home/post?themeId=${themeId}&type="+type;
		} else {
			window.location.href="${dynamicDomain}/home/post?type="+type;
		}
	}
	var editor;
    KindEditor.ready(function(K) {
          editor = K.create('#editor_id',{uploadJson : '${dynamicDomain}/connector/kindUpload?ajax=1',
        	      afterBlur: function(){this.sync();},
        		  width:658,
        		  height:400,
        		  minWidth:658,
        		  minHeight:400,
        		  resizeType:0,
        		  items:['link','image','media','emoticons','baidumap']
          });
    });
    
    function validataValue(){
    		if(${empty sessionScope.m_loginName }){
    			var r=confirm("尚未登录,立刻登录吗?");
    			if (r==true){
    				window.location.href='${dynamicDomain}/home/login';
    			    }else{
    			      }
    			return;
    		}
    	var sType=$("#selectTypeId").val();
    	var sTheme=$("#selectThemeId").val();
    	var nameId=$("#nameId").val();
    	var editor_id=$("#editor_id").val();//去除空格
    	
    	if(isNaN(sTheme)){
    		alert("主题不能为空");
			return;
    	}
    	if(isNaN(sType)){
    		alert("类型不能为空");
			return;
		}
    	if(isAllBlank(nameId)){
    		alert("标题不能为空");
			return;
    	}
    	if(isAllBlank(editor_id)){
    		alert("贴吧内容不能为空");
			return;
    	}
    	
    	//敏感词过滤
    	var title=$("#nameId").val();
    	var content=$("#editor_id").val();
		$.ajax({
			type:'post',
			url:'${dynamicDomain}/member/sensitiveWord',
			dataType:'json',
			data:"title="+ title+"&content="+content,
           success:function(msg){
	        	if(msg.isHaveSensitiveword){
	        		alert("请不要发表敏感言论!");
	        	}else {
	        		$("#postForm").submit();
	        		alert("发帖成功");
	        	}
		     }
       });
    }
    
    function isAllBlank(str){
    	
    	str=str.replace(/&nbsp;|\s/g,"");
    	if ( str.length == 0 ){
    		return true;
    	}
    	    return false;
    }
    
</script>
</body>
</html>
