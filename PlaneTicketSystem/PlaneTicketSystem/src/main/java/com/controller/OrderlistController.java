package com.controller;

import com.Static.Orderinfo;
import com.Static.Userinfo;
import com.bean.*;
import com.serviceimpl.OrderlistServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class OrderlistController {
    @Autowired
    OrderlistServiceImpl orderlistService;

    @RequestMapping("/Orderlist/get_init")
    public @ResponseBody List<Orderinfobean> get_init(){
        int order_id;
        int order_type;
        List<Mainorderbean> mainorderbeanList=orderlistService.get_main_order(Userinfo.getInstance().getUser_phone());
        List<Orderinfobean> orderinfobeanList=new ArrayList<Orderinfobean>();
        for(int i=0;i<mainorderbeanList.size();i++){
            try {
                Mainorderbean mainorderbean = mainorderbeanList.get(i);
                order_id = mainorderbean.getOrder_id();
                order_type = mainorderbean.getOrder_type();
                if (order_type == 1) {//加入到单程表里面去
                    Sgorder_info sgorder_info = orderlistService.get_sglist(order_id);
                    Passagebean passagebean = orderlistService.get_psgbean(sgorder_info.getOrder_id());
                    //然后把得到的结果都加入进去
                    Flight_info flight_info = orderlistService.get_flight_info(sgorder_info.getFlight_id());
                    Flight_uniinfo flight_uniinfo = orderlistService.get_flight_uniinfo(sgorder_info.getFlight_id());
                    //然后加入到Orderinfobean中去
                    orderinfobeanList.add(handle_sg(passagebean, flight_info, order_id, flight_uniinfo));
                }
                if (order_type == 2) {
                    List<Retnorderbean> retnorderbeanList = orderlistService.get_norderlist(order_id);
                    //会得到两条，一条是过去，一条是回来
                    Flight_info flight_info1 = orderlistService.get_flight_info(retnorderbeanList.get(0).getFlight_id());
                    Flight_info flight_info2 = orderlistService.get_flight_info(retnorderbeanList.get(1).getFlight_id());

                    Flight_uniinfo flight_uniinfo1 = orderlistService.get_flight_uniinfo(retnorderbeanList.get(0).getFlight_id());
                    Flight_uniinfo flight_uniinfo2 = orderlistService.get_flight_uniinfo(retnorderbeanList.get(1).getFlight_id());

                    Passagebean passagebean = orderlistService.get_psgbean(order_id);//这就是得到的结果
                    orderinfobeanList.add(handle_ret_go(passagebean, flight_info1, order_id, flight_uniinfo1));
                    orderinfobeanList.add(handle_ret_back(passagebean, flight_info2, order_id, flight_uniinfo2));
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return orderinfobeanList;
    }

    @RequestMapping("/Orderlist/look_detail")
    public ModelAndView get_detail(ModelAndView modelAndView,int order_id,int order_type,int order_code){
        //进入之后根据情况得到订单
        Orderinfobean orderinfobean=new Orderinfobean();
        if(order_type==1){
            Sgorder_info sgorder_info=orderlistService.get_sglist(order_id);
            Passagebean passagebean=orderlistService.get_psgbean(sgorder_info.getOrder_id());
            Flight_uniinfo flight_uniinfo=orderlistService.get_flight_uniinfo(sgorder_info.getFlight_id());
            Flight_info flight_info=orderlistService.get_flight_info(sgorder_info.getFlight_id());
            orderinfobean=handle_sg(passagebean,flight_info,order_id,flight_uniinfo);
        }
        if(order_type==2){
            try {
                System.out.print("此时的look_detai中order_id:"+order_id);
                List<Retnorderbean> retnorderbeanList = orderlistService.get_norderlist(order_id);
                System.out.print("此时的size:"+retnorderbeanList.size());
                for (int i = 0; i < retnorderbeanList.size(); i++) {
                    if (retnorderbeanList.get(i).getOrder_code() == order_code) {
                        Flight_uniinfo flight_uniinfo = orderlistService.get_flight_uniinfo(retnorderbeanList.get(i).getFlight_id());
                        Flight_info flight_info = orderlistService.get_flight_info(retnorderbeanList.get(i).getFlight_id());
                        Passagebean passagebean = orderlistService.get_psgbean(order_id);
                        if (order_code == 1) {//过去
                            orderinfobean = handle_ret_go(passagebean, flight_info, order_id, flight_uniinfo);
                        }
                        if (order_code == 2) {
                            orderinfobean = handle_ret_back(passagebean, flight_info, order_id, flight_uniinfo);
                        }
                    }
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        modelAndView.setViewName("order_detail");
        modelAndView.addObject("orderinfobean",orderinfobean);
        return modelAndView;
    }

    @RequestMapping("/Orderlist/turn_to_single")
    public String turn_to_single(){
        return "showindex";
    }

    @RequestMapping("/Orderlist/turn_to_orderlist")
    public String turn_to_orderlist(){
        return "order_list";
    }

    public Orderinfobean handle_sg(Passagebean passagebean,Flight_info flight_info,int order_id,Flight_uniinfo flight_uniinfo){
        Orderinfobean orderinfobean=new Orderinfobean();
        orderinfobean.setOrder_type(1);
        orderinfobean.setPsg_id(passagebean.getPsg_id());
        orderinfobean.setPsg_name(passagebean.getPsg_name());
        orderinfobean.setPsg_phone(passagebean.getPsg_phone());
        if(passagebean.getGo_seat_type()==1){
            orderinfobean.setSg_seat_type("头等舱");
        }
        if(passagebean.getGo_seat_type()==2){
            orderinfobean.setSg_seat_type("商务舱");
        }
        if(passagebean.getGo_seat_type()==3){
            orderinfobean.setSg_seat_type("经济舱");
        }
        orderinfobean.setSg_seat_price(passagebean.getGo_seat_price());
        orderinfobean.setSg_flight_id(flight_info.getFlight_id());
        orderinfobean.setSg_flight_no(flight_info.getFlight_no());
        orderinfobean.setSg_dep_time(flight_info.getDep_time());
        orderinfobean.setSg_arr_time(flight_info.getArr_time());
        orderinfobean.setSg_dep_airport(flight_info.getDep_airport());
        orderinfobean.setSg_dep_city(flight_info.getDep_city());
        orderinfobean.setSg_arr_airport(flight_info.getArr_airport());
        orderinfobean.setSg_arr_city(flight_info.getArr_city());
        orderinfobean.setSg_dep_date(flight_uniinfo.getDep_date());
        if(passagebean.getPsg_type()==1){
            orderinfobean.setPsg_type("成人");
        }
        if(passagebean.getPsg_type()==2){
            orderinfobean.setPsg_type("儿童");
        }
        if(passagebean.getPsg_type()==3){
            orderinfobean.setPsg_type("婴儿");
        }
        orderinfobean.setOrder_type(1);
        orderinfobean.setOrder_id(order_id);
        return orderinfobean;
    }



    public Orderinfobean handle_ret_go(Passagebean passagebean,Flight_info flight_info_go,int order_id,Flight_uniinfo flight_uniinfo){
        Orderinfobean orderinfobean=new Orderinfobean();
        orderinfobean.setPsg_id(passagebean.getPsg_id());
        orderinfobean.setPsg_name(passagebean.getPsg_name());
        orderinfobean.setPsg_phone(passagebean.getPsg_phone());
        if(passagebean.getGo_seat_type()==1){
            orderinfobean.setRet_go_seat_type("头等舱");
        }
        if(passagebean.getGo_seat_type()==2){
            orderinfobean.setRet_go_seat_type("商务舱");
        }
        if(passagebean.getGo_seat_type()==3){
            orderinfobean.setRet_go_seat_type("经济舱");
        }
        orderinfobean.setRet_go_seat_price(passagebean.getGo_seat_price());
        orderinfobean.setRet_go_flight_no(flight_info_go.getFlight_no());
        orderinfobean.setRet_go_dep_time(flight_info_go.getDep_time());
        orderinfobean.setRet_go_arr_time(flight_info_go.getArr_time());
        orderinfobean.setRet_go_dep_airport(flight_info_go.getDep_airport());
        orderinfobean.setRet_go_arr_airport(flight_info_go.getArr_airport());
        orderinfobean.setRet_dep_city(flight_info_go.getDep_city());
        orderinfobean.setRet_arr_city(flight_info_go.getArr_city());
        orderinfobean.setRet_dep_date(flight_uniinfo.getDep_date());
        if(passagebean.getPsg_type()==1){
            orderinfobean.setPsg_type("成人");
        }
        if(passagebean.getPsg_type()==2){
            orderinfobean.setPsg_type("儿童");
        }
        if(passagebean.getPsg_type()==3){
            orderinfobean.setPsg_type("婴儿");
        }
        orderinfobean.setOrder_type(2);
        orderinfobean.setOrder_id(order_id);
        orderinfobean.setOrder_code(1);//表示过去
        return orderinfobean;
    }

    public Orderinfobean handle_ret_back(Passagebean passagebean,Flight_info flight_info_back,int order_id,Flight_uniinfo flight_uniinfo){
        Orderinfobean orderinfobean=new Orderinfobean();
        orderinfobean.setOrder_type(2);
        orderinfobean.setPsg_id(passagebean.getPsg_id());
        orderinfobean.setPsg_name(passagebean.getPsg_name());
        orderinfobean.setPsg_phone(passagebean.getPsg_phone());
        if(passagebean.getBack_seat_type()==1){
            orderinfobean.setRet_back_seat_type("头等舱");
        }
        if(passagebean.getBack_seat_type()==2){
            orderinfobean.setRet_back_seat_type("商务舱");
        }
        if(passagebean.getBack_seat_type()==3){
            orderinfobean.setRet_back_seat_type("经济舱");
        }
        orderinfobean.setRet_back_seat_price(passagebean.getBack_seat_price());
        orderinfobean.setRet_back_flight_no(flight_info_back.getFlight_no());
        orderinfobean.setRet_back_dep_time(flight_info_back.getDep_time());
        orderinfobean.setRet_back_arr_time(flight_info_back.getArr_time());
        orderinfobean.setRet_back_dep_airport(flight_info_back.getDep_airport());
        orderinfobean.setRet_back_arr_airport(flight_info_back.getArr_airport());
        orderinfobean.setRet_dep_city(flight_info_back.getDep_city());
        orderinfobean.setRet_arr_city(flight_info_back.getArr_city());
        orderinfobean.setRet_arr_date(flight_uniinfo.getDep_date());
        if(passagebean.getPsg_type()==1){
            orderinfobean.setPsg_type("成人");
        }
        if(passagebean.getPsg_type()==2){
            orderinfobean.setPsg_type("儿童");
        }
        if(passagebean.getPsg_type()==3){
            orderinfobean.setPsg_type("婴儿");
        }
        orderinfobean.setOrder_type(2);
        orderinfobean.setOrder_id(order_id);
        orderinfobean.setOrder_code(2);//表示回来
        return orderinfobean;
    }
}
