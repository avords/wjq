<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>机构介绍</title>
<jdf:themeFile file="css/home_list.css" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
</head>

<body>
<div class="container">
  <div class="container">
  <div class="list-inner clearfix">
    <div class="pageCont">
      <div class="crumb">当前位置： <a href="index">首页</a> > <a href="abroadStudy">出国留学</a> > 机构介绍</div>
      <div class="angency-head clearfix">
        <div class="pic"><img src="${dynamicDomain}${enterprise.pictureAddress }" style="width: 280px;height: 210px;"/></div>
        <div class="describe">
            <h1>${enterprise.company }</h1>
          <dl>
            <dd><span>业内排名：</span>${enterprise.rank }</dd>
            <dd><span>公司地址：</span>${enterprise.address }</dd>
            <dd><span>手机号码：</span>${enterprise.cellPhone } </dd>
          </dl>
          <div class="button"><a class="btn btn-blue large" href="#">咨询客服</a><a class="btn btn-orange large" href="#">委托万家桥</a></div>
        </div>
      </div>
      
      <div class="angency-box">
        <div class="angency-title">机构介绍</div>
        <div class="angency-cont">
            <dl>
            <dt>机构简介：</dt>
            <dd>${enterprise.instruction }</dd>
          </dl>
        </div>
      </div>
      
    </div>
    <div class="listSide"> 
    
    <div class="why">
        <h3>为什么选择委托万家桥？</h3>
    </div>
          
      <!-- 二维码 -->
      <div class="telQR">
        <p class="tel"><img src="<jdf:theme/>img/home/icon_tel.png" /></p>
        <p class="QR"><img src="<jdf:theme/>img/home/QR.png" /><span class="tit">万家桥官方微信</span> <span>一步上桥　万事搞定<br>
          出国桥梁　游子家园</span></p>
      </div>
      <!--/ 二维码 --> 
      
      <!-- 院校推荐
      <div class="university">
        <div class="title2"><span>+更多</span>院校推荐</div>
        <ul class="tc-bd">
          <li><a href="#"><img src="<jdf:theme/>img/home/list_tc_pic1.jpg" /></a>
            <dl>
              <dt><a href="#">澳大利亚纽卡斯尔大学</a></dt>
              <dd>The University of Newcastle, Australia</dd>
            </dl>
          </li>
          <li><a href="#"><img src="<jdf:theme/>img/home/list_tc_pic2.jpg" /></a>
            <dl>
              <dt><a href="#">阿德莱德商学院</a></dt>
              <dd>Adelaide Institute of Business and Technology</dd>
            </dl>
          </li>
          <li><a href="#"><img src="<jdf:theme/>img/home/list_tc_pic3.jpg" /></a>
            <dl>
              <dt><a href="#">墨尔本大学 </a></dt>
              <dd>The University of Melbourne</dd>
            </dl>
          </li>
          <li><a href="#"><img src="<jdf:theme/>img/home/list_tc_pic2.jpg" /></a>
            <dl>
              <dt><a href="#">澳大利亚纽卡斯尔大学</a></dt>
              <dd>The University of Newcastle, Australia</dd>
            </dl>
          </li>
          <li><a href="#"><img src="<jdf:theme/>img/home/list_tc_pic3.jpg" /></a>
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
</div>
</body>
</html>
