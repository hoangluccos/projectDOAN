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

import com.doan.Dao.NhanVienDao;
import com.doan.Dto.NhanVienDto;
import com.doan.Entity.NhanVien;
import com.doan.Service.User.NhanVienServiceImpl;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class NhanVienController extends BaseController{
	@Autowired
	NhanVienServiceImpl nhanvienService = new NhanVienServiceImpl();

	@Autowired
	NhanVienDao nhanvienDao;
	
	@RequestMapping(value = "/admin/nhan-vien")
	public ModelAndView Index() {
		_mvShare.addObject("nhanvien", _homeService.GetDataEmployees());
		_mvShare.setViewName("admin/employees/employee");
		return _mvShare;
	}
	
	@RequestMapping(value="them-nhan-vien",method= RequestMethod.GET)
	public ModelAndView AddCreateEmployee() {
		_mvShare.setViewName("admin/employees/addemployee");
		_mvShare.addObject("nhanvien", new NhanVien());
		_mvShare.addObject("getnhanvien", _homeService.GetDataEmployees());
		return _mvShare;
		
	}
	
	@RequestMapping(value="them-nhan-vien",method= RequestMethod.POST)
	public String CreateEmployee(HttpServletRequest request, @ModelAttribute("nhanvien") NhanVien nhanvien) {
		HttpSession session = request.getSession();
		int count = nhanvienService.AddEmployee(nhanvien);
		if(count > 0) {
			session.setAttribute("status", "Thêm thành công!");
		}
		else {
			session.setAttribute("status", "Thêm thất bại!");
		}
		return "redirect:" +request.getHeader("Referer");
	}

	@RequestMapping(value = "/editemployee/{maNhanVien}", method = RequestMethod.GET)
	public String editEmployee(@PathVariable("maNhanVien") String maNhanVien, Model model) {
		NhanVienDto employee = nhanvienService.GetEmployeeByID(maNhanVien);
		model.addAttribute("nhanVien", employee);
		return "admin/employees/editemployee";
	}
	
	/*
	 * @RequestMapping(value = "/deleteProduct/{maSanPham}", method =
	 * RequestMethod.GET) public String deleteProduct(@PathVariable("maSanPham")
	 * String maSanPham, Model model) { sanphamService.deleteProduct(maSanPham);
	 * model.addAttribute("sanpham", _homeService.GetDataProducts()); return
	 * "admin/products/product"; }
	 */

	@RequestMapping(value= "/update-employee", method = RequestMethod.POST)
	public String update(@RequestParam("maNhanVien") String maNhanVien,
			@RequestParam("tenNhanVien") String tenNhanVien,
			@RequestParam("gioiTinh") int gioiTinh,
			@RequestParam("sdt") String sdt) {
		NhanVienDto nhanvienDto = nhanvienDao.getById(maNhanVien);
	    if (nhanvienDto == null) {
	        // Xử lý khi không tìm thấy sản phẩm
	        return "redirect:/error-page";
	    }
	    nhanvienDto.settenNhanVien(tenNhanVien);
	    nhanvienDto.setgioiTinh(gioiTinh);
	    nhanvienDto.setsdt(sdt);
	    nhanvienDao.update(nhanvienDto);
	    return "redirect:/admin/nhan-vien";
	}
}