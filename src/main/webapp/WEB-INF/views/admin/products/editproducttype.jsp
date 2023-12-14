<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sửa loại sản phẩm</title>
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
			<div class="span7">
				<div class="well">
					<h2>Sửa thông tin loại sản phẩm</h2>
					<h3 style="color: red">${message}</h3>
					<br> <br>
					<form:form modelAttribute="loaiSanPham"
						action="${pageContext.request.contextPath}/update-producttype"
						method="POST">
						<div class="form-row">
							<label for="maLoaiSanPham">Mã loại sản phẩm:</label>
							<div>
								<form:input path="maLoaiSanPham" name="maLoaiSanPham"
									readonly="true" />
							</div>
						</div>
						<div>
							<div class="form-row">
								<label for="tenLoaiSanPham">Tên loại sản phẩm:</label>
								<div>
									<form:input path="tenLoaiSanPham" name="tenLoaiSanPham" />
								</div>

							</div>
						</div>
						<br>
						<button type="submit" class="defaultBtn">Cập nhật</button>
						<a href="<c:url value="/admin/loai-san-pham"/>" class="defaultBtn">Quay
							lại</a>
					</form:form>

				</div>
			</div>
		</div>

	</div>
	</div>
</body>
</html>