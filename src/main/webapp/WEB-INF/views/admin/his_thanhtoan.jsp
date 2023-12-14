<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lịch Sử Nhập Hàng</title>
<!-- Các thư viện CSS và JavaScript (nếu cần) -->
<style>


table, h1{

	width: 80%; /* Điều chỉnh kích thước của bảng */
	margin: 0 auto; /* Căn giữa bảng */
	border-collapse: collapse;
	margin-top:10px;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #38A59F;
}
</style>
<script>
    // Hàm tính tổng cộng từ danh sách các hóa đơn
    function calculateTotalRevenue() {
        var tongCong = 0;
        var table = document.getElementById("myTable");
        var rows = table.getElementsByTagName("tbody")[0].getElementsByTagName("tr");

        for (var i = 0; i < rows.length; i++) {
            var cell = rows[i].getElementsByTagName("td")[2]; // Cột chứa tổng cộng
            var value = parseFloat(cell.innerText || cell.textContent);

            if (!isNaN(value)) {
                tongCong += value;
            }
        }

        return tongCong;
    }

    // Hàm hiển thị tổng cộng
    function displayTotalRevenue() {
        var tongCong = calculateTotalRevenue();
        var totalRevenueElement = document.getElementById("totalRevenue");
        var totalAmountElement = document.getElementById("totalAmount");

        if (totalAmountElement) {
            totalAmountElement.innerHTML = tongCong.toFixed(2) + " ₫"; // Thêm đơn vị tiền
        }

        if (totalRevenueElement) {
            totalRevenueElement.style.display = "block"; // Hiển thị phần tử tổng cộng
        }
    }

    // Gọi hàm hiển thị tổng cộng khi trang tải xong
    window.onload = displayTotalRevenue;
</script>
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
								<a href="<c:url value="/admin/nhan-vien"/>">Nhân Viên</a>
							</c:if> <c:if test="${empty LoginInfo }">
								<a href="<c:url value="/user/dang-nhap"/>"><span
									class="icon-edit"></span>Nhân Viên</a>
							</c:if>
						<li class=""><c:if test="${not empty LoginInfo }">
								<a href="<c:url value="/admin/xem-khach-hang"/>">Khách hàng</a>
							</c:if> <c:if test="${empty LoginInfo }">
								<a href="<c:url value="/user/dang-nhap"/>"><span
									class="icon-edit"></span>Khách hàng</a>
							</c:if>
						<li class=""><c:if test="${not empty LoginInfo }">
								<a href="<c:url value="/admin/san-pham"/>">Sản phẩm</a>
							</c:if> <c:if test="${empty LoginInfo }">
								<a href="<c:url value="/user/dang-nhap"/>"><span
									class="icon-edit"></span>Sản phẩm</a>
							</c:if>
						<li class=""><c:if test="${not empty LoginInfo }">
								<a href="<c:url value="/admin/loai-san-pham"/>">Loại sản
									phẩm</a>
							</c:if> <c:if test="${empty LoginInfo }">
								<a href="<c:url value="/user/dang-nhap"/>"><span
									class="icon-edit"></span>Loại sản phẩm</a>
							</c:if>
						<li class=""><c:if test="${not empty LoginInfo }">
								<a href="<c:url value="lich-su-nhap-hang"/>">Lịch Sử Nhập
									hàng</a>
							</c:if> <c:if test="${empty LoginInfo }">
								<a href="<c:url value="/user/dang-nhap"/>"><span
									class="icon-edit"></span>Lịch Sử Nhập hàng</a>
							</c:if>
						<li class=""><c:if test="${not empty LoginInfo }">
								<a href="<c:url value="lich-su-thanh-toan"/>">Lịch Sử Thanh toán</a>
							</c:if> <c:if test="${empty LoginInfo }">
								<a href="<c:url value="/user/dang-nhap"/>"><span
									class="icon-edit"></span>Lịch Sử Thanh toán</a>
							</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<h1>Lịch Sử Thanh Toán</h1>
<!-- Đoạn mã hiển thị tổng cộng -->
<h2 id="totalRevenue" style = "color:red">Tổng Cộng: <span id="totalAmount"></span></h2>
	<table id="myTable">
        <thead>
            <tr>
                <th >Mã Đơn Hàng</th>
                <th>Ngày Đặt Hàng</th>
                <th>Tổng Cộng</th>
                <th>Nhân Viên Cash</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="lichSuNhapHang" items="${lichSuNhapHangList}">
                <tr>
                    <td>${lichSuNhapHang.maDonHang}</td>
                    <td>${lichSuNhapHang.ngayDatHang}</td>
                    <td>${lichSuNhapHang.tongCong}</td>
                    <td>${lichSuNhapHang.maNhanVien}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>


</body>
</html>