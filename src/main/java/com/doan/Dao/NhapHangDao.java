package com.doan.Dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.doan.Entity.MapperNhapHang;
import com.doan.Entity.NhapHang;


@Repository
public class NhapHangDao extends BaseDao {

	private StringBuffer SqlString() {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT ");
		sql.append("s.maNhanVien");
		sql.append(", s.maSanPham");
		sql.append(", s.ngayNhapHang");
		sql.append(", s.soLuong ");
		sql.append("FROM ");
		sql.append("NhapHang AS s ");
		return sql;
	}
	
	public int themNhapHang (NhapHang nhaphang) {
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT ");
			sql.append("INTO NhapHang ");
			sql.append("(");
			sql.append("maNhanVien,");
			sql.append(" maSanPham,");
//			sql.append(" ngayNhapHang,");
			sql.append(" soLuong");
			sql.append(") ");
			sql.append("VALUES ");
			sql.append("(");
			sql.append("'"+nhaphang.getmaNhanVien()+"', ");
			sql.append("'"+nhaphang.getmaSanPham()+"', ");
			sql.append(nhaphang.getsoLuong());
			sql.append(")");

			int insert = _jdbcTemplate.update(sql.toString());
			return insert;
		}
		catch (DataAccessException e){
			int insert = 0;
			return insert;
		}
	};

	public List<NhapHang> GetDataNhapHang() {
		String sql = SqlString().toString();
		List<NhapHang> listNhaphangs = _jdbcTemplate.query(sql, new MapperNhapHang());
		return listNhaphangs;
	}
}