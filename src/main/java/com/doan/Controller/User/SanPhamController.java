package com.doan.Controller.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.doan.Dao.SanPhamDao;
import com.doan.Dto.LoaiSanPhamDto;
import com.doan.Dto.SanPhamDto;
import com.doan.Entity.SanPham;
import com.doan.Service.User.SanPhamServiceImpl;
import com.doan.Service.User.LoaiSanPhamServiceImpl;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class SanPhamController extends BaseController {

	@Autowired
	SanPhamServiceImpl sanphamService = new SanPhamServiceImpl();

	@Autowired
	LoaiSanPhamServiceImpl loaisanphamService = new LoaiSanPhamServiceImpl();

	@Autowired
	SanPhamDao sanphamDao;
	@RequestMapping(value = "/admin/san-pham")
	public ModelAndView AdminIndex() {
		_mvShare.addObject("sanpham", _homeService.GetDataProducts());
		_mvShare.setViewName("admin/products/product");
		return _mvShare;
	}

	@RequestMapping(value = "/user/xem-san-pham")
	public ModelAndView UserIndex() {
		_mvShare.addObject("sanpham", _homeService.GetDataProducts());
		_mvShare.setViewName("user/products/product");
		return _mvShare;
	}


	@RequestMapping(value = "them-san-pham", method = RequestMethod.GET)
	public ModelAndView AddProduct() {
		_mvShare.setViewName("admin/products/addproduct");
		_mvShare.addObject("sanpham", new SanPham());
		_mvShare.addObject("loaisanpham", _homeService.GetDataLoaiSanPham());
		return _mvShare;

	}

	@RequestMapping(value="them-san-pham",method= RequestMethod.POST)
	public String CreateProduct(HttpServletRequest request, @ModelAttribute("loaisanpham") SanPham sanpham) {
		HttpSession session = request.getSession();
		int count = sanphamService.AddProduct(sanpham);
		if(count > 0) {
			session.setAttribute("status", "Thêm thành công!");
		}
		else {
			session.setAttribute("status", "Thêm thất bại!");
		}
		return "redirect:" +request.getHeader("Referer");
	}

	@RequestMapping(value = "/editProduct/{maSanPham}", method = RequestMethod.GET)
	public String editProduct(@PathVariable("maSanPham") String maSanPham, Model model) {
		SanPhamDto product = sanphamService.GetProductByID(maSanPham);
		List<LoaiSanPhamDto> producttype = loaisanphamService.GetDataLoaiSanPham();
		model.addAttribute("sanPham", product);
		model.addAttribute("loaisanpham", producttype);
		return "admin/products/editProduct";
	}
	
	/*
	 * @RequestMapping(value = "/deleteProduct/{maSanPham}", method =
	 * RequestMethod.GET) public String deleteProduct(@PathVariable("maSanPham")
	 * String maSanPham, Model model) { sanphamService.deleteProduct(maSanPham);
	 * model.addAttribute("sanpham", _homeService.GetDataProducts()); return
	 * "admin/products/product"; }
	 */

	@RequestMapping(value= "/update-product", method = RequestMethod.POST)
	public String update(@RequestParam("maSanPham") String maSanPham,
			@RequestParam("maLoaiSanPham") String maLoaiSanPham,
			@RequestParam("tenSanPham") String tenSanPham,
            @RequestParam("giaTien") int giaTien, SanPhamDto sp) {
		SanPhamDto sanPhamDto = sanphamDao.getById(maSanPham);
	    if (sanPhamDto == null) {
	        // Xử lý khi không tìm thấy sản phẩm
	        return "redirect:/error-page";
	    }
	    sanPhamDto.setmaLoaiSanPham(maLoaiSanPham);
	    sanPhamDto.settenSanPham(tenSanPham);
	    sanPhamDto.setgiaTien(giaTien);
	    sanphamDao.update(sanPhamDto);
	    return "redirect:/admin/san-pham";
	}
}