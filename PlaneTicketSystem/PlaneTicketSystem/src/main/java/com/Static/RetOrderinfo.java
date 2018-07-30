package com.Static;

import com.bean.Retnorderbean;

public class RetOrderinfo {
    private static RetOrderinfo Instance=null;

    private String dep_city;
    private String arr_city;
    private String dep_date;
    private String arr_date;
    private String go_dep_time;
    private String go_arr_time;
    private String go_dep_airport;
    private String go_arr_airport;
    private String go_carrier_name;
    private String go_flight_no;
    private int go_seat_type;
    private int go_seat_price;
    private int go_flight_id;
    private String back_dep_time;
    private String back_arr_time;
    private String back_dep_airport;
    private String back_arr_airport;
    private String back_carrier_name;
    private String back_flight_no;
    private int back_seat_type;
    private int back_seat_price;
    private int back_flight_id;
    private int order_id;//订单编号
    private String psg_id;
    private String psg_name;
    private String psg_phone;
    private int psg_type;//规定乘客是成人，儿童还是婴儿
    private String user_phone;
    private String user_name;

    public static RetOrderinfo getInstance() {
        if(Instance== null){
            Instance=new RetOrderinfo();
        }
        return Instance;
    }

    public String getDep_city() {
        return dep_city;
    }

    public void setDep_city(String dep_city) {
        this.dep_city = dep_city;
    }

    public String getArr_city() {
        return arr_city;
    }

    public void setArr_city(String arr_city) {
        this.arr_city = arr_city;
    }

    public String getDep_date() {
        return dep_date;
    }

    public void setDep_date(String dep_date) {
        this.dep_date = dep_date;
    }

    public String getArr_date() {
        return arr_date;
    }

    public void setArr_date(String arr_date) {
        this.arr_date = arr_date;
    }

    public String getGo_dep_time() {
        return go_dep_time;
    }

    public void setGo_dep_time(String go_dep_time) {
        this.go_dep_time = go_dep_time;
    }

    public String getGo_arr_time() {
        return go_arr_time;
    }

    public void setGo_arr_time(String go_arr_time) {
        this.go_arr_time = go_arr_time;
    }

    public int getBack_flight_id() {
        return back_flight_id;
    }

    public int getBack_seat_type() {
        return back_seat_type;
    }

    public int getBack_seat_price() {
        return back_seat_price;
    }

    public int getGo_flight_id() {
        return go_flight_id;
    }

    public int getGo_seat_price() {
        return go_seat_price;
    }

    public int getGo_seat_type() {
        return go_seat_type;
    }

    public String getBack_arr_airport() {
        return back_arr_airport;
    }

    public String getBack_arr_time() {
        return back_arr_time;
    }

    public String getBack_carrier_name() {
        return back_carrier_name;
    }

    public String getBack_dep_airport() {
        return back_dep_airport;
    }

    public String getBack_dep_time() {
        return back_dep_time;
    }

    public String getBack_flight_no() {
        return back_flight_no;
    }

    public String getGo_arr_airport() {
        return go_arr_airport;
    }

    public String getGo_carrier_name() {
        return go_carrier_name;
    }

    public String getGo_dep_airport() {
        return go_dep_airport;
    }

    public String getGo_flight_no() {
        return go_flight_no;
    }

    public static void setInstance(RetOrderinfo instance) {
        Instance = instance;
    }

    public void setBack_arr_airport(String back_arr_airport) {
        this.back_arr_airport = back_arr_airport;
    }

    public void setBack_arr_time(String back_arr_time) {
        this.back_arr_time = back_arr_time;
    }

    public void setBack_carrier_name(String back_carrier_name) {
        this.back_carrier_name = back_carrier_name;
    }

    public void setBack_dep_airport(String back_dep_airport) {
        this.back_dep_airport = back_dep_airport;
    }

    public void setBack_dep_time(String back_dep_time) {
        this.back_dep_time = back_dep_time;
    }

    public void setBack_flight_id(int back_flight_id) {
        this.back_flight_id = back_flight_id;
    }

    public void setBack_flight_no(String back_flight_no) {
        this.back_flight_no = back_flight_no;
    }

    public void setBack_seat_price(int back_seat_price) {
        this.back_seat_price = back_seat_price;
    }

    public void setBack_seat_type(int back_seat_type) {
        this.back_seat_type = back_seat_type;
    }

    public void setGo_arr_airport(String go_arr_airport) {
        this.go_arr_airport = go_arr_airport;
    }

    public void setGo_carrier_name(String go_carrier_name) {
        this.go_carrier_name = go_carrier_name;
    }

    public void setGo_dep_airport(String go_dep_airport) {
        this.go_dep_airport = go_dep_airport;
    }

    public void setGo_flight_id(int go_flight_id) {
        this.go_flight_id = go_flight_id;
    }

    public void setGo_flight_no(String go_flight_no) {
        this.go_flight_no = go_flight_no;
    }

    public void setGo_seat_price(int go_seat_price) {
        this.go_seat_price = go_seat_price;
    }

    public void setGo_seat_type(int go_seat_type) {
        this.go_seat_type = go_seat_type;
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

    public int getOrder_id() {
        return order_id;
    }

    public String getPsg_phone() {
        return psg_phone;
    }

    public String getUser_name() {
        return user_name;
    }

    public String getUser_phone() {
        return user_phone;
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

    public void setPsg_id(String psg_id) {
        this.psg_id = psg_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }
}
