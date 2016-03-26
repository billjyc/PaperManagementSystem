<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String actorLabel =(String)request.getSession().getAttribute("actorLabel");
String actorName = (String)request.getSession().getAttribute("actorName");
 %>
<div class="header_container clearfix">
  <!-- begin head section -->
  <div class="topdiv">
    <div class="top_left">
      <img alt="首页" src="<%=request.getContextPath()%>/image/top.jpg">
    </div>
    <div class="top_right">
      <div class="content">
        <div class="link_nav">
          <b class="link_corner"></b>
          <ul>
            <li><a href="http://218.94.159.102/tss/en/home/courselist.html" target="_blank">TSS</a><b class="split"></b></li>
            <li><a href="https://218.94.159.102/GlobalLogin/mymail.jsp" target="_blank">MAIL</a><b class="split"></b></li>
            <li><a href="http://218.94.159.102/css/" target="_blank">CSS</a><b class="split"></b></li>
            <li><a href="http://software.nju.edu.cn/" target="_blank">SWI</a><b class="split"></b></li>
            <li><a href="http://www.nju.edu.cn/" target="_blank">NJU</a><b class="split"></b></li>
            <li><a href="http://218.94.159.102/tss/en/home/error/techCenter.html;jsessionid=15155BE270115412F8539AD81DA5E95F" target="_blank">Bug Report</a></li>
          </ul>
        </div>
        <div class="search_div"></div>
      </div>
    </div>
  </div>
  <!-- begin top navigation -->
  <div class="topnav">
    <div class="bar wide"></div>
    <div class="content">
      <div class="menu2">
        <ul>
          <li><a href="<%=request.getContextPath()%>/index.jsp">首页</a><b class="split"></b></li>
          <%if(actorLabel=="teacher"){ %>
          <li><a href="<%=request.getContextPath()%>/tutor/index.jsp">导师工作</a><b class="split"></b></li>
          <li><a href="<%=request.getContextPath()%>/tutor/review_index.jsp">评审工作</a><b class="split"></b></li>
          <li><a href="<%=request.getContextPath()%>/tutor/defense_index.jsp">答辩工作</a><b class="split"></b></li>
          <li><a href="<%=request.getContextPath()%>/tutor/grade_index.jsp">成绩管理</a><b class="split"></b></li>
          <li><a href="<%=request.getContextPath()%>/tutor/fee_index.jsp">费用查看</a><b class="split"></b></li>
          <%} else if(actorLabel=="dean"){ %>
          <li><a href="<%=request.getContextPath()%>/dean/index.jsp">论文工作</a><b class="split"></b></li>
          <li><a href="<%=request.getContextPath()%>/dean/notice.jsp">添加公告</a><b class="split"></b></li>
          <li><a href="<%=request.getContextPath()%>/dean/grade_index.jsp">成绩管理</a><b class="split"></b></li>
          <li><a href="<%=request.getContextPath()%>/dean/enrollment_index.jsp">学籍管理</a><b class="split"></b></li>
          <li><a href="<%=request.getContextPath()%>/dean/fee_index.jsp">费用管理</a><b class="split"></b></li>
          <%} else if(actorLabel=="student"){ %>
          <li><a href="<%=request.getContextPath()%>/student/student_main.jsp">论文信息</a><b class="split"></b></li>
          <li><a href="<%=request.getContextPath()%>/student/grade_index.jsp">课程信息</a><b class="split"></b></li>
          <%}else if(actorLabel=="director"){ %>
            <li><a href="<%=request.getContextPath()%>/director/enrollment_index.jsp">教学点管理</a><b class="split"></b></li>
          <%}  %>
          <%if(actorLabel!=null){ %>
          <li><a href="<%=request.getContextPath()%>/logout.do">登出</a></li>
          <%}else{ %>
          <li><a href="<%=request.getContextPath()%>/mylogin.jsp">登录</a></li>
          <%} %>
        </ul>
      </div>
      <div class="position">
        <div class="position_content">
          <span>欢迎您，</span>
          <%if(actorLabel!=null){ %>
          <span><%=actorName %>！</span>
          <%}else{ %>
          <span>游客！</span>
          <%} %>
        </div>
      </div>
    </div>
    <div class="bar"></div>
  </div>
  
</div>