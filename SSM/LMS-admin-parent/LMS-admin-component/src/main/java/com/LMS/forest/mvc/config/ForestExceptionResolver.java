package com.LMS.forest.mvc.config;

import com.LMS.forest.constant.ForestConstant;
import com.LMS.forest.exception.AccessForbiddenException;
import com.LMS.forest.exception.LoginAcctAlreadyInUseException;
import com.LMS.forest.exception.LoginFailedException;
import com.LMS.forest.util.ForestUtil;
import com.LMS.forest.util.ResultEntity;
import com.google.gson.Gson;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import java.io.IOException;
import java.net.http.HttpResponse;

//基于此注解表示当前类是一个基于注解的异常处理类
@ControllerAdvice
public class ForestExceptionResolver {

    @ExceptionHandler(value = ArithmeticException.class)
    public ModelAndView resolveArithmeticException(ArithmeticException exception, HttpServletRequest request, HttpServletResponse response)throws IOException {

        String viewName = "system-error";

        return commonResolves(viewName,exception,request,response);
    }

    @ExceptionHandler(value = NullPointerException.class)
    public ModelAndView resolveNullPointerException(NullPointerException exception, HttpServletRequest request, HttpServletResponse response)throws IOException {

        String viewName = "system-error";

        return commonResolves(viewName,exception,request,response);
    }

    @ExceptionHandler(value = LoginAcctAlreadyInUseException.class)
    public ModelAndView LoginAcctAlreadyInUseException(LoginAcctAlreadyInUseException exception, HttpServletRequest request, HttpServletResponse response)throws IOException {

        String viewName = "admin-add";

        return commonResolves(viewName,exception,request,response);
    }

    @ExceptionHandler(value = LoginFailedException.class)
    public ModelAndView resolveLoginFailedException(LoginFailedException exception, HttpServletRequest request, HttpServletResponse response)throws IOException {

        String viewName = "admin-login";

        return commonResolves(viewName,exception,request,response);
    }


    @ExceptionHandler(value = AccessForbiddenException.class)
    public ModelAndView resolveAccessForbiddenException(AccessForbiddenException exception, HttpServletRequest request, HttpServletResponse response)throws IOException {

        String viewName = "admin-login";

        return commonResolves(viewName,exception,request,response);
    }

    private ModelAndView commonResolves(String viewName,Exception exception,HttpServletRequest request,HttpServletResponse response)throws IOException{

        boolean judgeResult = ForestUtil.judgeRequestType(request);

        if (judgeResult){
            ResultEntity<Object> resultEntity = ResultEntity.failed(exception.getMessage());

            Gson gson = new Gson();
            String json = gson.toJson(resultEntity);

            response.getWriter().write(json);

            //上面已经通过原生response对象返回了响应，所以不提供ModelAndView对象
            return null;
        }

        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject(ForestConstant.ATTR_NAME_EXCEPTION,exception);

        modelAndView.setViewName(viewName);

        return modelAndView;
    }


}
