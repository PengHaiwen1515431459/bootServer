package com.xiaoshu.api.controller;

import com.xiaoshu.api.utils.VerifyObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpSession;

public class BaseController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    public BaseController() {
    }

    /**
     * 是否为有效验证码请求行为（处理了时间限制）
     * @param sessionKey
     * @return
     */
    public boolean isValidTimeSmsRequest(HttpSession session, String sessionKey){

        VerifyObject<String> vo=getSessionData(session,sessionKey);

        return (vo==null|| ((System.currentTimeMillis()-vo.getTime())>vo.getMaxLiveTime()));

    }

    /**
     * 存入数据对象到session
     * @param session
     * @param sessionKey
     * @param data
     */
    public void putSessionData(HttpSession session, String sessionKey, Object data){

        session.setAttribute(sessionKey,data);

    }


    /**
     * 获取session对象
     * @param session
     * @param sessionKey
     * @param <T>
     * @return
     */
    public <T> T getSessionData(HttpSession session,String sessionKey){

        T data=(T)session.getAttribute(sessionKey);

        return data;

    }

    /**
     *  清理服务器缓存内容
     * @param session
     * @param sessionKey
     */
    public void clearSessionData(HttpSession session,String sessionKey){

        session.removeAttribute(sessionKey);
    }
}
