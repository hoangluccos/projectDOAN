package com.doan.Service.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.Dao.NhanVienDao;
import com.doan.Dto.NhanVienDto;
import com.doan.Entity.NhanVien;

@Service
public class NhanVienServiceImpl implements INhanVienService {
	
	@Autowired
	NhanVienDao employeeDao = new NhanVienDao();

	public NhanVienDto GetEmployeeByID(String id) {
		NhanVienDto listEmployee = employeeDao.GetEmployeeByID(id);
		return listEmployee;
	}
	
	public int AddEmployee(NhanVien nhanvien) {
		return employeeDao.AddEmployee(nhanvien);
	}

	public void deleteProduct(String id) {
		employeeDao.deleteData(id);
	}

	public void updateProduct(NhanVienDto nv) {
		employeeDao.update(nv);
	}
}
