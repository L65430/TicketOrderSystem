<%@ page import="com.Static.Userinfo" %><%--
  Created by IntelliJ IDEA.
  User: L
  Date: 2018/3/18
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html lang="zh-CN">
<script src="http://cdn.static.runoob.com/libs/jquery/1.10.2/jquery.min.js"></script>
<head>

    <meta charset="utf-8">
    <!-- IE 浏览器运行最新的渲染模式-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 启用响应式特性 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 双核使用webkit内核 -->
    <meta name="renderer" content="webkit">
    <title>订单列表</title>
    <link href="../../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../../css/common.css" rel="stylesheet">
    <link href="../../../css/corptravel.css" rel="stylesheet">
    <link href="../../../css/enterprise.css" rel="stylesheet">
    <!-- IconFont图标 -->
    <link href="../../../css/iconfont.css" rel="stylesheet">
    <script type="text/javascript" src="../../../js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../../../js/bootstrap.min.js"></script>
    <!-- 兼容IE8 -->
    <!--[if lte IE 9]>
    <script type="text/javascript" src="../../js/html5shiv.min.js"></script>
    <script type="text/javascript" src="../../js/respond.min.js"></script>
    <![endif]-->
    <!-- layer弹框 2.1 -->
    <script type="text/javascript" src="../../../js/layer/layer.js"></script>

    <style>
        .tabs { width:35px; padding:3px; ; background-color:#db514f; color:#fff; text-align:center; margin-top:2px; margin-bottom:2px; border-radius:3px; }
        .startbox { overflow:hidden; margin-bottom:5px; }
        .start { float:left; background-color:#f9a60a; padding:2px; color:#fff; border-radius:2px; margin-right:5px; }
        .destination { float:left; background-color:#0096de; padding:2px; color:#fff; border-radius:2px; margin-right:5px; }
        .startcity { float:left; font-size:12px; color:#666; }
        .startcity span { font-size:14px; color:#000; font-weight:bold; }
        .destination1 {float:left; background-color:#0096de; padding:2px; color:#fff; border-radius:2px; margin-right:5px; }
        .destination2 {float:left; background-color:#0096de; padding:2px; color:#fff; border-radius:2px; margin-right:5px; }
    </style>
    
    <script>
        var flight_info_list=new Array()
        $(function () {
            $("#order_id1").hide()
            $("#order_id2").hide()
            $("#order_code1").hide()
            $("#order_code2").hide()
        })

        function empty_all() {
            $("#dep_time").val(" ")
            $("#dep_date").val(" ")
            $("#arr_date").val(" ")
            $("#order_id").val(" ")
            $("#dep_city").val(" ")
            $("#arr_city").val(" ")
            $("#psg_name").val(" ")
            $("#flight_no"),val(" ")
            $("#order_id").val(" ")
        }


        function change_to_next() {
            //先全部显示
            for(var i=1;i<5;i++){
                $('#turn_page li').eq(i).show()
            }
            console.log("进入了")
            console.log("flight_info_list在next函数中:"+flight_info_list.length);
            var get_length=flight_info_list.length;
            var number1= $("#turn_page li:eq(1)").text()
            var number2= $("#turn_page li:eq(2)").text()
            var number3= $("#turn_page li:eq(3)").text()
            var number4= $("#turn_page li:eq(4)").text()
            var number5= $("#turn_page li:eq(5)").text()
            var number1_change=Number(number1)+5;
            if(number1_change<=get_length){
                var number1_final=number1_change.toString();
                $("#turn_page li:eq(1) a").text(number1_final)//注意还有个a啊！！！
            }

            var number2_change=Number(number2)+5;
            if(number2_change<=get_length){
                var number2_final=number2_change.toString();
                $("#turn_page li:eq(2) a").text(number2_final)//注意还有个a啊！！！
            }else{
                if(number1_change<=get_length){
                    $("#turn_page li:eq(2) ").hide();
                }
            }

            var number3_change=Number(number3)+5;
            if(number3_change<=get_length){
                var number3_final=number3_change.toString();
                $("#turn_page li:eq(3) a").text(number3_final)
            }else{
                if(number1_change<=get_length){
                    $("#turn_page li:eq(3) ").hide();
                }
            }

            var number4_change=Number(number4)+5;
            if(number4_change<=get_length){
                var number4_final=number4_change.toString();
                $("#turn_page li:eq(4) a").text(number4_final)
            }else{
                if(number1_change<=get_length){
                    $("#turn_page li:eq(4) ").hide();
                }
            }


            var number5_change=Number(number5)+5;
            if(number4_change<=get_length){
                var number5_final=number5_change.toString();
                $("#turn_page li:eq(5) a").text(number5_final)
            }else{
                if(number1_change<=get_length){
                    $("#turn_page li:eq(5) ").hide();
                }
            }
        }

        //翻到上面的
        function change_to_before() {
            var number1= $("#turn_page li:eq(1)").text()
            var number2= $("#turn_page li:eq(2)").text()
            var number3= $("#turn_page li:eq(3)").text()
            var number4= $("#turn_page li:eq(4)").text()
            var number5= $("#turn_page li:eq(5)").text()
            var number1_change=Number(number1)-5;
            if(number1_change>=1){
                var number1_final=number1_change.toString();
                $("#turn_page li:eq(1) a").text(number1_final)//注意还有个a啊！！！
            }

            var number2_change=Number(number2)-5;
            if(number2_change>=1){
                var number2_final=number2_change.toString();
                $("#turn_page li:eq(2) a").text(number2_final)
            }

            var number3_change=Number(number3)-5;
            if(number3_change>=1){
                var number3_final=number3_change.toString();
                $("#turn_page li:eq(3) a").text(number3_final)
            }

            var number4_change=Number(number4)-5;
            if(number4_change>=1){
                var number4_final=number4_change.toString();
                $("#turn_page li:eq(4) a").text(number4_final)
            }

            var number5_change=Number(number5)-5;
            if(number5_change>=1){
                var number5_final=number5_change.toString();
                $("#turn_page li:eq(5) a").text(number5_final)
            }

            //后退的时候全部都要显示出来
            for(var i=1;i<5;i++){
                $("#turn_page li").eq(i).show()
            }
        }

        //进来之后先获取当前的页数
        function get_page_number(input_flight_list) {
            //进来之后先显示
            for(var i=1;i<=5;i++){
                $("#turn_page li a").eq(i).show()
            }
            var list_length=input_flight_list.length;
            var page_number
            if(list_length%2==1){
                page_number=(list_length+1)/2;
            }else{
                page_number=list_length/2;
            }
            if(page_number<5){
                console.log("进入这个环节")
                console.log("page number:"+page_number)
                for(var i=page_number;i<5;i++){
                    $("#turn_page li a").eq(i+1).hide()
                }
            }else{
                for(var i=1;i<=5;i++){
                    $("#turn_page li a").eq(i).show()
                }
                //然后要设置好
            }
        }


        //进入之后自动查找当前用户下了什么订单，根据这个用户的id来定
        $(function () {
           //输入的是
            //获取当天情况成功
            var user_phone='<%=Userinfo.getInstance().getUser_phone()%>'
            $.ajax({
                url:"<%=basePath%>Orderlist/get_init",
                data:{"user_phone":user_phone},
                success:function(resp){
                    console.log("进入获取当天信息界面,order_list")
                    console.log(resp)
                    //进入之后就获取当天情况
                    flight_info_list.length=0;
                    flight_info_list=resp
                    $("#first_recording").show()
                    $("#second_recording").show()
                    var final_flight_list=new Array()
                    if(flight_info_list.length!=0){
                        get_page_number(flight_info_list)
                        if(flight_info_list.length<=2){
                            setall(flight_info_list)
                        }else{
                            final_flight_list.push(flight_info_list[0])
                            final_flight_list.push(flight_info_list[1])
                            setall(final_flight_list)
                        }
                    }else{
                        $("#first_recording").hide()
                        $("#second_recording").hide()
                    }
                }
            })
        })

        //设置所有的
        function  setall(input_flight_info) {
            console.log("input_flight_info:"+input_flight_info)
            var order_code;
            var order_id;
            var order_type;//表示是往还是返
            var user_phone;//当前登录的用户是谁
            var sg_flight_id;//单程的flight_id
            var ret_go_flight_id;
            var ret_back_flight_id;

            //乘客信息
            var psg_id;
            var psg_name;
            var psg_phone;
            var psg_type;//数据库里是1,2,3，要做一下处理传回去

            //航班信息
            var sg_dep_city;
            var sg_arr_city;

            var ret_dep_city;//以去程为标准
            var ret_arr_city;

            var sg_flight_no;
            var ret_go_flight_no;
            var ret_back_flight_no;

            var sg_seat_type;//去的时候的seat_type;
            var ret_go_seat_type;
            var ret_back_seat_type;

            var sg_dep_airport;
            var ret_go_dep_airport;
            var ret_go_arr_airport;

            var sg_arr_airport;
            var ret_back_dep_airport;
            var ret_back_arr_airport;

            var sg_dep_date;
            var ret_dep_date;//去的那天
            var ret_arr_date;//回来的那天

            var sg_dep_time;
            var sg_arr_time;
            var ret_go_dep_time;
            var ret_go_arr_time;
            var ret_back_dep_time;
            var ret_back_arr_time;

            var sg_seat_price;
            var ret_go_seat_price;
            var ret_back_seat_price;


            if(input_flight_info.length==1){//只有一条
                 order_type=input_flight_info[0]["order_type"]
                if(order_type==1){//表示是单程
                   sg_flight_id=input_flight_info[0]['sg_flight_id']
                   order_id=input_flight_info[0]['order_id']
                   psg_name=input_flight_info[0]['psg_name']
                   sg_seat_type=input_flight_info[0]['sg_seat_type']
                   sg_dep_city=input_flight_info[0]['sg_dep_city']
                   sg_dep_airport=input_flight_info[0]['sg_dep_airport']
                   sg_dep_time=input_flight_info[0]['sg_dep_time']
                   sg_arr_time=input_flight_info[0]['sg_arr_time']
                   sg_arr_city=input_flight_info[0]['sg_arr_city']
                   sg_arr_airport=input_flight_info[0]['sg_arr_airport']
                   sg_arr_time=input_flight_info[0]['sg_arr_time']
                   sg_seat_price=input_flight_info[0]['sg_seat_price']
                    order_code=input_flight_info[0]['order_code']
                    sg_dep_date=input_flight_info[0]['sg_dep_date']
                   //设置
                   $("#psg_name1").text(psg_name)
                   $("#flight_no1").text(sg_flight_no)
                   $("#seat_type1").text(sg_seat_type)
                   $("#dep_city_airport_date_time1").html("<span>"+sg_dep_city
                   +"</span>"+sg_dep_airport+"<br/>"+sg_dep_date+" "+sg_dep_time)
                    $("#arr_city_airport_date_time1").html("<span>"+sg_arr_city
                        +"</span>"+sg_arr_airport+"<br/>"+sg_dep_date+" "+sg_arr_time)
                    $("#seat_price1").text(sg_seat_price)
                    $("#order_type1").text("单程")
                    $("#order_id1").text(order_id)
                    $("#order_code1").text(order_code)
                }
                if(order_type==2){
                    //往返
                    order_code=input_flight_info[0]['order_code']
                    if(order_code==1){
                        //表示过去
                        order_id=input_flight_info[0]['order_id']
                        psg_name=input_flight_info[0]['psg_name']
                        ret_go_flight_id=input_flight_info[0]['ret_go_flight_id']
                        ret_dep_city=input_flight_info[0]['ret_dep_city']
                        ret_arr_city=input_flight_info[0]['ret_arr_city']
                        ret_go_flight_no=input_flight_info[0]['ret_go_flight_no']
                        ret_go_seat_type=input_flight_info[0]['ret_go_seat_type']
                        ret_go_dep_airport=input_flight_info[0]['ret_go_dep_airport']
                        ret_go_arr_airport=input_flight_info[0]['ret_go_arr_airport']
                        ret_dep_date=input_flight_info[0]['ret_dep_date']
                        ret_go_dep_time=input_flight_info[0]['ret_go_dep_time']
                        ret_go_arr_time=input_flight_info[0]['ret_go_arr_time']
                        ret_go_seat_price=input_flight_info[0]['ret_go_seat_price']

                        //就是表示过去
                        $("#psg_name1").text(psg_name)
                        $("#flight_no1").text(ret_go_flight_no)
                        $("#seat_type1").text(ret_go_seat_type)
                        $("#dep_city_airport_date_time1").html("<span>"+ret_dep_city
                            +"</span>"+ret_go_dep_airport+"<br/>"+ret_dep_date+" "+ret_go_dep_time)
                        $("#arr_city_airport_date_time1").html("<span>"+ret_arr_city
                            +"</span>"+ret_go_arr_airport+"<br/>"+ret_dep_date+" "+ret_go_arr_time)
                        $("#seat_price1").text(ret_go_seat_price)
                        $("#order_type1").text("往返")
                        $("#order_id1").text(order_id)
                        $("#order_code1").text(order_code)
                    }
                    if(order_code==2){
                        order_id=input_flight_info[0]['order_id']
                        psg_name=input_flight_info[0]['psg_name']
                        ret_back_flight_id=input_flight_info[0]['ret_back_flight_id']
                        ret_dep_city=input_flight_info[0]['ret_dep_city']
                        ret_arr_city=input_flight_info[0]['ret_arr_city']
                        ret_back_flight_no=input_flight_info[0]['ret_back_flight_no']
                        ret_back_seat_type=input_flight_info[0]['ret_back_seat_type']
                        ret_back_dep_airport=input_flight_info[0]['ret_back_dep_airport']
                        ret_back_arr_airport=input_flight_info[0]['ret_back_arr_airport']
                        ret_arr_date=input_flight_info[0]['ret_arr_date']
                        ret_back_dep_time=input_flight_info[0]['ret_back_dep_time']
                        ret_back_arr_time=input_flight_info[0]['ret_back_arr_time']
                        ret_back_seat_price=input_flight_info[0]['ret_back_seat_price']

                        //就是表示过去
                        $("#psg_name1").text(psg_name)
                        $("#flight_no1").text(ret_back_flight_no)
                        $("#seat_type1").text(ret_back_seat_type)
                        $("#dep_city_airport_date_time1").html("<span>"+ret_dep_city
                            +"</span>"+ret_back_dep_airport+"<br/>"+ret_arr_date+" "+ret_back_dep_time)
                        $("#arr_city_airport_date_time1").html("<span>"+ret_arr_city
                            +"</span>"+ret_back_arr_airport+"<br/>"+ret_arr_date+" "+ret_back_arr_time)
                        $("#seat_price1").text(ret_back_seat_price)
                        $("#order_type1").text("往返")
                        $("#order_id1").text(order_id)
                        $("#order_code1").text(order_code)
                    }
                }
                $("#second_recording").hide();
            }

            if(input_flight_info.length==2){//只有一条
                $("#second_recording").show();
                order_type=input_flight_info[0]["order_type"]
                if(order_type==1){//表示是单程
                    sg_flight_id=input_flight_info[0]['sg_flight_id']
                    order_id=input_flight_info[0]['order_id']
                    psg_name=input_flight_info[0]['psg_name']
                    sg_seat_type=input_flight_info[0]['sg_seat_type']
                    sg_dep_city=input_flight_info[0]['sg_dep_city']
                    sg_dep_airport=input_flight_info[0]['sg_dep_airport']
                    sg_dep_time=input_flight_info[0]['sg_dep_time']
                    sg_arr_time=input_flight_info[0]['sg_arr_time']
                    sg_arr_city=input_flight_info[0]['sg_arr_city']
                    sg_arr_airport=input_flight_info[0]['sg_arr_airport']
                    sg_arr_time=input_flight_info[0]['sg_arr_time']
                    sg_seat_price=input_flight_info[0]['sg_seat_price']
                    order_code=input_flight_info[0]['order_code']
                    sg_dep_date=input_flight_info[0]['sg_dep_date']

                    //设置
                    $("#psg_name1").text(psg_name)
                    $("#flight_no1").text(sg_flight_no)
                    $("#seat_type1").text(sg_seat_type)
                    $("#dep_city_airport_date_time1").html("<span>"+sg_dep_city
                        +"</span>"+sg_dep_airport+"<br/>"+sg_dep_date+" "+sg_dep_time)
                    $("#arr_city_airport_date_time1").html("<span>"+sg_arr_city
                        +"</span>"+sg_arr_airport+"<br/>"+sg_dep_date+" "+sg_arr_time)
                    $("#seat_price1").text(sg_seat_price)
                    $("#order_type1").text("单程")
                    $("#order_id1").text(order_id)
                    $("#order_code1").text(order_code)
                }
                if(order_type==2){
                    //往返
                    order_code=input_flight_info[0]['order_code']
                    if(order_code==1){
                        //表示过去
                        order_id=input_flight_info[0]['order_id']
                        psg_name=input_flight_info[0]['psg_name']
                        ret_go_flight_id=input_flight_info[0]['ret_go_flight_id']
                        ret_dep_city=input_flight_info[0]['ret_dep_city']
                        ret_arr_city=input_flight_info[0]['ret_arr_city']
                        ret_go_flight_no=input_flight_info[0]['ret_go_flight_no']
                        ret_go_seat_type=input_flight_info[0]['ret_go_seat_type']
                        ret_go_dep_airport=input_flight_info[0]['ret_go_dep_airport']
                        ret_go_arr_airport=input_flight_info[0]['ret_go_arr_airport']
                        ret_dep_date=input_flight_info[0]['ret_dep_date']
                        ret_go_dep_time=input_flight_info[0]['ret_go_dep_time']
                        ret_go_arr_time=input_flight_info[0]['ret_go_arr_time']
                        ret_go_seat_price=input_flight_info[0]['ret_go_seat_price']

                        //就是表示过去
                        $("#psg_name1").text(psg_name)
                        $("#flight_no1").text(ret_go_flight_no)
                        $("#seat_type1").text(ret_go_seat_type)
                        $("#dep_city_airport_date_time1").html("<span>"+ret_dep_city
                            +"</span>"+ret_go_dep_airport+"<br/>"+ret_dep_date+" "+ret_go_dep_time)
                        $("#arr_city_airport_date_time1").html("<span>"+ret_arr_city
                            +"</span>"+ret_go_arr_airport+"<br/>"+ret_dep_date+" "+ret_go_arr_time)
                        $("#seat_price1").text(ret_go_seat_price)
                        $("#order_type1").text("往返")
                        $("#order_id1").text(order_id)
                        $("#order_code1").text(order_code)
                    }
                    if(order_code==2){
                        order_id=input_flight_info[0]['order_id']
                        psg_name=input_flight_info[0]['psg_name']
                        ret_back_flight_id=input_flight_info[0]['ret_back_flight_id']
                        ret_dep_city=input_flight_info[0]['ret_dep_city']
                        ret_arr_city=input_flight_info[0]['ret_arr_city']
                        ret_back_flight_no=input_flight_info[0]['ret_back_flight_no']
                        ret_back_seat_type=input_flight_info[0]['ret_back_seat_type']
                        ret_back_dep_airport=input_flight_info[0]['ret_back_dep_airport']
                        ret_back_arr_airport=input_flight_info[0]['ret_back_arr_airport']
                        ret_arr_date=input_flight_info[0]['ret_arr_date']
                        ret_back_dep_time=input_flight_info[0]['ret_back_dep_time']
                        ret_back_arr_time=input_flight_info[0]['ret_back_arr_time']
                        ret_back_seat_price=input_flight_info[0]['ret_back_seat_price']

                        //就是表示过去
                        $("#psg_name1").text(psg_name)
                        $("#flight_no1").text(ret_back_flight_no)
                        $("#seat_type1").text(ret_back_seat_type)
                        $("#dep_city_airport_date_time1").html("<span>"+ret_dep_city
                            +"</span>"+ret_back_dep_airport+"<br/>"+ret_arr_date+" "+ret_back_dep_time)
                        $("#arr_city_airport_date_time1").html("<span>"+ret_arr_city
                            +"</span>"+ret_back_arr_airport+"<br/>"+ret_arr_date+" "+ret_back_arr_time)
                        $("#seat_price1").text(ret_back_seat_price)
                        $("#order_type1").text("往返")
                        $("#order_id1").text(order_id)
                        $("#order_code1").text(order_code)
                    }
                }


                //第二部分
                order_type=input_flight_info[1]["order_type"]
                if(order_type==1){//表示是单程
                    order_id=input_flight_info[1]['order_id']
                    sg_flight_id=input_flight_info[1]['sg_flight_id']
                    order_id=input_flight_info[1]['order_id']
                    psg_name=input_flight_info[1]['psg_name']
                    sg_seat_type=input_flight_info[1]['sg_seat_type']
                    sg_dep_city=input_flight_info[1]['sg_dep_city']
                    sg_dep_airport=input_flight_info[1]['sg_dep_airport']
                    sg_dep_time=input_flight_info[1]['sg_dep_time']
                    sg_arr_time=input_flight_info[1]['sg_arr_time']
                    sg_arr_city=input_flight_info[1]['sg_arr_city']
                    sg_arr_airport=input_flight_info[1]['sg_arr_airport']
                    sg_arr_time=input_flight_info[1]['sg_arr_time']
                    sg_seat_price=input_flight_info[1]['sg_seat_price']
                    sg_dep_date=input_flight_info[1]['sg_dep_date']

                    //设置
                    $("#psg_name2").text(psg_name)
                    $("#flight_no2").text(sg_flight_no)
                    $("#seat_type2").text(sg_seat_type)
                    $("#dep_city_airport_date_time2").html("<span>"+sg_dep_city
                        +"</span>"+sg_dep_airport+"<br/>"+sg_dep_date+" "+sg_dep_time)
                    $("#arr_city_airport_date_time2").html("<span>"+sg_arr_city
                        +"</span>"+sg_arr_airport+"<br/>"+sg_dep_date+" "+sg_arr_time)
                    $("#seat_price2").text(sg_seat_price)
                    $("#order_type2").text("单程")
                    $("#order_id2").text(order_id)
                    $("#order_code2").text(order_code)
                }
                if(order_type==2){
                    //往返
                    order_code=input_flight_info[1]['order_code']
                    if(order_code==1){
                        //表示过去
                        order_id=input_flight_info[1]['order_id']
                        psg_name=input_flight_info[1]['psg_name']
                        ret_go_flight_id=input_flight_info[1]['ret_go_flight_id']
                        ret_dep_city=input_flight_info[1]['ret_dep_city']
                        ret_arr_city=input_flight_info[1]['ret_arr_city']
                        ret_go_flight_no=input_flight_info[1]['ret_go_flight_no']
                        ret_go_seat_type=input_flight_info[1]['ret_go_seat_type']
                        ret_go_dep_airport=input_flight_info[1]['ret_go_dep_airport']
                        ret_go_arr_airport=input_flight_info[1]['ret_go_arr_airport']
                        ret_dep_date=input_flight_info[1]['ret_dep_date']
                        ret_go_dep_time=input_flight_info[1]['ret_go_dep_time']
                        ret_go_arr_time=input_flight_info[1]['ret_go_arr_time']
                        ret_go_seat_price=input_flight_info[1]['ret_go_seat_price']

                        //就是表示过去
                        $("#psg_name2").text(psg_name)
                        $("#flight_no2").text(ret_go_flight_no)
                        $("#seat_type2").text(ret_go_seat_type)
                        $("#dep_city_airport_date_time2").html("<span>"+ret_dep_city
                            +"</span>"+ret_go_dep_airport+"<br/>"+ret_dep_date+" "+ret_go_dep_time)
                        $("#arr_city_airport_date_time2").html("<span>"+ret_arr_city
                            +"</span>"+ret_go_arr_airport+"<br/>"+ret_dep_date+" "+ret_go_arr_time)
                        $("#seat_price2").text(ret_go_seat_price)
                        $("#order_type2").text("往返")
                        $("#order_id2").text(order_id)
                        $("#order_code2").text(order_code)
                    }
                    if(order_code==2){
                        order_id=input_flight_info[1]['order_id']
                        psg_name=input_flight_info[1]['psg_name']
                        ret_back_flight_id=input_flight_info[1]['ret_back_flight_id']
                        ret_dep_city=input_flight_info[1]['ret_dep_city']
                        ret_arr_city=input_flight_info[1]['ret_arr_city']
                        ret_back_flight_no=input_flight_info[1]['ret_back_flight_no']
                        ret_back_seat_type=input_flight_info[1]['ret_back_seat_type']
                        ret_back_dep_airport=input_flight_info[1]['ret_back_dep_airport']
                        ret_back_arr_airport=input_flight_info[1]['ret_back_arr_airport']
                        ret_arr_date=input_flight_info[1]['ret_arr_date']
                        ret_back_dep_time=input_flight_info[1]['ret_back_dep_time']
                        ret_back_arr_time=input_flight_info[1]['ret_back_arr_time']
                        ret_back_seat_price=input_flight_info[1]['ret_back_seat_price']

                        //就是表示过去
                        $("#psg_name2").text(psg_name)
                        $("#flight_no2").text(ret_back_flight_no)
                        $("#seat_type2").text(ret_back_seat_type)
                        $("#dep_city_airport_date_time2").html("<span>"+ret_dep_city
                            +"</span>"+ret_back_dep_airport+"<br/>"+ret_arr_date+" "+ret_back_dep_time)
                        $("#arr_city_airport_date_time2").html("<span>"+ret_arr_city
                            +"</span>"+ret_back_arr_airport+"<br/>"+ret_arr_date+" "+ret_back_arr_time)
                        $("#seat_price2").text(ret_back_seat_price)
                        $("#order_type2").text("往返")
                        $("#order_id2").text(order_id)
                        $("#order_code2").text(order_code)
                    }
                }
            }
        }


        $(function () {
            $("#turn_page li").click(function () {
                var id=$(this).attr("id")
                console.log("此时id为："+id)
                if(id!="next"&&id!="before") {
                    $("#first_recording").show()
                    $("#second_recording").show()
                    var final_flight_list=new Array()
                    var result_number=$(this).text()
                    var final_result_number=Number(result_number)
                    //得到当前页面显示的一条或者两条
                    //都要先判断传入进来的不是空的
                    if(flight_info_list.length!=0){
                        var total_length=flight_info_list.length;
                        //最后一页只有1个记录
                        if(total_length<final_result_number*2){
                            $("#second_recording").hide()//把第二项记录隐藏掉
                            final_flight_list.length=0;//清空数组
                            final_flight_list.push(flight_info_list[final_result_number*2-2])
                            setall(final_flight_list);
                            //获取之后要在界面上显示出来
                        }else{
                            $("#second_recording").show();
                            final_flight_list.length=0;
                            final_flight_list.push(flight_info_list[final_result_number*2-2])
                            final_flight_list.push(flight_info_list[final_result_number*2-1])
                            setall(final_flight_list);
                            //获取之后在界面上显示两个结果
                        }
                    }else{
                        $("#first_recording").hide()
                        $("#second_recording").hide()
                    }
                }
            })
        })


        $(function () {
            var order_id;
            var order_type;
            var order_code;//表示往返
            $("#look_detail1").click(function () {
                console.log("进入了look_detail")
                //把1中的两个传过去
                order_id=$("#order_id1").text()
                order_type=$("#order_type1").text()
                if(order_type=='单程'){
                    order_type=1
                }else{
                    order_type=2
                }
                console.log("order_id:"+order_id)
                console.log("order_type:"+order_type)
                order_code=$("#order_code1").text()
                console.log("order_code:"+order_code)
                var url="<%=basePath%>Orderlist/look_detail"
                //然后把消息传过去
                var urlfinal=url+"?"+"order_id="+order_id+"&order_type="+order_type+"&order_code="+order_code
                window.location.href=urlfinal
            })
            $("#look_detail2").click(function () {
                //把1中的两个传过去
                order_id=$("#order_id2").text()
                order_type=$("#order_type2").text()
                if(order_type=='单程'){
                    order_type=1
                }else{
                    order_type=2
                }
                order_code=$("#order_code2").text()
                var url="<%=basePath%>Orderlist/look_detail"
                //然后把消息传过去
                var urlfinal=url+"?"+"order_id="+order_id+"&order_type="+order_type+"&order_code="+order_code
                window.location.href=urlfinal
            })
        })

    </script>
</head>
<body class="bg-body">
<!-- header -->
<nav class="navbar navbar-default navbar-fixed-top bg-white" >
    <!-- 小导航 -->
    <nav class="navbar navbar-default" style=" min-height:30px; line-height:30px; margin-bottom:0px; border-radius:0;">
        <div class="container font12">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- <span style=" margin-left:-15px; margin-right:20px;">企业商旅管理</span>-->
            </div>
            <ul class="nav navbar-nav nav-top-small" style="margin-left:-15px;" >
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%="您好, "+(Userinfo.getInstance().getUser_name())%> <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="../系统管理/修改密码.html">修改密码</a></li>
                        <li><a href="#">退出</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right nav-top-small">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="icon iconfont font14 " style=" vertical-align:middle;"  >&#xe62b;</i> 028-12345678 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">（或）028-12345678</a></li>
                        <li><a href="#">（或）028-12345678</a></li>
                        <!--<li role="separator" class="divider"></li>-->
                    </ul>
                </li>

            </ul>
            <ul class="nav navbar-nav navbar-right nav-top-small">
                <li><a href="../帮助中心/help.html">帮助中心</a></li>

            </ul>
        </div>
    </nav>
    <!-- 小导航结束 -->

    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class=" " href="差旅报告/汇总.html" ><img src="/images/logo2.png" width="210" height="70" alt="系统LOGO" class="pull-left mar-right-30" style="margin-left:-15px;" ></a>
            <!--<h4 class="navbar-brand font24" >成都万里行科技发展有限公司</h4>-->
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li  ><a href="<%=basePath%>Orderlist/turn_to_single"><i class="icon iconfont icon-nav-block font24" >&#xe620;</i> 在线预订</a></li>
                <li class="active"><a href="<%=basePath%>/Orderlist/turn_to_orderlist"><i class="icon iconfont icon-nav-block font24" >&#xe61c;</i> 订单管理</a></li>

            </ul>
        </div><!-- /.navbar-collapse -->

    </div>
</nav>
<!-- header end -->
<!-- 管理模板 -->
<div class="container bg-gray-eee box-shadow mar-bottom-30" style="padding-right:0px; padding-left:0px; position:relative; margin-top:120px;">

    <!-- main -->
    <div class="rightCon" style="">
        <!-- 引导 -->
        <ol class="breadcrumb">
            <li>首页</li>
            <li>订单管理</li>
            <li class="active">订单列表</li>
        </ol>
        <p style="text-align: center">
            <img src="/images/order_list.gif" >
        </p>

        <!-- 引导结束 -->
        <%--<div class="row">--%>
            <%--<div class="col-sm-4">--%>
                <%--<div class="form-group">--%>
                    <%--<label for="flight_no" class="w90 text-right">航班号</label>--%>
                    <%--<input type="text" class="form-control input-sm" style=" width:200px; display:inline-block;" id="flight_no" placeholder="number">--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="row">--%>
            <%--<div class="col-sm-4">--%>
                <%--<div class="form-group">--%>
                    <%--<label for="dep_time" class="w90 text-right">起飞日期</label>--%>
                    <%--<input type="text" class="form-control input-sm" style=" width:90px; display:inline-block;" id="dep_time" placeholder="日期">--%>
                    <%--&nbsp;至&nbsp;--%>
                    <%--<input type="text" class="form-control input-sm" style=" width:90px; display:inline-block;" id="arr_time" placeholder="日期">--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="col-sm-4">--%>
                <%--<div class="form-group">--%>
                    <%--<label for="order_id" class="w90 text-right">订单编号</label>--%>
                    <%--<input type="text" class="form-control input-sm" style=" width:200px; display:inline-block;" id="order_id" placeholder="number">--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="row">--%>
            <%--&lt;%&ndash;<div class="col-sm-4">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<label for="dep_city" class="w90 text-right">起降城市</label>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<input type="text" class="form-control input-sm" style=" width:90px; display:inline-block;" id="dep_city" placeholder="城市">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;&nbsp;至&nbsp;&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<input type="text" class="form-control input-sm" style=" width:90px; display:inline-block;" id="arr_city" placeholder="城市">&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="col-sm-4">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<label for="psg_name" class="w90 text-right">乘机人</label>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<input type="text" class="form-control input-sm" style=" width:200px; display:inline-block;" id="psg_name" placeholder="姓名">&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

        <%--</div>--%>
        <!--<div class="form-group">
              <label class="sr-only" for="apdiv">联系人</label>
              <input type="text" class="form-control" style=" width:100px;" id="" placeholder="联系人姓名">
            </div>
            <div class="form-group">
              <label class="sr-only" for="apdiv">联系电话</label>
              <input type="text" class="form-control" style=" width:120px;" id="" placeholder="联系电话">
            </div>-->
        <%--<div class="text-center mar-top-10 bor-top-solid-1 pad-top-10 mar-bottom-10">--%>
            <%--<button type="submit" class="btn btn-danger btn-sm mar-right-20">查询</button>--%>
            <%--<button type="submit" class="btn btn-default btn-sm mar-right-20" onclick="empty_all()">清空条件</button>--%>
        <%--</div>--%>
        <table border="0" cellspacing="0" cellpadding="0" class="table table-hover table-striped font12 table-bordered v-align-top" >
            <tr >
                <th>乘机人</th>
                <th>航班号</th>
                <th>舱位</th>
                <th>起飞行程</th>
                <th>到达行程</th>
                <th>结算总价</th>
                <th style="width:65px;">行程类型</th>
                <th>操作</th>
            </tr>
            <tr id="first_recording">
                <td id="psg_name1"><p>荣思佳</p>
                    <p>李冬阳</p></td>
                <td id="flight_no1">3U8825</td>
                <td id="seat_type1">经济舱</td>
                <td><div class="startbox">

                    <div class="startcity" id="dep_city_airport_date_time1"><span>三亚</span> 凤凰国际机场<br/>
                        2015-12-20&nbsp;&nbsp;11:45:00</div>
                </div></td>
                <td><div class="startbox">

                    <div class="startcity"id="arr_city_airport_date_time1"><span>哈尔滨</span> 太平国际机场<br/>
                        2015-12-20&nbsp;&nbsp;14:45:00</div>
                </div></td>
                <td id="seat_price1">1350.00</td>
                <td id="order_type1">单程</td>
                <td><button id="look_detail1">【查看详情】</button><br>
                <td id="order_id1"></td>
                <td id="order_code1"></td>
            </tr>
            <tr id="second_recording">
                <td id="psg_name2"><p>荣思佳</p>
                    <p>李冬阳</p></td>
                <td id="flight_no2">3U8825</td>
                <td id="seat_type2">超值头等舱</td>
                <td><div class="startbox">

                    <div class="startcity" id="dep_city_airport_date_time2"><span>三亚</span> 凤凰国际机场<br/>
                        2015-12-20&nbsp;&nbsp;11:45:00</div>
                </div></td>
                <td><div class="startbox">

                    <div class="startcity"id="arr_city_airport_date_time2"><span>哈尔滨</span> 太平国际机场<br/>
                        2015-12-20&nbsp;&nbsp;14:45:00</div>
                </div></td>
                <td id="seat_price2">1350.00</td>
                <td id="order_type2">往返</td>
                <td><button id="look_detail2">【查看详情】</button><br>
                <td id="order_id2"></td>
                <td id="order_code2"></td>
            </tr>
        </table>
        <nav class="pull-right " >
            <ul id="turn_page" class="pagination pagination-sm" style=" margin-top:0px;">
                <li  id="before"><a href="#" aria-label="Previous"><span aria-hidden="true"onclick="change_to_before()">&laquo;</span></a></li>
                <li ><a href="#">1</a></li>
                <li ><a href="#">2</a></li>
                <li ><a href="#">3</a></li>
                <li ><a href="#">4</a></li>
                <li ><a href="#">5</a></li>
                <li id="next"> <a href="#" aria-label="Next" onclick="change_to_next()"> <span aria-hidden="true">&raquo;</span> </a> </li>
            </ul>
            <div class="clearfix"></div>
        </nav>
        <div class="clearfix"></div>
    </div>
</div>
<!-- main end -->
</div>
<!-- 管理模板 结束 -->



<!-- 退票弹框 -->
<div id="rev" style="display:none">
    <div class="modal-body" >
        <div class="pad-10">
            <h4>行程信息</h4>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered mar-bottom-10">
                <tr class=" bg-gray-f5">
                    <th><input name="" type="checkbox" value=""></th>
                    <th>航班号</th>
                    <th>起飞时间</th>
                    <th>到达时间</th>
                    <th>行程</th>
                </tr>
                <tr>
                    <td><input name="" type="checkbox" value=""></td>
                    <td>CA8954</td>
                    <td>2014-10-18 7:50:00</td>
                    <td>2014-10-18 12:25:00</td>
                    <td>成都双流 - 上海浦东</td>
                </tr>
            </table>

            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered mar-bottom-10">
                <tr class=" bg-gray-f5">
                    <th><input name="" type="checkbox" value=""></th>
                    <th>姓名</th>
                    <th>乘客类型</th>
                    <th>证件类型</th>
                    <th>证件号码</th>
                    <th>机建/燃油</th>
                    <th>企业结算价</th>
                </tr>
                <tr>
                    <td><input name="" type="checkbox" value=""></td>
                    <td>荣思佳</td>
                    <td>成人</td>
                    <td>身份证</td>
                    <td>510301198808081018</td>
                    <td>￥100/￥280</td>
                    <td>￥1440</td>
                </tr>
                <tr>
                    <td><input name="" type="checkbox" value=""></td>
                    <td>李冬阳</td>
                    <td>成人</td>
                    <td>身份证</td>
                    <td>510301198808081018</td>
                    <td>￥100/￥280</td>
                    <td>￥1440</td>
                </tr>
            </table>
            <form class="form-horizontal">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-3 control-label">退票原因</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="inputEmail3" placeholder="请输入退票理由">
                    </div>
                </div>
            </form>

        </div>
    </div>
    <div class="modal-footer mar-top-5">
        <button type="button" class="btn btn-primary" onClick="layer.closeAll()">申请退票</button>
        </a>
        <button type="button" class="btn btn-default"  onClick="layer.closeAll()" >关闭</button>
    </div>
</div>

<!-- 申请改签弹框 -->
<div id="gaiqian" style="display:none">
    <div class="modal-body" >
        <form class="form-horizontal">
            <div class="form-group">
                <label for="" class="col-sm-4 control-label">改签乘机人：</label>
                <div class="col-sm-6">
                    <label class="checkbox-inline" style=" margin-left:10px;">
                        <input type="checkbox" id="inlineCheckbox1" value="option1"> 孙靖
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" id="inlineCheckbox1" value="option1"> 尚丁明
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" id="inlineCheckbox1" value="option1"> 胡家富
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" id="inlineCheckbox1" value="option1"> 刘述军
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" id="inlineCheckbox1" value="option1"> 王博玉
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label for="" class="col-sm-4 control-label">期望日期：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="" placeholder="请选择日期" onClick="WdatePicker()">
                </div>
            </div>

            <div class="form-group">
                <label for="" class="col-sm-4 control-label">期望时间：</label>
                <div class="col-sm-6">
                    <select name="select" class="form-control " >
                        <option value="">不限</option>
                        <option value="">上午</option>
                        <option value="">中午</option>
                        <option value="">下午</option>
                        <option value="">晚上</option>
                        <option value="">凌晨</option>
                    </select>

                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-4 control-label">期望航司：</label>
                <div class="col-sm-6">
                    <select name="select" class="form-control " >
                        <option value="">不限</option>
                        <option value="">中国航空</option>
                        <option value="">南方航空</option>
                        <option value="">四川航空</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-4 control-label">期望仓位：</label>
                <div class="col-sm-6">
                    <select name="select" class="form-control " >
                        <option value="">不限</option>
                        <option value="">经济舱</option>
                        <option value="">头等舱</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="" class="col-sm-4 control-label">备注说明：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="" placeholder="限255字" >
                </div>
            </div>
        </form>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-primary" onClick="submittip()">确 定</button>
        <button type="button" class="btn btn-default"  onClick="layer.closeAll()">关 闭</button>
    </div>
</div>

<script>
    $(document).ready(function() {

        $(".quxiao").click(function(){  //取消订单
            layer.confirm('您确定要取消该订单？', {
                title :'取消订单',
                btn: ['确定','取消'] //按钮
            }, function(){
                layer.msg('该订单已取消', {icon: 1});
            });
        });

        $(".tuipiao").click(function(){  //申请退票
            layer.open({
                type: 1,
                title: '申请退票',
                area: ['auto', 'auto'],
                fix: false, //不固定
                maxmin: false,
                content: $('#rev'),
            });
        });

        $(".qiye09").click(function(){  //申请改签
            layer.open({
                type: 1,
                shift: 2,  //出场动画
                area: ['500px', 'auto'],
                title :'申请改签',
                shadeClose: true, //开启遮罩关闭
                content: $('#gaiqian'),
            });
        });

    });
</script>
</body>
</html>

