package com.bean;

//订单类，用来做传递，后台用来传递给后端的
public class Orderinfobean {
    private static final long serialVersionUID = 1L;

    private int order_code;//用来表示往返的时候的情况
    private int order_id;
    private int order_type;//表示是往还是返
    private String user_phone;//当前登录的用户是谁
    private int sg_flight_id;//单程的flight_id
    private int ret_go_flight_id;
    private int ret_back_flight_id;

    //乘客信息
    private String psg_id;
    private String psg_name;
    private String psg_phone;
    private String psg_type;//数据库里是1,2,3，要做一下处理传回去

    //航班信息
    private String sg_dep_city;
    private String sg_arr_city;

    private String ret_dep_city;//以去程为标准
    private String ret_arr_city;

    private String sg_flight_no;
    private String ret_go_flight_no;
    private String ret_back_flight_no;

    private String sg_seat_type;//去的时候的seat_type;
    private String ret_go_seat_type;
    private String ret_back_seat_type;

    private String sg_dep_airport;
    private String ret_go_dep_airport;
    private String ret_go_arr_airport;

    private String sg_arr_airport;
    private String ret_back_dep_airport;
    private String ret_back_arr_airport;

    private String sg_dep_date;
    private String ret_dep_date;//去的那天
    private String ret_arr_date;//回来的那天

    private String sg_dep_time;
    private String sg_arr_time;
    private String ret_go_dep_time;
    private String ret_go_arr_time;
    private String ret_back_dep_time;
    private String ret_back_arr_time;

    private int sg_seat_price;
    private int ret_go_seat_price;
    private int ret_back_seat_price;

    public String getUser_phone() {
        return user_phone;
    }

    public String getPsg_phone() {
        return psg_phone;
    }

    public int getOrder_id() {
        return order_id;
    }

    public String getPsg_id() {
        return psg_id;
    }

    public String getPsg_name() {
        return psg_name;
    }


    public int getOrder_type() {
        return order_type;
    }

    public int getSg_flight_id() {
        return sg_flight_id;
    }

    public String getPsg_type() {
        return psg_type;
    }

    public String getRet_arr_city() {
        return ret_arr_city;
    }

    public String getRet_arr_date() {
        return ret_arr_date;
    }

    public String getRet_back_arr_airport() {
        return ret_back_arr_airport;
    }

    public String getRet_back_dep_airport() {
        return ret_back_dep_airport;
    }

    public String getRet_back_flight_no() {
        return ret_back_flight_no;
    }

    public String getRet_back_seat_type() {
        return ret_back_seat_type;
    }

    public String getRet_dep_city() {
        return ret_dep_city;
    }

    public String getRet_dep_date() {
        return ret_dep_date;
    }

    public String getRet_go_arr_airport() {
        return ret_go_arr_airport;
    }

    public String getRet_go_dep_airport() {
        return ret_go_dep_airport;
    }

    public String getRet_go_flight_no() {
        return ret_go_flight_no;
    }

    public String getRet_go_seat_type() {
        return ret_go_seat_type;
    }

    public String getSg_arr_airport() {
        return sg_arr_airport;
    }

    public String getSg_arr_city() {
        return sg_arr_city;
    }

    public String getSg_dep_airport() {
        return sg_dep_airport;
    }

    public String getSg_arr_time() {
        return sg_arr_time;
    }

    public String getSg_dep_city() {
        return sg_dep_city;
    }

    public String getSg_dep_date() {
        return sg_dep_date;
    }

    public String getSg_flight_no() {
        return sg_flight_no;
    }

    public String getSg_seat_type() {
        return sg_seat_type;
    }

    public String getSg_dep_time() {
        return sg_dep_time;
    }

    public String getRet_back_arr_time() {
        return ret_back_arr_time;
    }

    public String getRet_go_arr_time() {
        return ret_go_arr_time;
    }

    public String getRet_back_dep_time() {
        return ret_back_dep_time;
    }

    public int getRet_back_seat_price() {
        return ret_back_seat_price;
    }

    public String getRet_go_dep_time() {
        return ret_go_dep_time;
    }

    public int getRet_go_seat_price() {
        return ret_go_seat_price;
    }

    public int getSg_seat_price() {
        return sg_seat_price;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    public void setPsg_id(String psg_id) {
        this.psg_id = psg_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public void setPsg_name(String psg_name) {
        this.psg_name = psg_name;
    }

    public void setPsg_phone(String psg_phone) {
        this.psg_phone = psg_phone;
    }

    public void setPsg_type(String psg_type) {
        this.psg_type = psg_type;
    }


    public void setOrder_type(int order_type) {
        this.order_type = order_type;
    }

    public void setRet_arr_city(String ret_arr_city) {
        this.ret_arr_city = ret_arr_city;
    }

    public void setRet_back_dep_airport(String ret_back_dep_airport) {
        this.ret_back_dep_airport = ret_back_dep_airport;
    }

    public void setRet_arr_date(String ret_arr_date) {
        this.ret_arr_date = ret_arr_date;
    }

    public void setRet_back_arr_airport(String ret_back_arr_airport) {
        this.ret_back_arr_airport = ret_back_arr_airport;
    }

    public void setRet_back_flight_no(String ret_back_flight_no) {
        this.ret_back_flight_no = ret_back_flight_no;
    }

    public void setRet_back_seat_type(String ret_back_seat_type) {
        this.ret_back_seat_type = ret_back_seat_type;
    }

    public void setRet_dep_city(String ret_dep_city) {
        this.ret_dep_city = ret_dep_city;
    }

    public void setRet_dep_date(String ret_dep_date) {
        this.ret_dep_date = ret_dep_date;
    }

    public void setRet_go_arr_airport(String ret_go_arr_airport) {
        this.ret_go_arr_airport = ret_go_arr_airport;
    }

    public void setRet_go_dep_airport(String ret_go_dep_airport) {
        this.ret_go_dep_airport = ret_go_dep_airport;
    }

    public void setRet_go_flight_no(String ret_go_flight_no) {
        this.ret_go_flight_no = ret_go_flight_no;
    }

    public void setRet_go_seat_type(String ret_go_seat_type) {
        this.ret_go_seat_type = ret_go_seat_type;
    }

    public void setSg_arr_city(String sg_arr_city) {
        this.sg_arr_city = sg_arr_city;
    }

    public void setSg_arr_airport(String sg_arr_airport) {
        this.sg_arr_airport = sg_arr_airport;
    }

    public void setSg_dep_airport(String sg_dep_airport) {
        this.sg_dep_airport = sg_dep_airport;
    }

    public void setSg_arr_time(String sg_arr_time) {
        this.sg_arr_time = sg_arr_time;
    }

    public void setRet_go_dep_time(String ret_go_dep_time) {
        this.ret_go_dep_time = ret_go_dep_time;
    }

    public void setSg_dep_city(String sg_dep_city) {
        this.sg_dep_city = sg_dep_city;
    }

    public void setSg_dep_date(String sg_dep_date) {
        this.sg_dep_date = sg_dep_date;
    }

    public void setSg_dep_time(String sg_dep_time) {
        this.sg_dep_time = sg_dep_time;
    }

    public void setSg_flight_id(int sg_flight_id) {
        this.sg_flight_id = sg_flight_id;
    }

    public void setSg_flight_no(String sg_flight_no) {
        this.sg_flight_no = sg_flight_no;
    }

    public void setSg_seat_type(String sg_seat_type) {
        this.sg_seat_type = sg_seat_type;
    }

    public void setRet_back_arr_time(String ret_back_arr_time) {
        this.ret_back_arr_time = ret_back_arr_time;
    }

    public void setRet_back_dep_time(String ret_back_dep_time) {
        this.ret_back_dep_time = ret_back_dep_time;
    }

    public void setRet_back_seat_price(int ret_back_seat_price) {
        this.ret_back_seat_price = ret_back_seat_price;
    }

    public void setRet_go_arr_time(String ret_go_arr_time) {
        this.ret_go_arr_time = ret_go_arr_time;
    }

    public void setRet_go_seat_price(int ret_go_seat_price) {
        this.ret_go_seat_price = ret_go_seat_price;
    }

    public void setSg_seat_price(int sg_seat_price) {
        this.sg_seat_price = sg_seat_price;
    }

    public void setRet_back_flight_id(int ret_back_flight_id) {
        this.ret_back_flight_id = ret_back_flight_id;
    }

    public void setRet_go_flight_id(int ret_go_flight_id) {
        this.ret_go_flight_id = ret_go_flight_id;
    }

    public int getRet_back_flight_id() {
        return ret_back_flight_id;
    }

    public int getRet_go_flight_id() {
        return ret_go_flight_id;
    }

    public int getOrder_code() {
        return order_code;
    }

    public void setOrder_code(int order_code) {
        this.order_code = order_code;
    }
}
