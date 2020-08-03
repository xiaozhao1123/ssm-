package com.zhao.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {
    private boolean flag;
    private String msg;

    private Map<String,Object> map=new HashMap<String, Object>();

    public static  Msg success(){
        Msg result = new Msg();
        result.setFlag(true);
        result.setMsg("操作成功");
        return  result;
    }
    public static  Msg defaul(){
        Msg result = new Msg();
        result.setFlag(false);
        result.setMsg("操作失败");
        return  result;
    }
    public Msg add(String key,Object value){
        this.getMap().put(key,value);
        return  this;
    }
    public Msg(boolean flag, String msg, Map<String, Object> map) {
        this.flag = flag;
        this.msg = msg;
        this.map = map;
    }

    public Msg() {
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
