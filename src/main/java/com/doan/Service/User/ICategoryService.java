package com.doan.Service.User;

import java.util.List;

import org.springframework.stereotype.Service;

import com.doan.Dto.SanPhamDto;

@Service
public interface ICategoryService {
	
	public List<SanPhamDto> GetAllProductsByID(int id);
	
}
