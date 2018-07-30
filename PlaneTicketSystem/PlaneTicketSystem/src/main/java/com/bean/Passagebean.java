package com.bean;

import java.io.Serializable;

//用在完善乘机人页面
public class Passagebean implements Serializable{
    private static final long serialVersionUID = 1L;

    private int order_id;//订单编号
    private String psg_name;//乘客姓名
    private String psg_id;//乘客身份证
    private int psg_type;//乘客买的票的价格
    private String psg_phone;//联系人电话
    private int go_seat_type;
    private int go_seat_price;
    private int back_seat_type;
    private int back_seat_price;

    public int getOrder_id() {
        return order_id;
    }

    public int getPsg_type() {
        return psg_type;
    }

    public String getPsg_name() {
        return psg_name;
    }

    public String getPsg_id() {
        return psg_id;
    }

    public String getPsg_phone() {
        return psg_phone;
    }

    public int getGo_seat_type() {
        return go_seat_type;
    }

    public int getGo_seat_price() {
        return go_seat_price;
    }

    public int getBack_seat_price() {
        return back_seat_price;
    }

    public int getBack_seat_type() {
        return back_seat_type;
    }

    public void setPsg_type(int psg_type) {
        this.psg_type = psg_type;
    }

    public void setPsg_phone(String psg_phone) {
        this.psg_phone = psg_phone;
    }

    public void setPsg_name(String psg_name) {
        this.psg_name = psg_name;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public void setPsg_id(String psg_id) {
        this.psg_id = psg_id;
    }

    public void setGo_seat_type(int go_seat_type) {
        this.go_seat_type = go_seat_type;
    }

    public void setGo_seat_price(int go_seat_price) {
        this.go_seat_price = go_seat_price;
    }

    public void setBack_seat_type(int back_seat_type) {
        this.back_seat_type = back_seat_type;
    }

    public void setBack_seat_price(int back_seat_price) {
        this.back_seat_price = back_seat_price;
    }
}
