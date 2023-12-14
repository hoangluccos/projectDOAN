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
					<h2>Sửa thông tin sản phẩm</h2>
					<h3 style="color: red">${message}</h3>
					<br> <br>
					<form:form modelAttribute="sanPham"
						action="${pageContext.request.contextPath}/update-product"
						method="POST">
						<div class="form-row">
							<label for="maSanPham">Mã sản phẩm:</label>
							<div>
								<form:input path="maSanPham" name="maSanPham" readonly="true" />
							</div>
						</div>
						<div class="form-row">
							<label for="maLoaiSanPham">Mã loại sản phẩm:</label>
							<div>
								<form:select path="maLoaiSanPham" name="maLoaiSanPham">
									<c:forEach items="${loaisanpham}" var="loaiSanPham">
										<form:option value="${loaiSanPham.maLoaiSanPham}"
											label="${loaiSanPham.maLoaiSanPham}" />
									</c:forEach>
								</form:select>
							</div>
						</div>
						<div>
							<div class="form-row">
								<label for="tenSanPham">Tên sản phẩm:</label>
								<div>
									<form:input path="tenSanPham" name="tenSanPham" />
								</div>
							</div>
						</div>
						<div class="form-row">
							<label for="giaTien">Giá tiền:</label>
							<div>
								<form:input path="giaTien" name="giaTien" />
							</div>
						</div>
						<br>
						<button type="submit" class="defaultBtn">Cập Nhật</button>
						<a href="<c:url value="/admin/san-pham"/>" class="defaultBtn">Quay
							lại</a>
					</form:form>

				</div>
			</div>
		</div>

	</div>
	</div>
</body>
</html>