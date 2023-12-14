<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sửa nhân viên</title>
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
					<h2>Sửa thông tin nhân viên</h2>
					<h3 style="color: red">${message}</h3>
					<br> <br>

					<form:form modelAttribute="nhanVien"
						action="${pageContext.request.contextPath}/update-employee"
						method="POST">
						<div class="form-row">
							<label for="maNhanVien">Mã nhân viên:</label>
							<div>
								<form:input path="maNhanVien" name="maNhanVien" readonly="true" />
							</div>
						</div>
						<div class="form-row">
							<label for="tenNhanVien">Tên nhân viên:</label>
							<div>
								<form:input path="tenNhanVien" name="tenNhanVien" />
							</div>
						</div>
						<div class="form-row">
							<label for="gioiTinh">Giới tính:</label>
							<div>
								<form:select path="gioiTinh" name="gioiTinh">
									<form:option value="1">Nam</form:option>
									<form:option value="0">Nữ</form:option>
								</form:select>
							</div>
						</div>
						<div class="form-row">
							<label for="sdt">Số điện thoại:</label>
							<div>
								<form:input path="sdt" name="sdt" />
							</div>
						</div>
						<div class="form-row">
							<label for="chucVu">Chức vụ:</label>
							<div>
								<form:input path="chucVu" name="chucVu" readonly="true" />
							</div>
						</div>
						<br>
						<button type="submit" class="defaultBtn">Cập nhật</button>
						<a href="<c:url value="/admin/nhan-vien"/>" class="defaultBtn">Quay
							lại</a>
					</form:form>

				</div>
			</div>
		</div>

	</div>
	</div>
</body>
</html>