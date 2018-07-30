package com.serviceimpl;

import com.Static.RetOrderinfo;
import com.bean.Carrierbean;
import com.bean.Flight_info;
import com.bean.Flight_uniinfo;
import com.bean.Seatbean;
import com.mapper.RetnOrderMapper;
import com.mapper.SingleOrderMapper;
import com.service.RetnOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RetnOrderServiceImpl implements RetnOrderService{
    @Autowired
    RetnOrderMapper retnOrderMapper;

    public List<Flight_uniinfo> search_flight_id(String dep_date) {
        return retnOrderMapper.search_flight_id(dep_date);
    }

    public Flight_info get_flight_info(int flight_id) {
        return retnOrderMapper.search_flight_info(flight_id);
    }

    public Seatbean get_seat_info(int flight_id, int seat_type) {
        return retnOrderMapper.get_seat_info(flight_id,seat_type);
    }

    public Carrierbean get_carrier_info(String carrier_id) {
        return retnOrderMapper.get_carrier_info(carrier_id);
    }

    public void insert_order_info(RetOrderinfo retOrderinfo) {
        //插入进main_order表
        retnOrderMapper.insert_into_main_order(RetOrderinfo.getInstance().getUser_phone());
        int order_id=retnOrderMapper.get_order_id();
        //插入到双程表
        retnOrderMapper.insert_into_retnorder(order_id,1,RetOrderinfo.getInstance().getGo_flight_id());
        retnOrderMapper.insert_into_retnorder(order_id,2,RetOrderinfo.getInstance().getBack_flight_id());

        System.out.print("\n此时go_seat_type："+RetOrderinfo.getInstance().getGo_seat_type());
        retnOrderMapper.insert_into_psgorder(order_id,RetOrderinfo.getInstance().getPsg_id(),RetOrderinfo.getInstance().getPsg_name(),RetOrderinfo.getInstance().getPsg_phone(),RetOrderinfo.getInstance().getPsg_type()
        ,RetOrderinfo.getInstance().getGo_seat_type(),RetOrderinfo.getInstance().getGo_seat_price(),RetOrderinfo.getInstance().getBack_seat_type(),RetOrderinfo.getInstance().getBack_seat_price());
    }


}
