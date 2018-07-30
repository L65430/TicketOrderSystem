package com.Static;

import org.apache.ibatis.jdbc.Null;

//用来储存注册信息，用一个单例模式
public class Userinfo {
    private static Userinfo Instance=null;
    private String user_phone;
    private String user_name;

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_name() {
        return user_name;
    }

    public static Userinfo getInstance() {
        if(Instance== null){
            Instance=new Userinfo();
        }
        return Instance;
    }
}
