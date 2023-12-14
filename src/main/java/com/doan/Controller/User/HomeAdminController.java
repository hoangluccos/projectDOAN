package com.doan.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.doan.Dao.DonHangDao;
import com.doan.Dao.NhapHangDao;

@Controller
@RequestMapping(value = "/admin")
public class HomeAdminController extends BaseController {
	@Autowired
	NhapHangDao nhaphangdao;
	@Autowired
	DonHangDao donhangdao;
	@RequestMapping(value = "/")
	public String homeAdmin() {
		return "admin/index";
	}
	@RequestMapping(value = "/lich-su-nhap-hang")
	public ModelAndView lsunhaphang() {
		_mvShare.addObject("lichSuNhapHangList", nhaphangdao.GetDataNhapHang());
		_mvShare.setViewName("admin/his_nhaphang");
		return _mvShare;
	}
	@RequestMapping(value = "/lich-su-thanh-toan")
	public ModelAndView lsuhoadon() {
		_mvShare.addObject("lichSuNhapHangList", donhangdao.GetDataDonHang());
		_mvShare.setViewName("admin/his_thanhtoan");
		return _mvShare;
	}

}
