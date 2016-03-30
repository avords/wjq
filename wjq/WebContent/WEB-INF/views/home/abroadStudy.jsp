<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>出国留学</title>
<jdf:themeFile file="css/home_list.css" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<jdf:themeFile file="kindeditor/kindeditor.js" />
<jdf:themeFile file="kindeditor/lang/zh_CN.js" />
<jdf:themeFile file="bootstrap.min.js" />
</head>

<body>
<div class="container">
  <dl class="study-flag clearfix">
    <dt><i><img src="<jdf:theme/>img/study_icon.png" /></i>出国留学</dt>
    <dd>
	    <c:forEach items="${serviceDirections}" var="asl" >
	    	<c:if test="${asl.objectId==serviceDirectionId}"><a href="${dynamicDomain}/home/abroadStudy?serviceDirectionId=${asl.objectId}" style="background-color: #FFFFFF;color:#FF7459;"><img src="${dynamicDomain}${asl.icon }" style="width: 40px;height: 26px;"/><br>${asl.serviceName }</a></c:if>
	    	<c:if test="${asl.objectId!=serviceDirectionId}"><a href="${dynamicDomain}/home/abroadStudy?serviceDirectionId=${asl.objectId}"><img src="${dynamicDomain}${asl.icon }" style="width: 40px;height: 26px;"/><br>${asl.serviceName }</a></c:if>
	    </c:forEach>
    </dd>
  </dl>
  <div class="study-focus clearfix">
    <div class="focus-pic">
      <div><img src="<jdf:theme/>img/study_focus_img.jpg" /></div>
      <ul>
        <li><a href="#"><i class="icon1"></i>留学评估</a></li>
        <li><a href="#"><i class="icon2"></i>在线咨询</a></li>
        <li><a href="#"><i class="icon3"></i>答疑中心</a></li>
        <li><a href="#"><i class="icon4"></i>免费电话</a></li>
      </ul>
    </div>
    <div class="focus-news">
      <dl>
        <dt><a href="page.html">顶级私立中学申请流程详解</a></dt>
        <dd>碧海蓝天的澳大利亚，幅员辽阔，资源丰富。自今年6月与中国签署自贸协议, 该协议将促进中澳两国的贸易，制造... <span><a class="red" href="#">[查看全文]</a></span></dd>
      </dl>
      <ul>
        <li><a href="page.html" target="_blank">美国TOP100名校无语言录取攻略</a></li>
        <li><a href="page.html" target="_blank">DU-BOSTON美国顶尖私立高中校长团面试讲会</a></li>
        <li><a href="page.html" target="_blank">名私立中学校长团亲临教，体验原汁原味美国高中氛围</a></li>
        <li><a href="page.html" target="_blank">亚洲（韩国，日本，新加坡，马来西亚）高校面试招生会</a></li>
        <li><a href="page.html" target="_blank">美国TOP100名校无语言录取攻略</a></li>
      </ul>
    </div>
    <div class="focus-hot">
      <!-- 热门推荐 -->
        <div class="rank" style="margin-bottom:0;">
          <div class="title">热门留学资讯</div>
          <div class="cont">
          	  <c:forEach items="${titles}" var="asl" varStatus="status">
           		<a href="${dynamicDomain }/home/index/content/${asl.objectId}"><i>${ status.index + 1}</i>${asl.title }</a>  
           	  </c:forEach>
          </div>
        </div>
        <!--/热门推荐--> 
    </div>
  </div>
  
  <div class="list-inner clearfix">
    <div class="listCont">
      <div class="sort"><span>留学机构推荐<i class="triangle"></i></span></div>
      
      <c:forEach items="${pageSearch.list }" var="asl" >
	      <div class="study-list"> <a href="${dynamicDomain}/home/abroadStudyDetail?cooperativeEnterpriseId=${asl.objectId}"><img src="${dynamicDomain}${asl.pictureAddress }" style="width:100px;height:80px; "/></a>
	        <dl>
	          <dt><a href="${dynamicDomain}/home/abroadStudyDetail?cooperativeEnterpriseId=${asl.objectId}">${asl.company}</a></dt>
	          <dd>${asl.instruction}</dd>
	          <dd><span>公司地址：</span>${asl.address}</dd>
	        </dl>
	        
	        <div class="org-links">
		        <a class="btn btn-orange" href="${dynamicDomain}/home/abroadStudyDetail?cooperativeEnterpriseId=${asl.objectId}">查看详情</a>
	        </div>
	      </div>
      </c:forEach>
      <!-- 分页 -->
          <div class="Pagination" id="pagination" >
			  <div class="page_numbers"></div>
		  </div>
      <!--/ 分页 --> 
      
    </div>
    <div class="listSide"> 
          
      <!-- 二维码 -->
      <div class="telQR">
        <p class="tel"><img src="<jdf:theme/>img/icon_tel.png" /></p>
        <p class="QR"><img src="<jdf:theme/>img/QR.png" /><span class="tit">万家桥官方微信</span> <span>一步上桥　万事搞定<br>
          出国桥梁　游子家园</span></p>
      </div>
      <!--/ 二维码 --> 
      
      <!-- 院校推荐
      <div class="university">
        <div class="title2"><span>+更多</span>院校推荐</div>
        <ul class="tc-bd">
          <li><a href="#"><img src="<jdf:theme/>img/list_tc_pic1.jpg" /></a>
            <dl>
              <dt><a href="#">澳大利亚纽卡斯尔大学</a></dt>
              <dd>The University of Newcastle, Australia</dd>
            </dl>
          </li>
          <li><a href="#"><img src="<jdf:theme/>img/list_tc_pic2.jpg" /></a>
            <dl>
              <dt><a href="#">阿德莱德商学院</a></dt>
              <dd>Adelaide Institute of Business and Technology</dd>
            </dl>
          </li>
          <li><a href="#"><img src="<jdf:theme/>img/list_tc_pic3.jpg" /></a>
            <dl>
              <dt><a href="#">墨尔本大学 </a></dt>
              <dd>The University of Melbourne</dd>
            </dl>
          </li>
          <li><a href="#"><img src="<jdf:theme/>img/list_tc_pic2.jpg" /></a>
            <dl>
              <dt><a href="#">澳大利亚纽卡斯尔大学</a></dt>
              <dd>The University of Newcastle, Australia</dd>
            </dl>
          </li>
          <li><a href="#"><img src="<jdf:theme/>img/list_tc_pic3.jpg" /></a>
            <dl>
              <dt><a href="#">澳大利亚纽卡斯尔大学</a></dt>
              <dd>The University of Newcastle, Australia</dd>
            </dl>
          </li>
        </ul>
      </div>
      院校推荐--> 
      
      <!-- 留学指导 -->
      <div class="rank2">
        <div class="title"><span>+更多</span>留学指导</div>
        <div class="cont"> <a href="#">美国签证行政审理处理方法</a> <a href="#">美国面签注意事项及常问问题</a> <a href="#">必备雅思口语短语大总结</a> <a href="#">美国留学体检要求及流程</a> <a href="#">申请美国奖学金小窍门</a> <a href="#">雅思口语如何有效的自我复习</a> <a href="#">必备雅思口语短语大总结</a> <a href="#">大学生什么时间考雅思比较</a></div>
      </div>
      <!--/留学指导--> 
      
      <!-- 聊聊吧 -->
      <div class="talk">
        <div class="title2"><a class="red" href="${dynamicDomain }/home/post"><span>+进入交流</span></a>无事聊聊</div>
        <div class="cont">
          <ul>
            <c:forEach items="${posts}" var="asl" >
	            <li>
		              <p><a href="${dynamicDomain}/home/postComment?postId=${asl.objectId}">${asl.name }</a> </p>
		              <span><i class="red">${asl.latestReplyName }</i> 发表于：<fmt:formatDate value="${asl.latestReplyDate}" pattern="yyyy-MM-dd HH:mm"/></span> 
	            </li>
            </c:forEach> 
          </ul>
        </div>
      </div>
      <!--/聊聊吧--> 
      
    </div>
  </div>
</div>
<script type="text/javascript">
	$(function(){
		if('${pageSearch.totalPage != 0}'){
	        $("#pagination").twbsPagination({
	              totalPages: ${pageSearch.totalPage},
	              visiblePages:5,
              	  startPage: ${pageSearch.currentPage},
	              onPageClick: function (event, page) {
	              $('#page-content').text('Page ' + page);
	                window.location.href = "${dynamicDomain}/home/abroadStudy?serviceDirectionId=${serviceDirectionId}&ec_p="+page;
	           }
	        });
		}
	})
</script>
</body>
</html>
