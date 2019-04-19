package com.xiaoshu.common.base;

import com.xiaoshu.api.utils.WebConstants;

import java.io.Serializable;

public class R implements Serializable {
    private Integer code;
    private String msg;
    private Object data;

    public static R ok(){
        R r=new R();
        r.setCode(WebConstants.WEB_CODE_SUCCESS);
        r.setMsg(WebConstants.WEB_CODE_SUCCESS_MSG);
        return r;
    }
    public static R ok(Integer code){
        R r=new R();
        r.setCode(code);
        return r;
    }
    public static R ok(Integer code,String msg){
        R r=new R();
        r.setCode(code);
        r.setMsg(msg);
        return r;
    }
    public static R  ok(int code ,String msg,Object data){
        R r=new R();
        r.setCode(code);
        r.setMsg(msg);
        r.setData(data);
        return r;
    }
    public static R  error(){
        R r=new R();
        r.setCode(WebConstants.WEB_CODE_ERROR);
        r.setMsg(WebConstants.WEB_LOGIN_ERR_MSG);
        return r;
    }

    public static R  error(int code){
        R r=new R();
        r.setCode(code);
        return r;
    }
    public static R  error(int code,String msg){
        R r=new R();
        r.setCode(code);
        r.setMsg(msg);
        return r;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
