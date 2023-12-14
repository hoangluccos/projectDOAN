<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp"%>
<head>
    <title>Đăng nhập</title>
</head>
<body>
    <div class="well">
		<h5>Đăng nhập hệ thống</h5>
		<br>

		<div class="frmLogin">
			<form:form action="dang-nhap" method="POST" modelAttribute="user">
				<div class="control-group">
					<label class="control-label" for="inputEmail"
						style="font-weight: bold;">TÀI KHOẢN</label>
					<div class="controls">
						<form:input type="text" class="span3"
							style="border-radius : 50px;height : 30px;"
							placeholder=" Mời nhập tài khoản" path="tenDangNhap" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="inputPassword"
						style="font-weight: bold;">MẬT KHẨU </label>
					<div class="controls">
						<form:input type="password" class="span3"
							style="border-radius : 50px; height : 30px;"
							placeholder=" Mời nhập mật khẩu" path="matKhau" />
					</div>
				</div>
				<c:if test="${not empty statusLogin}">
					<h3 style="color: #F55E4F">${statusLogin}</h3>
				</c:if>
				<br />
				<div class="control-group">
					<div class="controls">
						<button type="submit" class="defaultBtn">Đăng nhập</button>
						<a href="<c:url value="/user/quen-mat-khau"/>" style="color: #F55E4F; border-style: solid;">Quên
							mật khẩu ?</a>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>