package com.doan.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.Dao.LoaiSanPhamDao;
import com.doan.Dto.LoaiSanPhamDto;
import com.doan.Entity.LoaiSanPham;

@Service
public class LoaiSanPhamServiceImpl {
	@Autowired
	LoaiSanPhamDao loaisanphamDao = new LoaiSanPhamDao();
	
	public LoaiSanPhamDto GetProductTypeByID(String id) {
		List<LoaiSanPhamDto> listProductTypes = loaisanphamDao.GetProductTypeByID(id);
		return listProductTypes.get(0);
	}
	
	public int AddProductType(LoaiSanPham loaisanpham) {
		return loaisanphamDao.AddProductType(loaisanpham);
	}
	
	public void deleteProductType (String id) {
		loaisanphamDao.deleteData(id);
	}
	
	public void update(LoaiSanPhamDto lsp) {
		loaisanphamDao.update(lsp);
	}
	
	public List<LoaiSanPhamDto> GetDataLoaiSanPham() {
		List<LoaiSanPhamDto> listLoaiSanPham = loaisanphamDao.GetDataLoaiSanPham();
		return listLoaiSanPham;
	}
}
