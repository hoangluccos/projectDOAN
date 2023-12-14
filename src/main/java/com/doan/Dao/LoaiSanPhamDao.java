package com.doan.Dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.doan.Dto.LoaiSanPhamDto;
import com.doan.Dto.LoaiSanPhamDtoMapper;
import com.doan.Dto.SanPhamDto;
import com.doan.Entity.LoaiSanPham;

@Repository
public class LoaiSanPhamDao extends BaseDao {

	private StringBuffer SqlString() {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT ");
		sql.append("lsp.maLoaiSanPham");
		sql.append(", lsp.tenLoaiSanPham ");
		sql.append("FROM ");
		sql.append("LoaiSanPham AS lsp ");
		return sql;
	}

	public int AddProductType (LoaiSanPham loaisanpham) {
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT ");
			sql.append("INTO LoaiSanPham ");
			sql.append("(");
			sql.append("maLoaiSanPham,");
			sql.append(" tenLoaiSanPham");
			sql.append(") ");
			sql.append("VALUES ");
			sql.append("(");
			sql.append("'"+loaisanpham.getmaLoaiSanPham()+"', ");
			sql.append("'"+loaisanpham.gettenLoaiSanPham()+"'");
			sql.append(")");

			int insert = _jdbcTemplate.update(sql.toString());
			return insert;
		}
		catch (DataAccessException e){
			int insert = 0;
			return insert;
		}
	};
	
	public void update(LoaiSanPhamDto loaiSanPham) {
        String sql = "UPDATE LoaiSanPham SET tenLoaiSanPham = ? WHERE maLoaiSanPham = ?";
        _jdbcTemplate.update(sql, loaiSanPham.gettenLoaiSanPham(), loaiSanPham.getmaLoaiSanPham());
         
	}
	
	public void deleteData(String id) {
        String sql = "DELETE FROM LoaiSanPham WHERE maLoaiSanPham = ?";
        _jdbcTemplate.update(sql, id);
    }

	public List<LoaiSanPhamDto> GetDataLoaiSanPham() {
		String sql = SqlString().toString();
		List<LoaiSanPhamDto> listLoaiSanPham = _jdbcTemplate.query(sql, new LoaiSanPhamDtoMapper());
		return listLoaiSanPham;
	}
	
	private String SqlProductTypeByID(String id) {
		StringBuffer sql = SqlString();
		sql.append("WHERE lsp.maloaiSanPham = '" + id + "' ");
		return sql.toString();
	}
	
	public List<LoaiSanPhamDto> GetProductTypeByID(String id) {
		String sql = SqlProductTypeByID(id);
		List<LoaiSanPhamDto> listProductType = _jdbcTemplate.query(sql, new LoaiSanPhamDtoMapper());
		return listProductType;
	}
	
	@Autowired
	protected JdbcTemplate jdbc;
	
	protected List<LoaiSanPhamDto> getBySql (String sql) {
		return jdbc.query(sql, getRowMapper());
	}
	
	private RowMapper<LoaiSanPhamDto> getRowMapper() {
		return new BeanPropertyRowMapper<LoaiSanPhamDto>(LoaiSanPhamDto.class);
	}
	
	public List<LoaiSanPhamDto> getAll() {
		String sql = "SELECT * FROM SanPham";
		return getBySql(sql);
	}
	
	public void updateSoLuong(SanPhamDto entity) {
		String sql = "UPDATE SanPham SET soLuongHienCo = ? WHERE maSanPham = ?";
		jdbc.update(sql, entity.getsoLuongHienCo(), entity.getmaLoaiSanPham());
	}
	
	public LoaiSanPhamDto getById(Serializable maLoaiSanPham) {
		String sql = "SELECT * FROM LoaiSanPham WHERE maLoaiSanPham = ?";
		return jdbc.queryForObject(sql, getRowMapper(), maLoaiSanPham);
	}
}
