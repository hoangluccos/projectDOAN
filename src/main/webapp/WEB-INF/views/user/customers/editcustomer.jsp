<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sửa sản phẩm</title>
<style>
.form-row {
	display: flex;
	align-items: center;
}

.form-row label {
	flex-basis: 200px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="row">
		<div id="sidebar"></div>
		<div class="span12">
			<div class="span2">&nbsp;</div>
			<div class="span6">
				<div class="well">
					<h2>Sửa thông tin khách hàng</h2>
					<h3 style="color: red">${message}</h3>
					<br> <br>
					<form:form modelAttribute="khachHang"
						action="${pageContext.request.contextPath}/update-customer"
						method="POST">
						<div class="form-row">
							<label for="maKhachHang">Mã sản phẩm:</label>
							<div>
								<form:input path="maKhachHang" name="maKhachHang" readonly="true" />
							</div>
						</div>
						<div>
							<div class="form-row">
								<label for="tenKhachHang">Tên sản phẩm:</label>
								<div>
									<form:input path="tenKhachHang" name="tenKhachHang" />
								</div>
							</div>
						</div>
						<div class="form-row">
							<label for="sdt">Số điện thoại:</label>
							<div>
								<form:input path="sdt" name="sdt" />
							</div>
						</div>
						<br>
						<button type="submit" class="defaultBtn">Cập Nhật</button>
						<a href="<c:url value="/user/khach-hang"/>" class="defaultBtn">Quay
							lại</a>
					</form:form>

				</div>
			</div>
		</div>

	</div>
	</div>
</body>
</html>