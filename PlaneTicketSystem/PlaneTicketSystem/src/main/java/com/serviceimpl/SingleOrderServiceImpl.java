package com.serviceimpl;

import com.Static.Orderinfo;
import com.bean.Carrierbean;
import com.bean.Flight_info;
import com.bean.Flight_uniinfo;
import com.bean.Seatbean;
import com.mapper.SingleOrderMapper;
import com.service.SingleOrderService;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class SingleOrderServiceImpl implements SingleOrderService {
    @Autowired
    SingleOrderMapper singleOrderMapper;


    public List<Flight_uniinfo> search_flight_id(String dep_date) {
       return singleOrderMapper.search_flight_id(dep_date);
    }

    public Flight_info get_flight_info(int flight_id) {
        return singleOrderMapper.search_flight_info(flight_id);
    }

    public Seatbean get_seat_info(int flight_id, int seat_type) {
        return singleOrderMapper.get_seat_info(flight_id,seat_type);
    }

    public Carrierbean get_carrier_info(String carrier_id) {
        return singleOrderMapper.get_carrier_info(carrier_id);
    }

    public void insert_order_info(Orderinfo orderinfo) {
        //插入进main_order表
        singleOrderMapper.insert_into_main_order(orderinfo.getUser_phone());
        //插入之后马上取出order_id
        int order_id=singleOrderMapper.get_order_id();
        //然后插入sig那个表
        singleOrderMapper.insert_into_sgorder(order_id,orderinfo.getFlight_id());
        //然后再插入乘客表
        singleOrderMapper.insert_into_psgorder(order_id,Orderinfo.getInstance().getPsg_id(),Orderinfo.getInstance().getPsg_name(),Orderinfo.getInstance().getPsg_phone(),Orderinfo.getInstance().getPsg_type(),
                Orderinfo.getInstance().getSeat_type(),Orderinfo.getInstance().getSeat_price());
    }
}
