package com.bean;

//用来显示在界面上
public class Order_preparebean {
    private static final long serialVersionUID = 1L;

    private String dep_city;
    private String arr_city;
    private String dep_date;
    private String dep_time;
    private String arr_time;
    private String dep_airport;
    private String arr_airport;
    private String carrier_name;
    private String flight_no;
    private String seat_type;
    private String seat_price;
    private int flight_id;

    public java.lang.String getDep_city() {
        return dep_city;
    }

    public void setDep_city(java.lang.String dep_city) {
        this.dep_city = dep_city;
    }

    public String getArr_city() {
        return arr_city;
    }

    public void setArr_airport(String arr_airport) {
        this.arr_airport = arr_airport;
    }

    public String getDep_date() {
        return dep_date;
    }

    public void setDep_date(String dep_date) {
        this.dep_date = dep_date;
    }

    public String getDep_time() {
        return dep_time;
    }

    public void setDep_time(String dep_time) {
        this.dep_time = dep_time;
    }

    public String getArr_time() {
        return arr_time;
    }

    public void setArr_time(String arr_time) {
        this.arr_time = arr_time;
    }

    public void setArr_city(String arr_city) {
        this.arr_city = arr_city;
    }

    public String getDep_airport() {
        return dep_airport;
    }

    public void setDep_airport(String dep_airport) {
        this.dep_airport = dep_airport;
    }

    public String getArr_airport() {
        return arr_airport;
    }

    public String getCarrier_name() {
        return carrier_name;
    }

    public void setCarrier_name(String carrier_name) {
        this.carrier_name = carrier_name;
    }

    public String getFlight_no() {
        return flight_no;
    }

    public void setFlight_no(String flight_no) {
        this.flight_no = flight_no;
    }

    public String getSeat_type() {
        return seat_type;
    }

    public void setSeat_price(String seat_price) {
        this.seat_price = seat_price;
    }

    public void setSeat_type(String seat_type) {
        this.seat_type = seat_type;
    }

    public String getSeat_price() {
        return seat_price;
    }

    public int getFlight_id() {
        return flight_id;
    }

    public void setFlight_id(int flight_id) {
        this.flight_id = flight_id;
    }

}
