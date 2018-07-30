package com.bean;

import java.io.Serializable;

public class Flight_seat implements Serializable {
    private static final long serialVersionUID = 1L;

    //还应该要包含其他部分，要包括seat_type,seat_price,seat_amount
    private int flight_id;
    private String flight_no;
    private String dep_time;
    private String arr_time;
    private String dep_airport;
    private String dep_city;
    private String arr_airport;
    private String arr_city;
    private String carrier_id;//归属的航空公司
    private String air_name;
    private int seat_account;

    private int seat_price_first;//头等舱
    private int seat_price_second;//商务舱
    private int seat_price_third;//经济舱
    private int seat_price_fourth;//优惠

    private int seat_amount_first;//头等舱
    private int seat_amount_second;//商务舱
    private int seat_amount_third;//经济舱
    private int seat_amount_fourth;//优惠

    //还要包含航空公司名字
    private String carrier_name;

    private String dep_date;//出发的日期



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

    public String getDep_airport() {
        return dep_airport;
    }

    public void setDep_airport(String dep_airport) {
        this.dep_airport = dep_airport;
    }

    public String getDep_city() {
        return dep_city;
    }

    public void setDep_city(String dep_city) {
        this.dep_city = dep_city;
    }

    public String getArr_airport() {
        return arr_airport;
    }

    public void setArr_city(String arr_city) {
        this.arr_city = arr_city;
    }

    public String getCarrier_id() {
        return carrier_id;
    }

    public void setArr_airport(String arr_airport) {
        this.arr_airport = arr_airport;
    }

    public String getAir_name() {
        return air_name;
    }

    public void setAir_name(String air_name) {
        this.air_name = air_name;
    }

    public int getSeat_account() {
        return seat_account;
    }

    public void setSeat_account(int seat_account) {
        this.seat_account = seat_account;
    }

    public String getArr_city() {
        return arr_city;
    }

    public void setCarrier_id(String carrier_id) {
        this.carrier_id = carrier_id;
    }


    public int getSeat_price_first() {
        return seat_price_first;
    }

    public void setSeat_price_first(int seat_price_first) {
        this.seat_price_first = seat_price_first;
    }

    public int getSeat_price_second() {
        return seat_price_second;
    }

    public void setSeat_price_second(int seat_price_second) {
        this.seat_price_second = seat_price_second;
    }

    public int getSeat_price_third() {
        return seat_price_third;
    }

    public void setSeat_price_third(int seat_price_third) {
        this.seat_price_third = seat_price_third;
    }

    public int getSeat_price_fourth() {
        return seat_price_fourth;
    }

    public void setSeat_price_fourth(int seat_price_fourth) {
        this.seat_price_fourth = seat_price_fourth;
    }

    public int getSeat_amount_first() {
        return seat_amount_first;
    }

    public void setSeat_amount_first(int seat_amount_first) {
        this.seat_amount_first = seat_amount_first;
    }

    public int getSeat_amount_second() {
        return seat_amount_second;
    }

    public void setSeat_amount_second(int seat_amount_second) {
        this.seat_amount_second = seat_amount_second;
    }

    public int getSeat_amount_third() {
        return seat_amount_third;
    }

    public void setSeat_amount_third(int seat_amount_third) {
        this.seat_amount_third = seat_amount_third;
    }

    public int getSeat_amount_fourth() {
        return seat_amount_fourth;
    }

    public void setSeat_amount_fourth(int seat_amount_fourth) {
        this.seat_amount_fourth = seat_amount_fourth;
    }

    public String getCarrier_name() {
        return carrier_name;
    }

    public void setCarrier_name(String carrier_name) {
        this.carrier_name = carrier_name;
    }

    public String getDep_date() {
        return dep_date;
    }

    public void setDep_date(String dep_date) {
        this.dep_date = dep_date;
    }
}
