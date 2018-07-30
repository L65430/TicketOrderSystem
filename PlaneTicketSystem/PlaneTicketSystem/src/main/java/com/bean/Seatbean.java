package com.bean;

import java.io.Serializable;

public class Seatbean implements Serializable{
    private static final long serialVersionUID = 1L;

    private int flight_id;
    private int seat_type;
    private int seat_price;
    private int seat_amount;

    public int getFlight_id() {
        return flight_id;
    }

    public void setFlight_id(int flight_id) {
        this.flight_id = flight_id;
    }

    public int getSeat_type() {
        return seat_type;
    }

    public void setSeat_type(int seat_type) {
        this.seat_type = seat_type;
    }

    public int getSeat_price() {
        return seat_price;
    }

    public void setSeat_price(int seat_price) {
        this.seat_price = seat_price;
    }

    public int getSeat_amount() {
        return seat_amount;
    }

    public void setSeat_amount(int seat_amount) {
        this.seat_amount = seat_amount;
    }
}
