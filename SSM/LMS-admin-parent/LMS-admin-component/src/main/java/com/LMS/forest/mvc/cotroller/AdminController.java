package com.LMS.forest.mvc.cotroller;

import com.LMS.forest.constant.ForestConstant;
import com.LMS.forest.entity.Admin;
import com.LMS.forest.service.api.AdminService;
import com.LMS.forest.util.ForestUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/admin/update.html")
    public String update(
            Admin admin,
            @RequestParam("pageNum") Integer pageNum,
            @RequestParam("keyword") String keyword
    ){
        String password = admin.getPassword();
        password = ForestUtil.md5(password);
        admin.setPassword(password);
        adminService.update(admin);
        return "redirect:/admin/get/page.html?pageNum="+pageNum+"&keyword="+keyword;
    }

    @RequestMapping("/admin/to/edit/page.html")
    public String edit(
            @RequestParam("adminId") Integer adminId,
            @RequestParam("pageNum") Integer pageNum,
            @RequestParam("keyword") String keyword,
            ModelMap modelMap
    ){

        Admin admin = adminService.getAdminById(adminId);

        modelMap.addAttribute("admin",admin);

        return "admin-update";
    }

    @RequestMapping("/admin/save.html")
    public String save(
            @RequestParam("loginAcct") String loginAcct,
            @RequestParam("name") String name,
            @RequestParam("password") String password
    ){
        Admin admin = new Admin(null,loginAcct,name,password);

        adminService.saveAdmin(admin);

        return "redirect:/admin/get/page.html?pageNum="+Integer.MAX_VALUE;
    }

    @RequestMapping("/admin/remove/{adminId}/{pageNum}/{keyword}.html")
    public String remove(
            @PathVariable("adminId") Integer adminId,
            @PathVariable("pageNum") Integer pageNum,
            @PathVariable("keyword") String keyword

    ){
        adminService.remove(adminId);


        return "redirect:/admin/get/page.html?pageNum="+pageNum+"&keyword="+keyword;
    }

    @RequestMapping("admin/get/page.html")
    public String getPageInfo(
            @RequestParam(value = "keyword",defaultValue = "") String keyword,
            @RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize",defaultValue = "5") Integer pageSize,
            ModelMap modelMap
    ){
        PageInfo<Admin> pageInfo = adminService.getPageInfo(keyword, pageNum, pageSize);

        modelMap.addAttribute(ForestConstant.ATTR_NAME_PAGE_INFO,pageInfo);

        return "admin-page";
    }

    @RequestMapping("admin/do/admin-login.html")
    public String doLogin(@RequestParam("acct") String loginAcct, @RequestParam("pw") String password, HttpSession session){
        Admin admin = adminService.getAdminByLoginAcct(loginAcct,password);

        session.setAttribute(ForestConstant.ATTR_NAME_LOGIN_ADMIN,admin);

        return "redirect:/admin/to/main/page.html";
    }

    @RequestMapping("/admin/do/logout.html")
    public String doLogout(HttpSession session){
        session.invalidate();

        return "redirect:/admin/to/login/page.html";

    }

}
