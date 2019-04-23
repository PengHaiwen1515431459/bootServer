package com.xiaoshu.common.config;

import com.alibaba.fastjson.JSON;
import com.xiaoshu.admin.entity.User;
import com.xiaoshu.api.utils.JwtUtil;
import com.xiaoshu.common.base.R;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * 全局拦截器（可以处理权限控制和资源管理）
 */
public class GlobalSessionInterceptor implements HandlerInterceptor {

    /**
     * 拦截指定资源做客户端的用户权限验证
     *
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        response.setCharacterEncoding("utf-8");
        String token =request.getHeader("token");
        if(null != token){
            boolean result= JwtUtil.verifyToken(token);
            if(result){
                //已登陆可以进行访问
                return true;
            }
        }
        //提示用户登陆，否则无权访问页面
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");
        PrintWriter writer = response.getWriter();
        writer.write(JSON.toJSONString(R.error(-999, "您必须要先登陆才能访问页面！")));
        return false;
    }


    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modeAndView) throws Exception {


    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {


    }


}
