package com.serviceimpl;

import com.bean.*;
import com.mapper.OrderlistMapper;
import com.service.OrderlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderlistServiceImpl implements OrderlistService{
    @Autowired
    OrderlistMapper orderlistMapper;
    public List<Mainorderbean> get_main_order(String user_phone) {
        return orderlistMapper.search_mainorder(user_phone);
    }

    public Sgorder_info get_sglist(int order_id){
        return orderlistMapper.get_sglist(order_id);
    }

    public List<Retnorderbean> get_norderlist(int order_id) {
        return orderlistMapper.get_retnorderlist(order_id);
    }

    public Passagebean get_psgbean(int order_id) {
        return orderlistMapper.get_psgbean(order_id);
    }

    public Flight_info get_flight_info(int flight_id) {
        return orderlistMapper.get_flight_info(flight_id);
    }

    public Flight_uniinfo get_flight_uniinfo(int flight_id){
        return orderlistMapper.get_flight_uniinfo(flight_id);
    }

}
