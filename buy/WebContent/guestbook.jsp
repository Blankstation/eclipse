<%@page import="com.cn.easybuy.util.Pages"%>
<%@page import="com.cn.easybuy.entity.Message"%>
<%@page import="com.cn.easybuy.dao.impl.MessageDaoImpl"%>
<%@page import="com.cn.easybuy.dao.MessageDao"%>
<%@page import="java.util.List"%>


<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>易买网 - 首页</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="scripts/function.js"></script>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="images/logo.gif" /></div>
	<div class="help"><a href="shopping.html" class="shopping">购物车X件</a><a href="login.html">登录</a><a href="register.html">注册</a><a href="guestbook.html">留言</a><a href="manage/index.jsp">后台管理</a></div>
	<div class="navbar">
		<ul class="clearfix">
			<li class="current"><a href="#">首页</a></li>
			<li><a href="#">图书</a></li>
			<li><a href="#">百货</a></li>
			<li><a href="#">品牌</a></li>
			<li><a href="#">促销</a></li>
		</ul>
	</div>
</div>
<div id="childNav">
	<div class="wrap">
		<ul class="clearfix">
			<li class="first"><a href="#">音乐</a></li>
			<li><a href="#">影视</a></li>
			<li><a href="#">少儿</a></li>
			<li><a href="#">动漫</a></li>
			<li><a href="#">小说</a></li>
			<li><a href="#">外语</a></li>
			<li><a href="#">数码相机</a></li>
			<li><a href="#">笔记本</a></li>
			<li><a href="#">羽绒服</a></li>
			<li><a href="#">秋冬靴</a></li>
			<li><a href="#">运动鞋</a></li>
			<li><a href="#">美容护肤</a></li>
			<li><a href="#">家纺用品</a></li>
			<li><a href="#">婴幼奶粉</a></li>
			<li><a href="#">饰品</a></li>
			<li class="last"><a href="#">Investor Relations</a></li>
		</ul>
	</div>
</div>
<div id="position" class="wrap">
	您现在的位置：<a href="index.jsp">易买网</a> &gt; 在线留言
</div>
<div id="main" class="wrap">
	<div class="lefter">
		<div class="box">
			<h2>商品分类</h2>
			<dl>
				<dt>图书音像</dt>
				<dd><a href="product-list.html">图书</a></dd>
				<dd><a href="product-list.html">音乐</a></dd>
				<dt>百货</dt>
				<dd><a href="product-list.html">运动健康</a></dd>
				<dd><a href="product-list.html">服装</a></dd>
				<dd><a href="product-list.html">家居</a></dd>
				<dd><a href="product-list.html">美妆</a></dd>
				<dd><a href="product-list.html">母婴</a></dd>
				<dd><a href="product-list.html">食品</a></dd>
				<dd><a href="product-list.html">手机数码</a></dd>
				<dd><a href="product-list.html">家具首饰</a></dd>
				<dd><a href="product-list.html">手表饰品</a></dd>
				<dd><a href="product-list.html">鞋包</a></dd>
				<dd><a href="product-list.html">家电</a></dd>
				<dd><a href="product-list.html">电脑办公</a></dd>
				<dd><a href="product-list.html">玩具文具</a></dd>
				<dd><a href="product-list.html">汽车用品</a></dd>
			</dl>
		</div>
	</div>
	<div class="main">
		<div class="guestbook">
			<h2>全部留言</h2>
			<ul>
			<%
					Pages pages=(Pages)session.getAttribute("pages2");
					if(pages==null){
					response.sendRedirect("page2.jsp");
					return;
					}else{
					int pageIndex = pages.getPageIndex();
					int pageTotal = pages.getPageTotal();
					MessageDao messageDao=new MessageDaoImpl();
					List<Message> message=messageDao.getList(pageIndex,pages.getPageSize());
					for(Message m:message){

					%>
				<li>
					<dl>
						<dt><%=m.getEcContent() %></dt>
						<dd class="author">网友：<%=m.getEcNickName() %> <span class="timer"><%=m.getEcCreateTime() %></span></dd>
						
						<dd class="author">掌柜回复：<%=m.getEcReply() %><span class="timer"><%=m.getEcreplyTime() %></span></dd>

						
					</dl>
				</li>
				<%} } %>
			</ul>
				
			<div class="clear"></div>
			<div id="page">

[当前：<%=pages.getPageIndex() %>页/共<%=pages.getPageTotal() %> 页]
<%
if(pages.getPageIndex()>1){
%>

<a href="page2.jsp?pageIndex=1">首页</a>
<a href="page2.jsp?pageIndex=<%=pages.getPageIndex()-1 %>">上一页</a>
<%
}if(pages.getPageIndex()<pages.getPageTotal()){ %>
<a href="page2.jsp?pageIndex=<%=pages.getPageIndex()+1 %>">下一页</a>
<a href="page2.jsp?pageIndex=<%=pages.getPageTotal() %>">尾页</a>
<%} %>
</div>
			<div id="reply-box">
				<form id="guestBook" action="MessageServlet">
					<table>
					
						<tr>
							<%
								String uname = (String)session.getAttribute("uname");
							%>
							<td class="field">昵称：</td>
							<td><input class="text" type="text" name="guestName" readonly value="<%=session.getAttribute("uname")%>"/></td>
						</tr>						
						<tr>
							<td class="field">留言内容：</td>
							<td><textarea name="guestContent"></textarea><span></span></td>
						</tr>
						<tr>
							<td></td>
							<td><label class="ui-blue"><input type="submit" name="submit" value="提交留言" /></label></td>
							
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2013 北大 All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
