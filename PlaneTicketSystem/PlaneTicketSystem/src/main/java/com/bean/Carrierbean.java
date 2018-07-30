package com.bean;

import java.io.Serializable;

public class Carrierbean implements Serializable {
    private static final long serialVersionUID = 1L;

    private String carrier_id;
    private String carrier_name;
    private String carrier_telephone;
    private String carrier_address;

    public String getCarrier_name() {
        return carrier_name;
    }

    public void setCarrier_name(String carrier_name) {
        this.carrier_name = carrier_name;
    }

    public String getCarrier_id() {
        return carrier_id;
    }

    public void setCarrier_id(String carrier_id) {
        this.carrier_id = carrier_id;
    }

    public String getCarrier_telephone() {
        return carrier_telephone;
    }

    public void setCarrier_telephone(String carrier_telephone) {
        this.carrier_telephone = carrier_telephone;
    }

    public String getCarrier_address() {
        return carrier_address;
    }

    public void setCarrier_address(String carrier_address) {
        this.carrier_address = carrier_address;
    }
}
