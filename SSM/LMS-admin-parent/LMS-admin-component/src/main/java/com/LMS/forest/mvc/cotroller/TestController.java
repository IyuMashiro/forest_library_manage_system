package com.LMS.forest.mvc.cotroller;

import com.LMS.forest.entity.Admin;
import com.LMS.forest.entity.Student;
import com.LMS.forest.service.api.AdminService;
import com.LMS.forest.util.ForestUtil;
import com.LMS.forest.util.ResultEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class TestController {
    @Autowired
    private AdminService adminService;

    Logger logger = LoggerFactory.getLogger(TestController.class);

    @ResponseBody
    @RequestMapping("/send/compose/object.json")
    public ResultEntity<Student> testReceiveComposeObject(@RequestBody Student student,HttpServletRequest request){

            boolean judgeResult =ForestUtil.judgeRequestType(request);

            logger.info("judgeResult"+judgeResult);

            logger.info(student.toString());

            ResultEntity<Student> resultEntity = ResultEntity.successWithData(student);

            return resultEntity;
    }

    @ResponseBody
    @RequestMapping("send/array.html")
    public String testReceiveArrayOne(@RequestBody List<Integer> array){
        for (Integer number : array){
            logger.info("number="+number);
        }

        return "target";
    }

    @RequestMapping("/test/ssm.html")
    public String test(ModelMap modelMap, HttpServletRequest request){
        List<Admin> adminList = adminService.getAll();

        boolean judgeResult =ForestUtil.judgeRequestType(request);

        logger.info("judgeResult"+judgeResult);


        modelMap.addAttribute("adminList",adminList);

        String a = null;

        System.out.println(a.length());

        return "target";

    }

}
