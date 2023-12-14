document.addEventListener("DOMContentLoaded", function () {
    const productsPerPage = 4;
    let currentPage = 1;

    function fetchProducts() {
        // Thực hiện AJAX để lấy dữ liệu sản phẩm từ server
        // Sử dụng XMLHttpRequest hoặc Fetch API
        // Đây chỉ là một ví dụ đơn giản, thực tế bạn cần thay thế đoạn này
        const url = `your_server_endpoint?page=${currentPage}&perPage=${productsPerPage}`;
        fetch(url)
            .then(response => response.json())
            .then(data => {
                displayProducts(data.products);
                displayPagination(data.totalPages);
            })
            .catch(error => console.error('Error fetching data:', error));
    }

    function displayProducts(products) {
        const productListElement = document.getElementById('productList');
        productListElement.innerHTML = '';

        products.forEach(product => {
            const productItem = document.createElement('div');
            productItem.classList.add('product-item');

            const productInfo = document.createElement('div');
            productInfo.classList.add('product-info');
            productInfo.innerHTML = `
                <p><strong>Tên sản phẩm:</strong> ${product.tenSanPham}</p>
                <p><strong>Số Lượng Hiện Có:</strong> ${product.soLuongHienCo}</p>
                <p><strong>Giá tiền:</strong> ${product.giaTien} ₫</p>
                <hr class="soften" />
            `;

            const editCartButton = document.createElement('button');
            editCartButton.classList.add('btn', 'btn-mini', 'btn-danger', 'edit-cart');
            editCartButton.innerHTML = `<span class="icon-edit"></span> Mua`;
            editCartButton.addEventListener('click', function () {
                openModal(product.maSanPham, product.tenSanPham, product.soLuongHienCo, product.giaTien);
            });

            productItem.appendChild(productInfo);
            productItem.appendChild(editCartButton);
            productListElement.appendChild(productItem);
        });
    }

    function displayPagination(totalPages) {
        const paginationElement = document.getElementById('pagination');
        paginationElement.innerHTML = '';

        for (let i = 1; i <= totalPages; i++) {
            const pageItem = document.createElement('li');
            const pageLink = document.createElement('a');
            pageLink.href = '#';
            pageLink.textContent = i;
            pageLink.addEventListener('click', function () {
                currentPage = i;
                fetchProducts();
            });

            pageItem.appendChild(pageLink);
            paginationElement.appendChild(pageItem);
        }
    }

    fetchProducts(); // Khi trang được tải, hiển thị sản phẩm và phân trang
});