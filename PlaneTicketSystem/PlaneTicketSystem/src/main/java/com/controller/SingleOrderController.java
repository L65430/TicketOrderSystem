package com.controller;

import com.Static.Orderinfo;
import com.Static.Userinfo;
import com.bean.*;
import com.mapper.SingleOrderMapper;
import com.service.SingleOrderService;
import com.serviceimpl.SingleOrderServiceImpl;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.servlet.ModelAndView;

import javax.management.MalformedObjectNameException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class SingleOrderController {
    @Autowired
    SingleOrderServiceImpl singleOrderService;

    @RequestMapping("/singleOrder/turnToRetn")
    public String turnToRet(){
        return "RetnOrder";
    }

    //点击上方的查找按钮之后返回了航班信息，返回的是一个list
    @RequestMapping("/singleOrder/search")
    public @ResponseBody List<Flight_seat> serach(String dep_date, String dep_city, String arr_city, String carrier_id){
        //还需要得到座位
        System.out.print("传入carrier_id："+carrier_id);
        System.out.print(dep_date+" "+dep_city+" "+arr_city);
        String[] splice_list=carrier_id.split("-");
        String English_id=splice_list[0];
        System.out.print("此时id为："+English_id);
        //date是个问题
        List<Flight_uniinfo> flight_uniinfoList=singleOrderService.search_flight_id(dep_date);
        //通过遍历获取list里面的flight_id值，最后得到的结果就是一个flight_info的list,然后发送到前端显示
        List<Flight_info> flight_infoList=new ArrayList<Flight_info>();
        List<Flight_seat> flight_seatList=new ArrayList<Flight_seat>();
        List<Seatbean> seatbeanList=new ArrayList<Seatbean>();
        int flight_id;
        String carrier_name;
        Carrierbean carrierbean=new Carrierbean();
        try{
            for(int i=0;i<flight_uniinfoList.size();i++){
                flight_id=flight_uniinfoList.get(i).getFlight_id();
                Flight_info flight_info=singleOrderService.get_flight_info(flight_id);
                //此时得到了flight_info，然后开始判断,判断成功了之后插入并且返回,然后还要判断航空公司
                if(flight_info!=null){
                    if(flight_info.getDep_city()!=null&&flight_info.getArr_city()!=null){
                        if(flight_info.getDep_city().equals(dep_city)&&flight_info.getArr_city().equals(arr_city)) {
                            if(carrier_id.equals("全部航司")||English_id.equals(flight_info.getCarrier_id())){
                                System.out.print("进入这个部分");
                                carrierbean= singleOrderService.get_carrier_info(flight_info.getCarrier_id());//获得航班信息
                                flight_infoList.add(flight_info);
                                //然后获取seat信息
                                Flight_seat flight_seat=changeflightinfo_to_flightseat(flight_info);
                                flight_seat.setCarrier_name(carrierbean.getCarrier_name());
                                for(int j=1;j<5;j++){
                                  Seatbean seatbean=singleOrderService.get_seat_info(flight_id,j);
                                  //然后插入到flight_seat里面去
                                  flight_seat=addseattoflightinfo(flight_seat,seatbean);
                                }
                                flight_seat.setDep_date(dep_date);
                                flight_seatList.add(flight_seat);
                                System.out.print("此时flightid:"+flight_id);
                            }
                        }
                    }
                }
            }
        }catch (Exception e){
           e.printStackTrace();
        }
        return flight_seatList;
    }


    @RequestMapping("/singleOrder/getToday")
    public @ResponseBody List<Flight_seat> gettoday(String dep_date){
        //通过dep_date来获取当天的信息
        System.out.print("\n此时gettoday："+dep_date);
        try{
            List<Flight_uniinfo> flight_uniinfoList=singleOrderService.search_flight_id(dep_date);
            List<Flight_info> flight_infoList=new ArrayList<Flight_info>();
            List<Flight_seat> flight_seatList=new ArrayList<Flight_seat>();
            int flight_id;
            String carrier_name;
            Carrierbean carrierbean=new Carrierbean();
            System.out.print("此时的size:"+flight_uniinfoList.size());
            for(int i=0;i<flight_uniinfoList.size();i++){
                flight_id=flight_uniinfoList.get(i).getFlight_id();
                System.out.print("此时flight_id为:"+flight_id);
                Flight_info flight_info=singleOrderService.get_flight_info(flight_id);
                if(flight_info!=null){
                    carrierbean= singleOrderService.get_carrier_info(flight_info.getCarrier_id());//获得航班信息
                    flight_infoList.add(flight_info);
                    Flight_seat flight_seat=changeflightinfo_to_flightseat(flight_info);
                    flight_seat.setCarrier_name(carrierbean.getCarrier_name());
                    for(int j=1;j<5;j++){
                        Seatbean seatbean=singleOrderService.get_seat_info(flight_id,j);
                        //然后插入到flight_seat里面去
                        flight_seat=addseattoflightinfo(flight_seat,seatbean);
                    }
                    flight_seat.setDep_date(dep_date);
                    flight_seatList.add(flight_seat);
                       }
                    }
                    return flight_seatList;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/singleOrder/turn_to_order")
    public ModelAndView turn_to_order(ModelAndView modelAndView, String dep_city, String arr_city,String dep_date,String dep_time,String arr_time,String dep_airport,String arr_airport
            ,String carrier_name,String flight_no,String seat_type,String seat_price,int flight_id){
        System.out.print("进入这个函数");
       try{
           System.out.print("dep_date:"+dep_date);
           Order_preparebean order_preparebean=new Order_preparebean();
           order_preparebean=init(dep_city,arr_city,dep_date,dep_time,arr_time,dep_airport,arr_airport,carrier_name,flight_no,seat_type,seat_price,flight_id);
           modelAndView.addObject("order_preparebean",order_preparebean);
           modelAndView.setViewName("choose_policy");
       }catch (Exception e){
           e.printStackTrace();
       }
        return modelAndView;
    }


    @RequestMapping("/singleOrder/turn_to_pay")
    public ModelAndView turn_to_pay(ModelAndView modelAndView,String dep_city, String arr_city,String dep_date,String dep_time,String arr_time,String dep_airport,String arr_airport
            ,String carrier_name,String flight_no,String seat_type,int seat_price,String passenger_name,String relative_phone,String passenger_type,String psg_id,int flight_id){
        System.out.print("\n进入turntopay");
        try{
            System.out.print("\nturn_to_pay的flightid:"+flight_id);
            init_orderinfo(dep_city, arr_city,dep_date,dep_time,arr_time,dep_airport,arr_airport,carrier_name,flight_no,seat_type,seat_price,passenger_name,relative_phone,passenger_type,psg_id,flight_id);
            //然后传递过去
            modelAndView.addObject("order_info",Orderinfo.getInstance());//传递过去
            modelAndView.setViewName("pay_single");
        }catch (Exception e){
            e.printStackTrace();
        }
        return modelAndView;
    }

    @RequestMapping("/singleOrder/pay_success")
    public ModelAndView pay_success(ModelAndView modelAndView){
        //插入数据库
        modelAndView.setViewName("pay_success");
        singleOrderService.insert_order_info(Orderinfo.getInstance());
        return modelAndView;
    }

    @RequestMapping("/singleOrder/Turn_to_order")
    public String turn_to_order(){
        return "order_list";
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
    public Order_preparebean init(String dep_city, String arr_city,String dep_date,String dep_time,String arr_time,String dep_airport,String arr_airport
            ,String carrier_name,String flight_no,String seat_type,String seat_price,int flight_id){
        Order_preparebean order_preparebean=new Order_preparebean();
        order_preparebean.setDep_airport(dep_airport);
        order_preparebean.setDep_city(dep_city);
        order_preparebean.setArr_city(arr_city);
        order_preparebean.setDep_date(dep_date);
        order_preparebean.setDep_time(dep_time);
        order_preparebean.setArr_time(arr_time);
        order_preparebean.setArr_airport(arr_airport);
        order_preparebean.setCarrier_name(carrier_name);
        order_preparebean.setFlight_no(flight_no);
        order_preparebean.setSeat_type(seat_type);
        order_preparebean.setSeat_price(seat_price);
        order_preparebean.setFlight_id(flight_id);
        return order_preparebean;
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
                //特惠，为4的时候也是经济舱，特惠也是经济舱
                flight_seat.setSeat_price_fourth(seatbean.getSeat_price());
                flight_seat.setSeat_amount_fourth(seatbean.getSeat_amount());
            }
            return flight_seat;
        }
      return null;
    }

}
