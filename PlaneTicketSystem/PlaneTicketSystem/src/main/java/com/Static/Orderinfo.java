package com.Static;

import org.apache.ibatis.annotations.Insert;

//因为订单是贯穿始终的，需要一个订单类，就是每次操作的时候订单都要存进去
public class Orderinfo {
        private static Orderinfo Instance=null;

        private int order_type;//表示订单是单程还是往返，1表示单，2表示往返
        private int order_code;//1表示去程，2表示返程
        private int flight_id;//用来表示当前的flight_id
        private String dep_city;
        private String arr_city;
        private String dep_date;
        private String arr_date;
        private String dep_time;
        private String arr_time;
        private String dep_airport;
        private String arr_airport;
        private String carrier_name;
        private String flight_no;//航班编号
        private int seat_type;//1,2,3来表示
        private int seat_price;
        private int order_id;//订单编号
        private String psg_id;
        private String psg_name;
        private String psg_phone;
        private int psg_type;//规定乘客是成人，儿童还是婴儿
        private String user_phone;
        private String user_name;

        public void setUser_phone(String user_phone) {
            this.user_phone = user_phone;
        }

        public String getUser_phone() {
            return user_phone;
        }

        public void setUser_name(String user_name) {
            this.user_name = user_name;
        }

        public String getUser_name() {
            return user_name;
        }

        public static Orderinfo getInstance() {
            if(Instance== null){
                Instance=new Orderinfo();
            }
            return Instance;
        }

    public int getOrder_type() {
        return order_type;
    }

    public void setOrder_type(int order_type) {
        this.order_type = order_type;
    }

    public void setOrder_code(int order_code) {
        this.order_code = order_code;
    }

    public int getOrder_code() {
        return order_code;
    }

    public int getFlight_id() {
        return flight_id;
    }

    public void setFlight_id(int flight_id) {
        this.flight_id = flight_id;
    }

    public String getDep_city() {
        return dep_city;
    }

    public void setDep_city(String dep_city) {
        this.dep_city = dep_city;
    }

    public void setArr_city(String arr_city) {
        this.arr_city = arr_city;
    }

    public String getArr_city() {
        return arr_city;
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

    public void setDep_airport(String dep_airport) {
        this.dep_airport = dep_airport;
    }

    public String getDep_airport() {
        return dep_airport;
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

    public void setSeat_type(int seat_type) {
        this.seat_type = seat_type;
    }

    public int getSeat_type() {
        return seat_type;
    }

    public int getSeat_price() {
        return seat_price;
    }

    public void setSeat_price(int seat_price) {
        this.seat_price = seat_price;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setPsg_id(String psg_id) {
        this.psg_id = psg_id;
    }

    public String getPsg_id() {
        return psg_id;
    }

    public String getPsg_name() {
        return psg_name;
    }

    public void setPsg_name(String psg_name) {
        this.psg_name = psg_name;
    }

    public String getPsg_phone() {
        return psg_phone;
    }

    public void setPsg_phone(String psg_phone) {
        this.psg_phone = psg_phone;
    }

    public int getPsg_type() {
        return psg_type;
    }

    public void setPsg_type(int psg_type) {
        this.psg_type = psg_type;
    }

    public void setArr_airport(String arr_airport) {
        this.arr_airport = arr_airport;
    }

    public String getArr_airport() {
        return arr_airport;
    }
}
