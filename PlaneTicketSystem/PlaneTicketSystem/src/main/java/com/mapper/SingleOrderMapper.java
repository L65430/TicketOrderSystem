package com.mapper;

import com.bean.Carrierbean;
import com.bean.Flight_info;
import com.bean.Flight_uniinfo;
import com.bean.Seatbean;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.Date;
import java.util.List;

public interface SingleOrderMapper {

    //获取航班编号,一个dep_time对应多个航班编号
    @Select("select * from flight_uniinfo where flight_uniinfo.dep_date = #{dep_date}")
    List<Flight_uniinfo> search_flight_id(@Param("dep_date")String dep_date);//这里就是说传入的参数是dep_date，放到sql语句中去

    @Select("select * from flight_info where flight_info.flight_id = #{flight_id}")
    Flight_info search_flight_info(@Param("flight_id")int flight_id);

    //获取一个
    @Select("select * from seat_info where seat_info.flight_id = #{flight_id} and seat_info.seat_type= #{seat_type}")
    Seatbean get_seat_info(@Param("flight_id")int flight_id,@Param("seat_type")int seat_type);

    //获取航空公司信息
    @Select("select * from carrier_info where carrier_info.carrier_id = #{carrier_id}")
    Carrierbean get_carrier_info(@Param("carrier_id")String carrier_id);

    @Insert("insert into mainorder_info (order_type,user_phone) VALUES (1,#{user_phone})")
    void insert_into_main_order(@Param("user_phone")String user_phone);

    //插入进单程表
    @Insert("insert into sgorder_info (order_id,flight_id) VALUES (#{order_id},#{flight_id})")
    void insert_into_sgorder(@Param("order_id")int order_id,@Param("flight_id")int flight_id);

    //获取最后一个order_id
    @Select("select order_id from mainorder_info order by order_id DESC limit 1")
    int get_order_id();

    @Insert("insert into psg_info (order_id,psg_id,psg_name,psg_phone,psg_type,go_seat_type,go_seat_price) VALUES (#{order_id},#{psg_id},#{psg_name},#{psg_phone},#{psg_type},#{go_seat_type},#{go_seat_price})")
    void insert_into_psgorder(@Param("order_id") int order_id,@Param("psg_id") String psg_id,@Param("psg_name")String psg_name,@Param("psg_phone") String psg_phone,@Param("psg_type") int psg_type,@Param("go_seat_type")int go_seat_type,@Param("go_seat_price")int go_seat_price);
}
