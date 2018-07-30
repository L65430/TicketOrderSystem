package com.controller;

import com.Static.Orderinfo;
import com.Static.RetOrderinfo;
import com.Static.Userinfo;
import com.bean.*;
import com.serviceimpl.RetnOrderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class RetnOrderController {
    @Autowired
    RetnOrderServiceImpl retnOrderService;

    @RequestMapping("/RetnOrder/turnToSingle")
    public ModelAndView return_to_single(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("showindex");
        return mv;
    }

    //用来获取这一天的返程
    @RequestMapping("/RetnOrder/get_back_today")
    public @ResponseBody List<Flight_seat> get_back_today(String dep_date, String dep_city, String arr_city){
        try{
            List<Flight_uniinfo> flight_uniinfoList=retnOrderService.search_flight_id(dep_date);
            List<Flight_info> flight_infoList=new ArrayList<Flight_info>();
            List<Flight_seat> flight_seatList=new ArrayList<Flight_seat>();
            int flight_id;
            String carrier_name;
            Carrierbean carrierbean=new Carrierbean();
            for(int i=0;i<flight_uniinfoList.size();i++){
                flight_id=flight_uniinfoList.get(i).getFlight_id();
                Flight_info flight_info=retnOrderService.get_flight_info(flight_id);
                if(flight_info!=null){
                    if(flight_info.getDep_city().equals(dep_city)&&flight_info.getArr_city().equals(arr_city)){
                        carrierbean= retnOrderService.get_carrier_info(flight_info.getCarrier_id());//获得航班信息
                        flight_infoList.add(flight_info);
                        Flight_seat flight_seat=changeflightinfo_to_flightseat(flight_info);
                        flight_seat.setCarrier_name(carrierbean.getCarrier_name());
                        for(int j=1;j<5;j++){
                            Seatbean seatbean=retnOrderService.get_seat_info(flight_id,j);
                            //然后插入到flight_seat里面去
                            flight_seat=addseattoflightinfo(flight_seat,seatbean);
                        }
                        flight_seat.setDep_date(dep_date);
                        flight_seatList.add(flight_seat);
                    }
                }
            }
            return flight_seatList;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/RetnOrder/turn_to_order")
    public ModelAndView turn_to_order(ModelAndView modelAndView, String dep_city, String arr_city,String dep_date,String arr_date,String go_dep_time,String go_arr_time,String go_dep_airport,String go_arr_airport
            ,String go_carrier_name,String go_flight_no,String go_seat_type,int go_seat_price,int go_flight_id,String back_dep_time,String back_arr_time,String back_dep_airport
    ,String back_arr_airport,String back_carrier_name,String back_flight_no,String back_seat_type,int back_seat_price,int back_flight_id){
        System.out.print("\n进入了retnorder");
        System.out.print("\n此时的arr_date为:"+arr_date);
        init(dep_city,arr_city,dep_date, arr_date,go_dep_time,go_arr_time,go_dep_airport,go_arr_airport,go_carrier_name,go_flight_no,go_seat_type,go_seat_price,go_flight_id,back_dep_time,back_arr_time,back_dep_airport
                ,back_arr_airport,back_carrier_name,back_flight_no,back_seat_type,back_seat_price, back_flight_id);
        modelAndView.addObject("order_preparebean",RetOrderinfo.getInstance());
        modelAndView.setViewName("choose_policy_ret");
        return modelAndView;
    }

    @RequestMapping("/RetnOrder/turn_to_pay")
    public ModelAndView turn_to_pay(ModelAndView modelAndView,String passenger_name,String relative_phone,String passenger_type,String psg_id,int go_flight_id,int back_flight_id){
        RetOrderinfo.getInstance().setPsg_name(passenger_name);
        RetOrderinfo.getInstance().setPsg_phone(relative_phone);
        if(passenger_type.equals("成人")){
            RetOrderinfo.getInstance().setPsg_type(1);
        }
        if(passenger_type.equals("儿童")){
            RetOrderinfo.getInstance().setPsg_type(2);
        }
        if(passenger_type.equals("婴儿")){
            RetOrderinfo.getInstance().setPsg_type(3);
        }
        RetOrderinfo.getInstance().setPsg_id(psg_id);
        RetOrderinfo.getInstance().setGo_flight_id(go_flight_id);
        RetOrderinfo.getInstance().setBack_flight_id(back_flight_id);

        modelAndView.addObject("order_info",RetOrderinfo.getInstance());//传递过去
        modelAndView.setViewName("pay_ret");
        return modelAndView;
    }

    @RequestMapping("/RetnOrder/pay_success")
    public ModelAndView pay_success(ModelAndView modelAndView){
        //插入数据库
        modelAndView.setViewName("pay_success");
        retnOrderService.insert_order_info(RetOrderinfo.getInstance());
        return modelAndView;
    }


    public void init(String dep_city, String arr_city,String dep_date,String arr_date,String go_dep_time,String go_arr_time,String go_dep_airport,String go_arr_airport
            ,String go_carrier_name,String go_flight_no,String go_seat_type,int go_seat_price,int go_flight_id,String back_dep_time,String back_arr_time,String back_dep_airport
            ,String back_arr_airport,String back_carrier_name,String back_flight_no,String back_seat_type,int back_seat_price,int back_flight_id){
         RetOrderinfo.getInstance().setDep_city(dep_city);
        RetOrderinfo.getInstance().setArr_city(arr_city);
        RetOrderinfo.getInstance().setDep_date(dep_date);
        RetOrderinfo.getInstance().setArr_date(arr_date);
        RetOrderinfo.getInstance().setGo_dep_time(go_dep_time);
        RetOrderinfo.getInstance().setGo_arr_time(go_arr_time);
        RetOrderinfo.getInstance().setGo_dep_airport(go_dep_airport);
        RetOrderinfo.getInstance().setGo_arr_airport(go_arr_airport);
        RetOrderinfo.getInstance().setGo_carrier_name(go_carrier_name);
        RetOrderinfo.getInstance().setGo_flight_no(go_flight_no);
        RetOrderinfo.getInstance().setGo_seat_price(go_seat_price);
        RetOrderinfo.getInstance().setGo_flight_id(go_flight_id);
        RetOrderinfo.getInstance().setBack_dep_time(back_dep_time);
        RetOrderinfo.getInstance().setBack_arr_time(back_arr_time);
        RetOrderinfo.getInstance().setBack_dep_airport(back_dep_airport);
        RetOrderinfo.getInstance().setBack_arr_airport(back_arr_airport);
        RetOrderinfo.getInstance().setBack_carrier_name(back_carrier_name);
        RetOrderinfo.getInstance().setBack_flight_no(back_flight_no);
        RetOrderinfo.getInstance().setBack_seat_price(back_seat_price);
        RetOrderinfo.getInstance().setBack_flight_id(back_flight_id);
        if(go_seat_type.equals("头等舱")){
            RetOrderinfo.getInstance().setGo_seat_type(1);
        }
        if(go_seat_type.equals("商务舱")){
            RetOrderinfo.getInstance().setGo_seat_type(2);
        }
        if(go_seat_type.equals("经济舱")){
            RetOrderinfo.getInstance().setGo_seat_type(3);
        }
        if(back_seat_type.equals("头等舱")){
            RetOrderinfo.getInstance().setBack_seat_type(1);
        }
        if(go_seat_type.equals("商务舱")){
            RetOrderinfo.getInstance().setBack_seat_type(2);
        }
        if(go_seat_type.equals("经济舱")){
            RetOrderinfo.getInstance().setBack_seat_type(3);
        }
        RetOrderinfo.getInstance().setUser_phone(Userinfo.getInstance().getUser_phone());
    }

    public Flight_seat changeflightinfo_to_flightseat(Flight_info flight_info){
        Flight_seat flight_seat=new Flight_seat();
        flight_seat.setAir_name(flight_info.getAir_name());
        flight_seat.setArr_airport(flight_info.getArr_airport());
        flight_seat.setArr_city(flight_info.getArr_city());
        flight_seat.setArr_time(flight_info.getArr_time());
        flight_seat.setCarrier_id(flight_info.getCarrier_id());
        flight_seat.setDep_airport(flight_info.getDep_airport());
        flight_seat.setDep_time(flight_info.getDep_time());
        flight_seat.setDep_city(flight_info.getDep_city());
        flight_seat.setFlight_id(flight_info.getFlight_id());
        flight_seat.setFlight_no(flight_info.getFlight_no());
        return flight_seat;
    }

    @RequestMapping("/RetnOrder/Turn_to_order")
    public String turn_to_order(){
        return "order_list";
    }

    public Flight_seat addseattoflightinfo(Flight_seat flight_seat,Seatbean seatbean){
        if(seatbean!=null){
            if(seatbean.getSeat_type()==1){
                //头等
                flight_seat.setSeat_price_first(seatbean.getSeat_price());
                flight_seat.setSeat_amount_first(seatbean.getSeat_amount());
            }
            if(seatbean.getSeat_type()==2){
                //商务
                flight_seat.setSeat_price_second(seatbean.getSeat_price());
                flight_seat.setSeat_amount_second(seatbean.getSeat_amount());
            }
            if(seatbean.getSeat_type()==3){
                //经济
                flight_seat.setSeat_price_third(seatbean.getSeat_price());
                flight_seat.setSeat_amount_third(seatbean.getSeat_amount());
            }
            if(seatbean.getSeat_type()==4){
                //特惠
                flight_seat.setSeat_price_fourth(seatbean.getSeat_price());
                flight_seat.setSeat_amount_fourth(seatbean.getSeat_amount());
            }
            return flight_seat;
        }
        return null;
    }

    public void init_orderinfo(String dep_city, String arr_city,String dep_date,String dep_time,String arr_time,String dep_airport,String arr_airport
            ,String carrier_name,String flight_no,String seat_type,int seat_price,String passenger_name,String relative_phone,String passenger_type,String psg_id,int flight_id){
        Orderinfo.getInstance().setDep_city(dep_city);
        Orderinfo.getInstance().setArr_city(arr_city);
        Orderinfo.getInstance().setDep_date(dep_date);
        Orderinfo.getInstance().setDep_time(dep_time);
        Orderinfo.getInstance().setArr_time(arr_time);
        Orderinfo.getInstance().setDep_airport(dep_airport);
        Orderinfo.getInstance().setArr_airport(arr_airport);
        Orderinfo.getInstance().setCarrier_name(carrier_name);
        Orderinfo.getInstance().setFlight_no(flight_no);
        if(seat_type.equals("头等舱")){
            Orderinfo.getInstance().setSeat_type(1);
        }
        if(seat_type.equals("商务舱")){
            Orderinfo.getInstance().setSeat_type(2);
        }
        if(seat_type.equals("经济舱")){
            Orderinfo.getInstance().setSeat_type(3);
        }
        Orderinfo.getInstance().setSeat_price(seat_price);
        Orderinfo.getInstance().setPsg_name(passenger_name);
        Orderinfo.getInstance().setPsg_phone(relative_phone);
        if(passenger_type.equals("成人")){
            Orderinfo.getInstance().setPsg_type(1);
        }
        if(passenger_type.equals("儿童")){
            Orderinfo.getInstance().setPsg_type(2);
        }
        if(passenger_type.equals("婴儿")){
            Orderinfo.getInstance().setPsg_type(3);
        }
        Orderinfo.getInstance().setPsg_id(psg_id);
        Orderinfo.getInstance().setFlight_id(flight_id);
        Orderinfo.getInstance().setUser_phone(Userinfo.getInstance().getUser_phone());
    }
}
