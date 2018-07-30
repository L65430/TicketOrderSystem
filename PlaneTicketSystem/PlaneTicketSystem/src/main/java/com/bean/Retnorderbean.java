package com.bean;

import java.io.Serializable;

//往返
public class Retnorderbean implements Serializable{
    private static final long serialVersionUID = 1L;

    private int order_id;
    private int order_code;//往返
    private int flight_id;//航班序号

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getOrder_code() {
        return order_code;
    }

    public void setOrder_code(int order_code) {
        this.order_code = order_code;
    }

    public int getFlight_id() {
        return flight_id;
    }

    public void setFlight_id(int flight_id) {
        this.flight_id = flight_id;
    }
}
