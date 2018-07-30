package com.bean;

import java.io.Serializable;

//初始的订单情况
public class Mainorderbean implements Serializable {
    private static final long serialVersionUID = 1L;

    private int order_id;
    private int order_type;//判断是哪种类型的
    private String user_phone;

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getOrder_type() {
        return order_type;
    }

    public void setOrder_type(int order_type) {
        this.order_type = order_type;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }
}
