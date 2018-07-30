package com.mapper;

import com.bean.*;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface OrderlistMapper {
    @Select("select * from mainorder_info where mainorder_info.user_phone = #{user_phone}")
    List<Mainorderbean> search_mainorder(@Param("user_phone")String user_phone);//这里就是说传入的参数是dep_date，放到sql语句中去

    @Select("select * from sgorder_info where sgorder_info.order_id = #{order_id}")
    Sgorder_info get_sglist(@Param("order_id")int order_id);

    @Select("select * from retnorder_info where retnorder_info.order_id = #{order_id}")
    List<Retnorderbean> get_retnorderlist(@Param("order_id")int order_id);

    @Select("select * from psg_info where psg_info.order_id = #{order_id}")
    Passagebean get_psgbean(@Param("order_id")int order_id);

    @Select("select * from flight_info where flight_id = #{flight_id}")
    Flight_info get_flight_info(@Param("flight_id")int flight_id);

    @Select("select * from flight_uniinfo where flight_id= #{flight_id}")
    Flight_uniinfo get_flight_uniinfo(@Param("flight_id")int flight_id);

}
