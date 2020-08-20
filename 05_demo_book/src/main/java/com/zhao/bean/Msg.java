package com.zhao.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {
    private boolean flag;
    private String message;
    private Map<String,Object> map=new HashMap<>();

   public static Msg success(){
      Msg result=new Msg();
      result.setFlag(true);
      result.setMessage("操作成功");
      return result;
   }
    public static Msg error(){
        Msg result=new Msg();
        result.setFlag(false);
        result.setMessage("操作失败");
        return result;
    }
    public Msg add(String key,Object value){
        this.getMap().put(key,value);
        return  this;
    }
    public Msg() {
    }

    public Msg(boolean flag, String message, Map<String, Object> map) {
        this.flag = flag;
        this.message = message;
        this.map = map;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }
}
