package com.service;

import com.bean.*;

import java.util.List;

public interface OrderlistService {
    List<Mainorderbean> get_main_order(String user_phone);

    Sgorder_info get_sglist(int orer_id);

    List<Retnorderbean> get_norderlist(int order_id);

    Passagebean get_psgbean(int order_id);

    Flight_info get_flight_info(int flight_id);
}
