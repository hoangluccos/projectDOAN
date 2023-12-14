<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhập Hàng</title>
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
					<h1>Nhập Hàng</h1>
					<br> <br>
					<form action="${pageContext.request.contextPath}/xuly-nhap-hang"
						method="POST">
						<input type="hidden" name="maNhanVien" value="${maNhanVien}">
						<div class="form-row">
							<label for="sanPham">Chọn Sản Phẩm:</label>
							<div>
								<select id="sanPham" name="sanPham">
									<c:forEach var="sanPhamItem" items="${danhSachSanPham}">
										<option value="${sanPhamItem.maSanPham}">${sanPhamItem.tenSanPham}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-row">
							<label for="soLuong">Số Lượng:</label>
							<div>
								<input type="number" id="soLuong" name="soLuong" min="1"
									required>
							</div>
						</div>
						<br>
						<button type="submit" class="defaultBtn">Nhập hàng</button>
						<a href="<c:url value="/user/"/>" class="defaultBtn">Quay
							lại</a>
					</form>
				</div>
			</div>
		</div>

	</div>
	</div>
</body>
</html>