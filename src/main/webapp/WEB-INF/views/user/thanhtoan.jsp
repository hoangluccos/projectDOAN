<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<title>Thanh Toán</title>
<style>
/* Style cho modal */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 2083px;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
	padding-top: 50px;
}

.modal-content {
	background-color: #fefefe;
	margin: 5% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%; /* Điều chỉnh kích thước modal tại đây */
	max-width: 600px; /* Kích thước tối đa */
}

/* Style cho nút đóng */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.product-list {
	display: flex;
	flex-wrap: wrap;
	/* 	justify-content: space-between; */
	/* 	justify-content: center; */
}

.product-item {
	width: 20%;
	margin: 10px;
	box-sizing: border-box;
	position: relative;
	border: 1px solid #ddd; /* Thêm đường viền cho mỗi ô sản phẩm */
	padding: 10px;
	/* Thêm padding để tạo khoảng trắng xung quanh thông tin sản phẩm */
	background-color: #fff; /* Màu nền của ô sản phẩm */
}

.product-info {
	margin-bottom: 10px;
	/* Khoảng cách giữa thông tin sản phẩm và nút mua */
}

.edit-cart {
	position: absolute;
	bottom: 5px; /* Điều chỉnh khoảng cách từ nút đến phía dưới */
	left: 10px; /* Điều chỉnh khoảng cách từ nút đến phía trái */
}
</style>
</head>
<body>
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container">
				<a data-target=".nav-collapse" data-toggle="collapse"
					class="btn btn-navbar"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a>
				<div class="nav-collapse">
					<ul class="nav">
						<li class=""><c:if test="${not empty LoginInfo }">
								<a href="<c:url value="thanh-toan"/>">Thanh Toán</a>
							</c:if> <c:if test="${empty LoginInfo }">
								<a href="<c:url value="/user/dang-nhap"/>"><span
									class="icon-edit"></span>Thanh Toán</a>
							</c:if>
							<li class=""><c:if test="${not empty LoginInfo }">
									<a href="<c:url value="/user/xem-san-pham"/>">Sản phẩm</a>
								</c:if> <c:if test="${empty LoginInfo }">
									<a href="<c:url value="/user/dang-nhap"/>"><span
									class="icon-edit"></span>Sản phẩm</a>
								</c:if>
							
						<li class=""><c:if test="${not empty LoginInfo }">
									<a href="<c:url value="/user/khach-hang"/>">Khách hàng</a>
								</c:if> <c:if test="${empty LoginInfo }">
									<a href="<c:url value="/user/dang-nhap"/>"><span
									class="icon-edit"></span>Khách hàng</a>
								</c:if>
							
						<li class=""><c:if test="${not empty LoginInfo }">
									<a href="<c:url value="nhap-hang"/>">Nhập Hàng</a>
								</c:if> <c:if test="${empty LoginInfo }">
									<a href="<c:url value="/user/dang-nhap"/>"><span
									class="icon-edit"></span>Nhập Hàng</a>
								</c:if>
						
					</ul>
					</div>
				</div>
			</div>
		</div>
	<form action="xuat-hoa-don" method="POST">
								<!-- Các trường dữ liệu khác ở đây (nếu có) -->
		<button type="submit">
			Thanh Toán
			<c:choose>
				<c:when test="${soLuongDaMua != null}">
					<span id="soLuongDaMua", style = "color :red">   <i class="fas fa-shopping-cart"></i>
						${soLuongDaMua}</span>
				</c:when>
				<c:otherwise>
					<i class="fas fa-shopping-cart"></i>
				</c:otherwise>
			</c:choose>
		</button>
	</form>

	<!-- Danh sách sản phẩm -->
	<div class="product-list">
		<c:forEach var="item" items="${sanpham}">
			<div class="product-item">
				<button class="btn btn-mini btn-danger edit-cart" type="button"
											onclick="openModal('${item.maSanPham}', '${item.tenSanPham}', '${item.soLuongHienCo}', '${item.giaTien}')"
											${item.soLuongHienCo eq 0 ? 'disabled' : ''}>
					<span class="icon-edit"></span> Mua
				</button>
				<p>
					<strong>Tên sản phẩm:</strong> ${item.tenSanPham}
				</p>
				<p>
					<strong>Số Lượng Hiện Có:</strong> ${item.soLuongHienCo}
					${item.soLuongHienCo eq 0 ? '<span style="color: red;">Hết hàng</span>' : ''}
				</p>
				<p>
					<strong>Giá tiền:</strong>
					<fmt:formatNumber type="number" groupingUsed="true"
												value="${item.giaTien}" />
					₫
				</p>
				<hr class="soften" />
			</div>
		</c:forEach>

	</div>

	<!-- Modal form mua sản phẩm -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<h2>Mua Sản Phẩm</h2>
			<form id="muaForm" action="thanh-toan" method="POST"
										onsubmit="return submitForm()">
				<input type="hidden" id="maSanPhamInput" name="maSanPhamInput">
				<input type="hidden" id="giaTienInput" name="giaTienInput">
				<input type="hidden" id="soLuongHienCo" name="soLuongHienCo"
											value="0"> <label for="soLuongInput">Số Lượng:</label> <input
											type="number" id="soLuongInput" name="soLuongInput" min="1"
											value="1" onchange="updateSoLuong(this.value)">
				<button type="submit">Mua</button>
			</form>
		</div>
	</div>

	<script>
		function updateSoLuong(newValue) {
			var soLuongInput = document.getElementById('soLuongInput');
			soLuongInput.value = newValue;
			console.log("Số Lượng:", soLuongInput.value);
		}

		// Mở modal và truyền thông tin sản phẩm
		function openModal(maSanPham, tenSanPham, soLuong, giaTien) {
			if (soLuong === 0) {
				alert('Sản phẩm đã hết hàng.');
				return;
			}

			var soLuongInput = document.getElementById('soLuongInput');
			var maSanPhamInput = document.getElementById('maSanPhamInput');
			var giaTienInput = document.getElementById('giaTienInput');
			var soLuongHienCoInput = document.getElementById('soLuongHienCo');

			soLuongInput.value = 1;
			updateSoLuong(soLuongInput.value);

			maSanPhamInput.value = maSanPham;
			giaTienInput.value = giaTien;
			soLuongHienCoInput.value = soLuong;

			console.log("Ma San Pham:", maSanPhamInput.value);
			console.log("Gia Tien:", giaTienInput.value);

			document.getElementById('myModal').style.display = 'block';
		}

		// Đóng modal
		function closeModal() {
			document.getElementById('myModal').style.display = 'none';
		}

		function submitForm() {
			var soLuongInput = document.getElementById('soLuongInput');
			var soLuongHienCo = parseInt(document
					.getElementById('soLuongHienCo').value);

			if (parseInt(soLuongInput.value) > soLuongHienCo) {
				alert('Số lượng không hợp lệ. Vui lòng chọn số lượng nhỏ hơn hoặc bằng '
						+ soLuongHienCo);
				return false; // Ngăn chặn việc gửi biểu mẫu
			} else {
				closeModal();
				return true; // Cho phép gửi biểu mẫu
			}
		}
	</script>

						</body>
</html>
