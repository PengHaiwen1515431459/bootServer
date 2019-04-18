package com.xiaoshu.api.utils;

/**
 * 短信验证码校验相关对象
 * Author: 老默
 * Date: 2019/4/18
 */
public class VerifyObject<T> {
    /**
     * 存放的对象数据
     */
    private T value;
    /**
     * 存放的时间ms
     */
    private long time=System.currentTimeMillis();
    /**
     * 最大生存时间ms
     */
    private long maxLiveTime;


    public long getMaxLiveTime() {
        return maxLiveTime;
    }

    public void setMaxLiveTime(long maxLiveTime) {
        this.maxLiveTime = maxLiveTime;
    }

    public T getValue() {
        return value;
    }

    public void setValue(T value) {
        this.value = value;
    }

    public long getTime() {
        return time;
    }

    public void setTime(long time) {
        this.time = time;
    }
}
