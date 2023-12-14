package com.doan.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.Dao.SanPhamDao;
import com.doan.Dto.SanPhamDto;
import com.doan.Entity.SanPham;

@Service
public class SanPhamServiceImpl implements ISanPhamService {

	@Autowired
	SanPhamDao productDao = new SanPhamDao();

	public SanPhamDto GetProductByID(String id) {
		List<SanPhamDto> listProducts = productDao.GetProductByID(id);
		return listProducts.get(0);
	}

	public List<SanPhamDto> GetProductByIDCategory(String id) {
		return productDao.GetAllProductsByID(id);
	}

	@Autowired
	public List<SanPhamDto> GetAll() {
		return productDao.GetDataProducts();
	}

	public int AddProduct(SanPham sanpham) {
		return productDao.AddProduct(sanpham);
	}

	public void deleteProduct(String id) {
		productDao.deleteData(id);
	}

	@Override
	public void capNhatThongTinSanPham(SanPhamDto sanPhamDto) {
		 List<SanPhamDto> danhSachSanPham = GetAll();
		 for (SanPhamDto sp : danhSachSanPham) { 
			 if (sp.getmaSanPham().equals(sanPhamDto.getmaSanPham())) {
	 sp.settenSanPham(sanPhamDto.gettenSanPham());
	 sp.setgiaTien(sanPhamDto.getgiaTien());
	 sp.setmaLoaiSanPham(sanPhamDto.getmaLoaiSanPham());
	 sp.setsoLuongHienCo(sanPhamDto.getsoLuongHienCo()); break;
			 }
		 }
	}
}
