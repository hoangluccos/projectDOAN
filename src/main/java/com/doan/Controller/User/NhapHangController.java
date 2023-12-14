package com.doan.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMethod;

import com.doan.Dao.NhapHangDao;
import com.doan.Dao.SanPhamDao;
import com.doan.Dto.SanPhamDto;
import com.doan.Entity.NhapHang;
import com.doan.Service.User.SanPhamServiceImpl;

import jakarta.servlet.http.HttpSession;


@Controller
public class NhapHangController extends BaseController{
	
	@Autowired
    private SanPhamServiceImpl sanPhamService; // Thay thế SanPhamService bằng interface/service thích hợp của bạn
	@Autowired
	SanPhamDao sanphamDao;
	
	@Autowired
	NhapHangDao nhaphangDao;

    @GetMapping("/user/nhap-hang")
    public ModelAndView hienThiTrangNhapHang(Model model, HttpSession session) {
    	// Lấy mã nhân viên từ session
        _mvShare.addObject("danhSachSanPham", sanPhamService.GetAll());
        _mvShare.setViewName("user/nhaphang");
        return _mvShare;
    }

    @RequestMapping(value= "/xuly-nhap-hang", method = RequestMethod.POST)
    public String xuLyNhapHang(@RequestParam("maNhanVien") String maNhanVien,
    							@RequestParam("sanPham") String maSanPham,
                               @RequestParam("soLuong") int soLuong) {
    	
//       SanPhamDto sanPham = sanPhamService.GetProductByID(maSanPham);
//        if (sanPham != null) {
//            // Thực hiện cập nhật số lượng hoặc các bước xử lý khác
//            sanPham.setsoLuongHienCo((sanPham.getsoLuongHienCo() + soLuong));     
//            sanPhamService.capNhatThongTinSanPham(sanPham);
//        }
        SanPhamDto sanPhamDto = new SanPhamDto();
        sanPhamDto.setmaSanPham(maSanPham);
        sanPhamDto = sanphamDao.getById(sanPhamDto.getmaSanPham());
        sanPhamDto.setsoLuongHienCo(sanPhamDto.getsoLuongHienCo() + soLuong);

        // Gọi phương thức updateSoLuong
        sanphamDao.updateSoLuong(sanPhamDto);
        
        NhapHang nhaphang = new NhapHang();
        nhaphang.setmaNhanVien(maNhanVien);
        nhaphang.setmaSanPham(maSanPham);
        nhaphang.setsoLuong(soLuong);
        
        nhaphangDao.themNhapHang(nhaphang);
        
        return "redirect:user/xem-san-pham";
    }

}