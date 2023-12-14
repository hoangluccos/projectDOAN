package com.doan.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
public class MapperTaiKhoan implements RowMapper<TaiKhoan> {
	public TaiKhoan mapRow(ResultSet rs, int rowNum) throws SQLException {
		TaiKhoan TaiKhoan = new TaiKhoan();
		TaiKhoan.setmaNhanVien(rs.getString("maNhanVien"));
		TaiKhoan.settenDangNhap(rs.getString("tenDangNhap"));
		TaiKhoan.setmatKhau(rs.getString("matKhau")); 
		return TaiKhoan;
	}
}