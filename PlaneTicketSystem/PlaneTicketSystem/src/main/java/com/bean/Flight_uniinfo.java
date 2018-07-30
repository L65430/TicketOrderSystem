package com.bean;

import java.io.Serializable;
import java.util.Date;

//
public class Flight_uniinfo implements Serializable{
    private static final long serialVersionUID = 1L;

    private int flight_id;//序号，用来做搜索的
    private String flight_no;//航班编号
    private String dep_date;
    private String arr_date;

    public int getFlight_id() {
        return flight_id;
    }

    public void setFlight_id(int flight_id) {
        this.flight_id = flight_id;
    }

    public String getFlight_no() {
        return flight_no;
    }

    public void setFlight_no(String flight_no) {
        this.flight_no = flight_no;
    }

    public String  getDep_date() {
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
}
