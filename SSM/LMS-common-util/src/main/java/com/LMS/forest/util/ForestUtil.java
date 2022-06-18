package com.LMS.forest.util;

import com.LMS.forest.constant.ForestConstant;

import javax.servlet.http.HttpServletRequest;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 判断当前请求是否是Ajax请求
 * @return
 *          true:当前请求是Ajax请求
 *          false:当前请求不是Ajax请求
 */
public class ForestUtil {
    public static boolean judgeRequestType(HttpServletRequest request){
        //获取请求消息头
        String acceptHeader = request.getHeader("Accept");
        String xRequestHeader = request.getHeader("X-Requested-With");



        return (
                (acceptHeader != null && acceptHeader.contains("application/json"))
                        ||
                (xRequestHeader != null && xRequestHeader.equals("XMLHttpRequest"))
               );
    }

    /**
     * 明文字符串加密
     * @param source 传入的明文字符串
     * @return 密文
     *
     */
    public static String md5(String source){
        if (source == null || source.length() == 0){
            throw  new RuntimeException(ForestConstant.MESSAGE_STRING_INVALIDATE);
        }

        try {
            String algorithm = "md5";

            MessageDigest messageDigest = MessageDigest.getInstance(algorithm);

            byte[] input = source.getBytes();
            byte[] output = messageDigest.digest(input);

            int signum = 1;
            BigInteger bigInteger =  new BigInteger(signum,output);
            int radix = 16;
            String encode = bigInteger.toString(radix).toUpperCase();

            return encode;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

    }
}
