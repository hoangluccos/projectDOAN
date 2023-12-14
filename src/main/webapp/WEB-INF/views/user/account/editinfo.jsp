<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp"%>
<head>
<title>Thông tin</title>
<style>
.control-group {
	display: flex;
	align-items: center;
}

.control-label {
	width: 150px;
	text-align: right;
	margin-right: 10px;
}

#hide-div {
	display: none;
}
</style>
</head>
<body>
	<div class="row">
		<div class="row">
			<div id="sidebar"></div>
			<div class="span10">
				<div class="span3">&nbsp;</div>
				<div class="span6">
					<div class="well">
						<h5>Chỉnh sửa thông tin cá nhân</h5>
						<br>
						<form:form modelAttribute="taikhoan"
							action="${pageContext.request.contextPath}/update-info"
							method="POST">
							<div class="control-group">
								<label class="control-label" for="id">Mã nhân viên: </label>
								<div class="controls">
									<form:input path="maNhanVien" name="maNhanVien" readonly="true" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="username">Tên đăng
									nhập: </label>
								<div class="controls">
									<form:input path="tenDangNhap" name="tenDangNhap" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="password">Mật khẩu: </label>
								<div class="controls">
									<form:input path="matKhau" name="matKhau" />
								</div>
							</div>

							<button type="submit" class="defaultBtn">Cập Nhật</button>
							<a href="<c:url value="/thong-tin"/>" class="defaultBtn">Quay
								lại</a>
						</form:form>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>