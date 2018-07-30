package com.service;

import com.Static.Orderinfo;
import com.bean.Carrierbean;
import com.bean.Flight_info;
import com.bean.Flight_uniinfo;
import com.bean.Seatbean;

import java.util.Date;
import java.util.List;

public interface SingleOrderService {
    //点击搜索的时候调用的方法，先根据出发日期查找到航班序号
    List<Flight_uniinfo> search_flight_id(String dep_date);

    //然后根据航班序号查找到航班信息
    Flight_info get_flight_info(int flight_id);

    //根据航班序号和座位类型获取信息
    Seatbean get_seat_info(int flight_id,int seat_type);

    Carrierbean get_carrier_info(String carrier_id);

    //把订单结果插入进数据库
    void insert_order_info(Orderinfo orderinfo);
}
