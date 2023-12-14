package com.doan.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.doan.Dao.KhachHangDao;
import com.doan.Dto.KhachHangDto;
import com.doan.Entity.KhachHang;
import com.doan.Service.User.KhachHangServiceImpl;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class KhachHangController extends BaseController{
	@Autowired
	KhachHangServiceImpl khachhangService = new KhachHangServiceImpl();

	@Autowired
	KhachHangDao khachhangDao;
	
	@RequestMapping(value = "/user/khach-hang")
	public ModelAndView UserIndex() {
		_mvShare.addObject("khachhang", _homeService.GetDataCustomers());
		_mvShare.setViewName("user/customers/customer");
		return _mvShare;
	}
	
	@RequestMapping(value = "/admin/xem-khach-hang")
	public ModelAndView AdminIndex() {
		_mvShare.addObject("khachhang", _homeService.GetDataCustomers());
		_mvShare.setViewName("admin/customers/customerview");
		return _mvShare;
	}
	
	@RequestMapping(value="them-khach-hang",method= RequestMethod.GET)
	public ModelAndView AddCreateCustomer() {
		_mvShare.setViewName("user/customers/addcustomer");
		_mvShare.addObject("khachhang", new KhachHang());
		return _mvShare;
		
	}
	
	@RequestMapping(value="them-khach-hang",method= RequestMethod.POST)
	public String CreateCustomer(HttpServletRequest request, @ModelAttribute("khachhang") KhachHang khachhang) {
		HttpSession session = request.getSession();
		int count = khachhangService.AddCustomer(khachhang);
		if(count > 0) {
			session.setAttribute("status", "Thêm thành công!");
		}
		else {
			session.setAttribute("status", "Thêm thất bại!");
		}
		return "redirect:" +request.getHeader("Referer");
	}

	@RequestMapping(value = "/editCustomer/{maKhachHang}", method = RequestMethod.GET)
	public String editCustomer(@PathVariable("maKhachHang") String maKhachHang, Model model) {
		KhachHangDto customer = khachhangService.GetCustomerByID(maKhachHang);
		model.addAttribute("khachHang", customer);
		return "user/customers/editcustomer";
	}
	
	/*
	 * @RequestMapping(value = "/deleteProduct/{maSanPham}", method =
	 * RequestMethod.GET) public String deleteProduct(@PathVariable("maSanPham")
	 * String maSanPham, Model model) { sanphamService.deleteProduct(maSanPham);
	 * model.addAttribute("sanpham", _homeService.GetDataProducts()); return
	 * "admin/products/product"; }
	 */

	@RequestMapping(value= "/update-customer", method = RequestMethod.POST)
	public String update(@RequestParam("maKhachHang") String maKhachHang,
			@RequestParam("tenKhachHang") String tenKhachHang,
            @RequestParam("sdt") String sdt, KhachHangDto kh) {
		KhachHangDto khachhangDto = khachhangDao.getById(maKhachHang);
	    if (khachhangDto == null) {
	        // Xử lý khi không tìm thấy sản phẩm
	        return "redirect:/error-page";
	    }
	    khachhangDto.settenKhachHang(tenKhachHang);
	    khachhangDto.setsdt(sdt);
	    khachhangDao.update(khachhangDto);
	    return "redirect:/user/khach-hang";
	}
}