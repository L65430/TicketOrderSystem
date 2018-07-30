package com.bean;

import java.io.Serializable;

//单程的订单
public class Sgorder_info implements Serializable{
    private static final long serialVersionUID = 1L;

    private int order_id;
    private int flight_id;

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getFlight_id() {
        return flight_id;
    }

    public void setFlight_id(int flight_id) {
        this.flight_id = flight_id;
    }
}
