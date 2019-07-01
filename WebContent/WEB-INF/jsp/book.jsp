<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="dxl" uri="http://dxl.com/common/"%>
<%
  String path = request.getContextPath();
			String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书管理系统</title>
<!-- 引入css样式文件 -->
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
<!-- MetisMenu CSS -->
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
<!-- DataTables CSS -->
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
<!-- Custom CSS -->
<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
<!-- Custom Fonts -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
	type="text/css" />
<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>
</head>
<body>
	<div id="wrapper">
		<!-- 导航栏部分 -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<a class="navbar-brand" href="<%=basePath%>book/list.action">图书管理系统
					v1.0</a>
			</div>
			<!-- 导航栏右侧图标部分 -->
			<ul class="nav navbar-top-links navbar-right">
				<!-- 用户信息和一些相关操作 start -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i>
								用户：${USER_SESSION.user_name} </a></li>
						<li><a href="javascript:wait();"><i class="fa fa-gear fa-fw"></i>修改密码</a></li>
						<li class="divider"></li>
						<li><a
							href="${pageContext.request.contextPath }/logout.action"> <i
								class="fa fa-sign-out fa-fw"></i>退出登录
						</a></li>
					</ul></li>
				<!-- 用户信息和一些操作 结束 -->
			</ul>

			<!-- 左侧显示列表部分 start-->
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li class="sidebar-search">
							<div class="input-group bookom-search-form">
								<input type="text" class="form-control" placeholder="查询内容...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button" onclick="wait()">
										<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
									</button>
								</span>
							</div>
						</li>
						<li><a
							href="${pageContext.request.contextPath }/book/list.action"
							class="active"> <i class="fa fa-edit fa-fw"></i> 图书管理
						</a></li>
						<li><a href="javascript:wait();"> <i class="fa fa-dashboard fa-fw"></i>设置管理助手
						</a></li>
					</ul>
				</div>
			</div>
			<!-- 左侧显示列表部分 end-->
		</nav>

		<!-- 书籍列表查询部分  start-->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">图书管理</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline" method="get"
						action="${pageContext.request.contextPath }/book/list.action">
						<div class="form-group">
							<label for="bookName">书籍名称</label> <input type="text"
								class="form-control" id="bookName" value="${bookName }"
								name="bookName" />
						</div>
						<%-- <div class="form-group">
						<label for="booklocation">图书位置</label> 
						<select	class="form-control" id="booklocation" name="booklocation">
							<option value="">--请选择--</option>
							<c:forEach items="${}" var="item">
								<option value="${}"
								       <c:if test="${ == }">selected</c:if>>
								    ${ }
								</option>
							</c:forEach>
						</select>
					</div> --%>
						<button type="submit" class="btn btn-primary">查询</button>
					</form>
				</div>
			</div>
			<a href="#" class="btn btn-primary" data-toggle="modal"
				data-target="#newBookDialog" onclick="clearBook()">添加书籍</a>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">书籍信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>书籍编号</th>
									<th>书名</th>
									<th>作者</th>
									<th>出版社</th>
									<th>出版时间</th>
									<th>价格</th>
									<th>数量</th>
									<th>位置</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row">
									<tr>
										<td>${row.book_id}</td>
										<td>${row.book_name}</td>
										<td>${row.book_author}</td>
										<td>${row.book_press}</td>
										<td>${row.book_presstime}</td>
										<td>${row.book_price}</td>
										<td>${row.book_number}</td>
										<td>${row.book_location}</td>
										<td><a href="#" class="btn btn-primary btn-xs"
											data-toggle="modal" data-target="#bookEditDialog"
											onclick="editBook(${row.book_id})">修改</a> 
											<a href="#" class="btn btn-danger btn-xs" onclick="deleteBook(${row.book_id})">删除</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<dxl:page
								url="${pageContext.request.contextPath }/book/list.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- 书籍列表查询部分  end-->
	</div>
	<!-- 添加书籍模态框 -->
	<div class="modal fade" id="newBookDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加书籍</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_book_form">
						<div class="form-group">
							<label for="new_bookName" class="col-sm-2 control-label">
								书名 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_bookName"
									placeholder="书名" name="book_name" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_bookAuthor"
								style="float: left; padding: 7px 15px 0 56px;">作者</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_bookAuthor"
									placeholder="作者" name="book_author" value="kk" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_bookPress"
								style="float: left; padding: 7px 15px 0 42px;">出版社</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_bookPress"
									placeholder="出版社" name="book_press" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_bookPresstime"
								style="float: left; padding: 7px 15px 0 27px;">出版时间</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_bookPresstime"
									placeholder="出版时间" name="book_presstime" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_bookPrice" class="col-sm-2 control-label">价格</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_bookPrice"
									placeholder="价格" name="book_price" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_bookNumber" class="col-sm-2 control-label">数量</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="new_bookNumber"
									placeholder="数量" name="book_number" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_bookLocation" class="col-sm-2 control-label">位置</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_bookLocation"
									placeholder="位置" name="book_location" />
							</div>
						</div>
					</form> 
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createBook()">添加书籍</button> 
				</div>
			</div>
		</div>
	</div>
	<!-- 修改书籍信息模态框 -->
	<div class="modal fade" id="bookEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改书籍信息</h4>
				</div>
				<div class="modal-body">
					 <form class="form-horizontal" id="edit_book_form">
						<div class="form-group">
							<label for="edit_book_id" class="col-sm-2 control-label">书籍编号</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="edit_book_id"
									name="book_id" readonly="readonly" maxlength="10"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_book_name" class="col-sm-2 control-label">书名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_book_name"
									name="book_name" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_book_author"
								style="float: left; padding: 7px 15px 0 56px;">作者</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_book_author"
									name="book_author"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_book_press"
								style="float: left; padding: 7px 15px 0 42px;">出版社</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_book_press"
									name="book_press" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_book_presstime"
								style="float: left; padding: 7px 15px 0 27px;">出版时间</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_book_presstime"
									name="book_presstime" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_book_price" class="col-sm-2 control-label">价格</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_book_price"
									name="book_price" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_book_number" class="col-sm-2 control-label">数量</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="edit_book_number"
									name="book_number" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_book_location" class="col-sm-2 control-label">位置</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_book_location"
									name="book_location" />
							</div>
						</div>
					</form>  
					<%-- <form id="update_book" onload="init()">
						书籍编号：<input type="number" name="book_id"/><br>
						书名：<input type="text" name="book_name"/><br>
						作者：<input type="text" name="book_author"/><br>
						出版社：<input type="text" name="book_press"/><br>
						出版时间：<input type="text" name="book_presstime"/><br>
						价格：<input type="text" name="book_price"/><br>
						数量：<input type="number" name="book_number"/><br>
						位置：<input type="text" name="book_location" value="${updatedata.book_name}"/><br>
						<input id="sub" type="submit" value="提交" onclick="updateBook()" />
					</form>   --%>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" >关闭</button>
				    <button type="button" class="btn btn-primary"
						onclick="updateBook()">保存修改</button> 
				</div>
			</div>
		</div>
	</div>

<!-- 编写js代码 -->
<script type="text/javascript">
	function wait() {
	  alert("非常抱歉，该功能正在开发中");
	}
    //清空添加书籍窗口中的数据
	function clearBook() {
	    $("#new_bookName").val("");
	    $("#new_bookAuthor").val("")
	    $("#new_bookPress").val("")
	    $("#new_bookPresstime").val("")
	    $("#new_bookPrice").val("");
	    $("#new_bookNumber").val("");
	    $("#new_bookLocation").val(""); 
	}
	// 添加书籍
	function createBook() { 
	$.post("<%=basePath%>book/create.action", 
	    $("#new_book_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("图书创建成功！");
	            window.location.reload();
	        }else{
	            alert("图书创建失败！");
	            window.location.reload();
	        } 
	    });
	}
	// 通过id获取将要修改的书籍信息
	function editBook(id) {
    $.ajax({
        type:"post", 
        url:"<%=basePath%>book/getBookById.action",
        data:{"id":id},
        datatype: 'json',
        success:function(data) {
            $("#edit_book_id").val(data.book_id);
            $("#edit_book_name").val(data.book_name);
            $("#edit_book_author").val(data.book_author);
            $("#edit_book_press").val(data.book_press);
            $("#edit_book_presstime").val(data.book_presstime);
            $("#edit_book_price").val(data.book_price);
            $("#edit_book_number").val(data.book_number);
            $("#edit_book_location").val(data.book_location); 
            
        },
        error:function(data) {
          alert("后台返回书籍信息出现问题，请联系程序猿"); 
        }
    });
}
    // 执行修改书籍操作
	function updateBook() {
		$.post("<%=basePath%>book/updateBook.action",
		    $("#edit_book_form").serialize(),function(data){//$("#edit_book_form").serialize()
			if(data =="OK"){
				alert("书籍信息更新成功！");
				window.location.reload();
			}else{
				alert("书籍信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除书籍
	function deleteBook(id) {
	    if(confirm('确实要删除该图书吗?')) {
			$.post("<%=basePath%>book/delete.action",{"id":id},
				function(data){
	            	if(data =="OK"){
	                	alert("书籍删除成功！");
	                	window.location.reload();
	            	}else{
	                	alert("书籍删除失败！");
	                	window.location.reload();
	            	}
	       	 	});
	    }
	}
</script>
</body>
</html>