package com.doan.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
public class MapperNhanVien implements RowMapper<NhanVien> {
	public NhanVien mapRow(ResultSet rs, int rowNum) throws SQLException {
		NhanVien NhanVien = new NhanVien();
		NhanVien.settenNhanVien(rs.getString("tenNhanVien"));
		NhanVien.setmaNhanVien(rs.getString("maNhanVien"));
		NhanVien.setgioiTinh(rs.getInt("gioiTinh"));
		NhanVien.setsdt(rs.getString("sdt"));
		NhanVien.setchucVu(rs.getString("chucVu"));
		return NhanVien;
	}
}