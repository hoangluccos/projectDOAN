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

.info-label {
	width: 150px;
	text-align: left;
	margin-left: 30px;
	color: #330066;
	font-weight: bold;
}

.control-label {
	width: 150px;
	text-align: right;
	margin-right: 10px;
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
						<h5>Thông tin cá nhân</h5>
						<br>
						<form action="dang-nhap">
							<div class="control-group">
								<label class="control-label" for="id">Mã nhân viên: </label> <label
									class="info-label" for="id">${taikhoan.maNhanVien }</label>
							</div>
							<div class="control-group">
								<label class="control-label" for="username">Tên đăng
									nhập: </label> <label class="info-label" for="username">${taikhoan.tenDangNhap }</label>
							</div>
							<div class="control-group">
								<label class="control-label" for="password">Mật khẩu: </label> <label
									class="info-label" for="password">${taikhoan.matKhau }</label>
							</div>
							<div class="control-group">
								<label class="control-label" for="name">Tên nhân viên: </label>
								<label class="info-label" for="name">${thongtin.tenNhanVien }</label>
							</div>
							<div class="control-group">
								<label class="control-label" for="name">Giới tính: </label>
								<c:if test="${thongtin.gioiTinh == 1 }">
									<label class="info-label" for="name">Nam</label>
								</c:if>
								<c:if test="${thongtin.gioiTinh == 0 }">
									<label class="info-label" for="name">Nữ</label>
								</c:if>
							</div>
							<div class="control-group">
								<label class="control-label" for="sdt">Số điện thoại: </label> <label
									class="info-label" for="sdt">${thongtin.sdt }</label>
							</div>
							<div class="control-group">
								<label class="control-label" for="role">Chức vụ: </label> <label
									class="info-label" for="role">${thongtin.chucVu }</label>
							</div>

							<a href="<c:url value='/editInfo/${taikhoan.maNhanVien}'/>"
								class="defaultBtn">Chỉnh sửa </a>
							<c:if test="${thongtin.chucVu == 'Staff' }">
								<a href="<c:url value="/user/"/>" class="defaultBtn">Quay
									lại</a>
							</c:if>
							<c:if test="${thongtin.chucVu == 'Admin' }">
								<a href="<c:url value="/admin/"/>" class="defaultBtn">Quay
									lại</a>
							</c:if>

						</form>

					</div>
				</div>
			</div>

		</div>
	</div>
</body>