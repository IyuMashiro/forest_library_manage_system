package com.LMS.forest.service.impl;

import com.LMS.forest.constant.ForestConstant;
import com.LMS.forest.entity.Admin;
import com.LMS.forest.entity.AdminExample;
import com.LMS.forest.exception.LoginAcctAlreadyInUseException;
import com.LMS.forest.exception.LoginFailedException;
import com.LMS.forest.mapper.AdminMapper;
import com.LMS.forest.service.api.AdminService;
import com.LMS.forest.util.ForestUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import static com.LMS.forest.util.ForestUtil.md5;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;
    @Override
    public void saveAdmin(Admin admin) {

        String userPassword = admin.getPassword();
        userPassword = ForestUtil.md5(userPassword);

        admin.setPassword(userPassword);


        java.sql.Date date = new java.sql.Date(new Date().getTime());
        admin.setCreateDate(date);

        try{
            adminMapper.insert(admin);
        }catch (Exception e){
            e.printStackTrace();

            if (e instanceof DuplicateKeyException){
                throw new LoginAcctAlreadyInUseException(ForestConstant.MESSAGE_LOGIN_ALREADY_IN_USE);
            }
        }

    }

    @Override
    public List<Admin> getAll() {
        return adminMapper.selectByExample(new AdminExample());
    }

    @Override
    public Admin getAdminByLoginAcct(String loginAcct, String password) {

        AdminExample adminExample = new AdminExample();

        AdminExample.Criteria criteria = adminExample.createCriteria();

        criteria.andLoginAcctEqualTo(loginAcct);

        List<Admin> list = adminMapper.selectByExample(adminExample);

        if (list == null || list.size() == 0){
            throw new LoginFailedException(ForestConstant.MESSAGE_LOGIN_FAILED);
        }

        if (list.size() > 1){
            throw new RuntimeException(ForestConstant.MESSAGE_SYSTEM_ERROR_LOGIN_ONT_UNIQUE);
        }

        Admin admin = list.get(0);

        if (admin == null){
            throw new LoginFailedException(ForestConstant.MESSAGE_LOGIN_FAILED);
        }

        String userPwDB = admin.getPassword();

        String userPwForm =  ForestUtil.md5(password);

        if (!Objects.equals(userPwDB,userPwForm)){
            throw new LoginFailedException(ForestConstant.MESSAGE_LOGIN_FAILED);
        }

        return admin;
    }

    @Override
    public PageInfo<Admin> getPageInfo(String keyword, Integer pageNum, Integer pageSize) {

        PageHelper.startPage(pageNum,pageSize);

        List<Admin> list = adminMapper.selectAdminByKeyword(keyword);

        return new PageInfo<>(list);
    }

    @Override
    public void remove(Integer adminId) {
        adminMapper.deleteByPrimaryKey(adminId);
    }

    @Override
    public Admin getAdminById(Integer adminId) {
        return adminMapper.selectByPrimaryKey(adminId);
    }

    @Override
    public void update(Admin admin) {
            adminMapper.updateByPrimaryKeySelective(admin);
    }
}
