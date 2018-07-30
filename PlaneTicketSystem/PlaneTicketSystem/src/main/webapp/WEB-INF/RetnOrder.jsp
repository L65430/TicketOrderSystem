<%@ page import="com.Static.Userinfo" %><%--
  Created by IntelliJ IDEA.
  User: L
  Date: 2018/3/12
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<head>
    <meta charset="utf-8">
    <!-- IE 浏览器运行最新的渲染模式-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 启用响应式特性 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 双核使用webkit内核 -->
    <meta name="renderer" content="webkit">
    <title>商旅系统</title>
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/common.css" rel="stylesheet">
    <link href="../../css/corptravel.css" rel="stylesheet">
    <link href="../../css/enterprise.css" rel="stylesheet">
    <!--<link href="../../../js/icheck/skins/all.css" rel="stylesheet" type="text/css">-->
    <!-- IconFont图标 -->
    <link href="../../css/iconfont.css" rel="stylesheet">
    <script type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <!-- 兼容IE8 -->
    <!--[if lte IE 9]>
    <script type="text/javascript" src="../../../js/html5shiv.min.js"></script>
    <script type="text/javascript" src="../../../js/respond.min.js"></script>
    <![endif]-->
    <!-- layer弹框 2.1 -->
    <script type="text/javascript" src="../../js/layer/layer.js"></script>
    <!-- 日历控件 -->
    <script language="javascript" type="text/javascript" src="../../js/My97DatePicker/WdatePicker.js"></script>

    <script>
        var select_go=0;//是否选择了去程
        var select_back=0;//是否选择了回来的路线
        var now_select_date;//就是点击当前的天数
        var is_search=0;

        $(function () {
            //开始的时候只选定去程
                $(".qucheng").text("选定去程")
                $(".fancheng").text("选定去程")
        })

        //先进行隐藏
        $(function () {
            $("#flight_id1").hide()
            $("#flight_id2").hide()
            $("#flight_order_id1").hide()
            $("#flight_order_id2").hide()
            $("#flight_order_id3").hide()
            //全部隐藏
        })

        // function selected_go() {
        //     select_back=1;
        //     if(select_back==1){
        //        $(".qucheng")
        //     }
        // }
        var flight_info_list=new Array();
        function changeplace() {
            console.log("进入changeplace")
            var begin_placetext=$('#dep_city').val();
            console.log(begin_placetext)
            var arrive_palcetext=$('#arr_city').val();
            $('#dep_city').val(arrive_palcetext);
            $('#arr_city').val(begin_placetext);
        }

        $(function () {
            $("#date_week li").click(function () {
                console.log("进入函数")
                $(this).siblings('li').removeClass('active');
                $(this).addClass('active');
            })
        })


        function changet_to_next() {
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


        //点击之后进入上一个
        function changet_to_before() {
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


        //得到页码
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


        function GetDateStr(AddDayCount) {
            var dd = new Date();
            dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期
            var y = dd.getFullYear();
            var m = dd.getMonth()+1;//获取当前月份的日期
            var numberm=Number(m)
            if(numberm<10){
                var stringm="0"+numberm.toString()
            }
            var d = dd.getDate();
            return y+"-"+stringm+"-"+d
        }


        //输入任意一个字符串获取前后的时间
        function GetRandomDate(inputDate,AddDayCount) {
            var datt = inputDate.split("-");//这边给定一个特定时间

            var newDate = new Date(datt[0], datt[1]-1, datt[2]);
            var befminuts = newDate.getTime() + 1000 * 60 * 60 * 24 * parseInt(AddDayCount);//计算前几天用减，计算后几天用加，最后一个就是多少天的数量
            var beforeDat = new Date;
            beforeDat.setTime(befminuts);
            var befMonth = beforeDat.getMonth()+1;
            var mon = befMonth >= 10 ? befMonth : '0' + befMonth;
            var befDate = beforeDat.getDate();
            var da = befDate >= 10 ? befDate : '0' + befDate;
            var newDate = beforeDat.getFullYear() + '-' + mon + '-' + da;
            return newDate
        }




        //返回当前星期几
        function getWeekByDay(dayValue){ //dayValue=“2014-01-01”
            var day = new Date(Date.parse(dayValue.replace(/-/g, '/'))); //将日期值格式化
            var today = new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六"); //创建星期数组
            console.log(today[day.getDay()])
            return today[day.getDay()];  //返一个星期中的某一天，其中0为星期日
        }

        $(function () {
            var add;
            for(add=0;add<7;add++){
                var get_date=GetDateStr(add)
                var get_week=getWeekByDay(get_date)
                $("#date_week li a").eq(add).html(get_date+"<br/>"+get_week)
            }
        })

        function turn_to_seven_before() {
            var i;
            var splice_result;
            for(i=0;i<7;i++){
                //先获取当前字符串
                var get_html=$("#date_week li a").eq(i).html()
                splice_result=get_html.split("<br>")
                var day_seven_before=GetRandomDate(splice_result[0],-7)
                var get_week_seven_before=getWeekByDay(day_seven_before)
                $("#date_week li a").eq(i).html(day_seven_before+"<br/>"+get_week_seven_before)
            }
        }

        //跳转七天后
        function turn_to_seven_later() {
            var i;
            var splice_result;
            for(i=0;i<7;i++){
                //先获取当前字符串
                var get_html=$("#date_week li a").eq(i).html()
                splice_result=get_html.split("<br>")
                var day_seven_before=GetRandomDate(splice_result[0],7)
                var get_week_seven_later=getWeekByDay(day_seven_before)
                $("#date_week li a").eq(i).html(day_seven_before+"<br/>"+get_week_seven_later)
            }
        }

        //点击上方天数的结果,如果已经选择了
        $(function () {
            $("#date_week li a").click(function () {
                var get_date=$(this).html()
                var splice_date=get_date.split("<br>")
                var get_date_final=splice_date[0]
                var final_flight_list=new Array()
                now_select_date=get_date_final
                console.log("select_go"+select_go)
                if(select_go==0){//刚开始进入的时候，还没有选择
                    $.ajax({
                        url:"<%=basePath%>singleOrder/getToday",
                        data:{"dep_date":get_date_final},
                        success:function(resp){
                            //进入之后就获取当天情况
                            flight_info_list.length=0;
                            flight_info_list=resp
                            $("#first_recording").show()
                            $("#second_recording").show()
                            if(flight_info_list.length!=0){
                                console.log(flight_info_list);
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
                }
                if(select_go==1){//已经选择了去的情况，只能看返程了，这个时候传入的方向反一下
                    //所以这个时候要得到返程，要根据已经得到的机票信息来确定返程
                    var go_back_date=$("#go_back1").html()
                    var go_back_split=go_back_date.split("<br>")
                    var go_back=go_back_split[0]
                    var go=go_back.split("-")[0]
                    var back=go_back.split("-")[1]

                    $.ajax({
                        url:"<%=basePath%>RetnOrder/get_back_today",
                        data:{"dep_date":get_date_final,"dep_city":back,"arr_city":go},
                        success:function (resp) {
                            flight_info_list.length=0;
                            flight_info_list=resp
                            $("#first_recording").show()
                            $("#second_recording").show()
                            if(flight_info_list.length!=0){
                                console.log(flight_info_list);
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
                }
            })
        })


        function setall(input_flight_list) {
            var get_carrier_id;
            var splice_carrier_id;
            var English_id;
            var image_src;
            var Chinese_id;
            var flight_no_id;
            var air_name_id;
            var dep_time;
            var arr_time;
            var dep_airport;
            var arr_airport;
            var seat_amount_top;
            var seat_price_top;
            var seat_price_top_cheap;
            var seat_amount_second;
            var seat_price_second;
            var seat_price_second_cheap;
            var seat_amount_third;
            var seat_price_third;
            var seat_price_third_cheap;
            var special_amount;
            var special_price;
            var special_price_cheap;
            var dep_city;
            var arr_city;
            var dep_date;
            var flight_id;


            if(input_flight_list.length==1){
                //设置图案
                get_carrier_id=input_flight_list[0]["carrier_id"]
                //然后进行分割
                //  splice_carrier_id=get_carrier_id.split("-")
                //  English_id=splice_carrier_id[0]
                image_src="/images/air/"+get_carrier_id+".png"
                $("#plane_name_id1").attr("src",image_src)

                //设置名字
                Chinese_id=input_flight_list[0]["carrier_name"];
                $("#carrier_id_id1").text(Chinese_id)

                //设置编号
                flight_no_id=input_flight_list[0]["flight_no"]
                $("#flight_no_id1").text(flight_no_id)

                //设置机型
                air_name_id=input_flight_list[0]["air_name"]
                $("#air_name_id1").text(air_name_id)

                //设置出发时间
                dep_time=input_flight_list[0]["dep_time"]
                $("#dep_time_id1").text(dep_time)

                //设置到达时间
                arr_time=input_flight_list[0]["arr_time"]
                $("#arr_time_id1").text(arr_time)

                //设置出发机场
                dep_airport=input_flight_list[0]["dep_airport"]
                $("#dep_airport_id1").text(dep_airport)

                //设置到达机场
                arr_airport=input_flight_list[0]["arr_airport"]
                $("#arr_airport_id1").text(arr_airport)

                dep_city=input_flight_list[0]["dep_city"]
                $("#dep_city_id1").text(dep_city)

                arr_city=input_flight_list[0]["arr_city"]
                $("#arr_city_id1").text(arr_city)

                dep_date=input_flight_list[0]["dep_date"]
                $("#dep_date1").text(dep_date)

                flight_id=input_flight_list[0]["flight_id"]
                $("#flight_id1").text(flight_id)
                //然后导入机票的部分
                seat_amount_top=input_flight_list[0]["seat_amount_first"]
                $("#seat_amount_top1").text(seat_amount_top)

                seat_amount_second=input_flight_list[0]["seat_amount_second"]
                $("#seat_amount_second1").text(seat_amount_second)

                seat_amount_third=input_flight_list[0]["seat_amount_third"]
                $("#seat_amount_third1").text(seat_amount_third)

                special_amount=input_flight_list[0]["seat_amount_fourth"]
                $("#special_amount1").text(special_amount)

                seat_price_top=input_flight_list[0]["seat_price_first"]
                $("#seat_price_top1").text(seat_price_top)

                seat_price_second=input_flight_list[0]["seat_price_second"]
                $("#seat_price_second1").text(seat_price_second)

                seat_price_third=input_flight_list[0]["seat_price_third"]
                $("#seat_price_third1").text(seat_price_third)

                special_price=input_flight_list[0]["seat_price_fourth"]
                $("#special_price1").text(special_price)

                seat_price_top_cheap=seat_price_top*0.8
                $("#seat_price_top1_cheap").text(seat_price_top_cheap)

                seat_price_second_cheap=seat_price_second*0.8
                $("#seat_price_second1_cheap").text(seat_price_top_cheap)

                seat_price_third_cheap=seat_price_third*0.8
                $("#seat_price_third1_cheap").text(seat_price_third_cheap)

                special_price_cheap=special_price*0.8
                $("#special_price_cheap1").text(special_price_cheap)

                //然后要把下面那个订单隐藏了
                $("#second_recording").hide();


            }else{
                $("#second_recording").show();
                get_carrier_id=input_flight_list[0]["carrier_id"]
                //然后进行分割
                // splice_carrier_id=get_carrier_id.split("-")
                // English_id=splice_carrier_id[0]
                image_src="/images/air/"+get_carrier_id+".png"
                $("#plane_name_id1").attr("src",image_src)
                //设置名字
                Chinese_id=input_flight_list[0]["carrier_name"]
                $("#carrier_id_id1").text(Chinese_id)

                //设置编号
                flight_no_id=input_flight_list[0]["flight_no"]
                $("#flight_no_id1").text(flight_no_id)

                //设置机型
                air_name_id=input_flight_list[0]["air_name"]
                $("#air_name_id1").text(air_name_id)

                //设置出发时间
                dep_time=input_flight_list[0]["dep_time"]
                console.log("dep_time:"+dep_time)
                $("#dep_time_id1").text(dep_time)

                //设置到达时间
                arr_time=input_flight_list[0]["arr_time"]
                $("#arr_time_id1").text(arr_time)

                //设置出发机场
                dep_airport=input_flight_list[0]["dep_airport"]
                $("#dep_airport_id1").text(dep_airport)

                //设置到达机场
                arr_airport=input_flight_list[0]["arr_airport"]
                $("#arr_airport_id1").text(arr_airport)

                dep_city=input_flight_list[0]["dep_city"]
                $("#dep_city_id1").text(dep_city)

                arr_city=input_flight_list[0]["arr_city"]
                $("#arr_city_id1").text(arr_city)

                dep_date=input_flight_list[0]["dep_date"]
                $("#dep_date1").text(dep_date)

                flight_id=input_flight_list[0]["flight_id"]
                $("#flight_id1").text(flight_id)

                seat_amount_top=input_flight_list[0]["seat_amount_first"]
                $("#seat_amount_top1").text(seat_amount_top)

                seat_amount_second=input_flight_list[0]["seat_amount_second"]
                $("#seat_amount_second1").text(seat_amount_second)

                seat_amount_third=input_flight_list[0]["seat_amount_third"]
                $("#seat_amount_third1").text(seat_amount_third)

                special_amount=input_flight_list[0]["seat_amount_fourth"]
                $("#special_amount1").text(special_amount)

                seat_price_top=input_flight_list[0]["seat_price_first"]
                $("#seat_price_top1").text(seat_price_top)

                seat_price_second=input_flight_list[0]["seat_price_second"]
                $("#seat_price_second1").text(seat_price_second)

                seat_price_third=input_flight_list[0]["seat_price_third"]
                $("#seat_price_third1").text(seat_price_third)

                special_price=input_flight_list[0]["seat_price_fourth"]
                $("#special_price1").text(special_price)

                seat_price_top_cheap=seat_price_top*0.8
                $("#seat_price_top1_cheap").text(seat_price_top_cheap)

                seat_price_second_cheap=seat_price_second*0.8
                $("#seat_price_second1_cheap").text(seat_price_top_cheap)

                seat_price_third_cheap=seat_price_third*0.8
                $("#seat_price_third1_cheap").text(seat_price_third_cheap)

                special_price_cheap=special_price*0.8
                $("#special_price_cheap1").text(special_price_cheap)



                get_carrier_id=input_flight_list[1]["carrier_id"]
                //然后进行分割
                // splice_carrier_id=get_carrier_id.split("-")
                // English_id=splice_carrier_id[0]
                image_src="/images/air/"+get_carrier_id+".png"
                $("#plane_name_id2").attr("src",image_src)
                //设置名字
                Chinese_id=input_flight_list[1]["carrier_name"]
                $("#carrier_id_id2").text(Chinese_id)

                //设置编号
                flight_no_id=input_flight_list[1]["flight_no"]
                $("#flight_no_id2").text(flight_no_id)

                //设置机型
                air_name_id=input_flight_list[1]["air_name"]
                $("#air_name_id2").text(air_name_id)

                //设置出发时间
                dep_time=input_flight_list[1]["dep_time"]
                $("#dep_time_id2").text(dep_time)

                //设置到达时间
                arr_time=input_flight_list[1]["arr_time"]
                $("#arr_time_id2").text(arr_time)

                //设置出发机场
                dep_airport=input_flight_list[1]["dep_airport"]
                $("#dep_airport_id2").text(dep_airport)

                //设置到达机场
                arr_airport=input_flight_list[1]["arr_airport"]
                $("#arr_airport_id2").text(arr_airport)

                dep_city=input_flight_list[1]["dep_city"]
                $("#dep_city_id2").text(dep_city)

                arr_city=input_flight_list[1]["arr_city"]
                $("#arr_city_id2").text(arr_city)

                dep_date=input_flight_list[1]["dep_date"]
                $("#dep_date2").text(dep_date)

                flight_id=input_flight_list[1]["flight_id"]
                $("#flight_id2").text(flight_id)

                //设置机票价格信息等
                seat_amount_top=input_flight_list[1]["seat_amount_first"]
                $("#seat_amount_top2").text(seat_amount_top)

                seat_amount_second=input_flight_list[1]["seat_amount_second"]
                $("#seat_amount_second2").text(seat_amount_second)

                seat_amount_third=input_flight_list[1]["seat_amount_third"]
                $("#seat_amount_third2").text(seat_amount_third)

                special_amount=input_flight_list[1]["seat_amount_fourth"]
                $("#special_amount2").text(special_amount)

                seat_price_top=input_flight_list[1]["seat_price_first"]
                $("#seat_price_top2").text(seat_price_top)

                seat_price_second=input_flight_list[1]["seat_price_second"]
                $("#seat_price_second2").text(seat_price_second)

                seat_price_third=input_flight_list[1]["seat_price_third"]
                $("#seat_price_third2").text(seat_price_third)

                special_price=input_flight_list[1]["seat_price_fourth"]
                $("#special_price2").text(special_price)

                seat_price_top_cheap=seat_price_top*0.8
                $("#seat_price_top2_cheap").text(seat_price_top_cheap)

                seat_price_second_cheap=seat_price_second*0.8
                $("#seat_price_second2_cheap").text(seat_price_top_cheap)

                seat_price_third_cheap=seat_price_third*0.8
                $("#seat_price_third2_cheap").text(seat_price_third_cheap)

                special_price_cheap=special_price*0.8
                $("#special_price_cheap2").text(special_price_cheap)

            }
        }


        //点击选择处理函数,点击之后放到上面,qc3和qc4都要处理
        //应该设置一下点击了之后就只会出现返程，没有去程，这里要多加一个ajax，用来马上做判断用

        //马上获取当前的ajax情况
        function after_select_go() {
            //此时是非搜索情况的
            if(is_search==0){
                var dep_time=now_select_date;//当前选择的天数
                //点击去了之后的情况
                var go_back_date=$("#go_back1").html()
                var go_back_split=go_back_date.split("<br>")
                var go_back=go_back_split[0]
                var go=go_back.split("-")[0]
                var back=go_back.split("-")[1]

                $.ajax({
                    url:"<%=basePath%>RetnOrder/get_back_today",
                    data:{"dep_date":dep_time,"dep_city":back,"arr_city":go},
                    success:function (resp) {
                        flight_info_list.length=0;
                        flight_info_list=resp
                        $("#first_recording").show()
                        $("#second_recording").show()
                        if(flight_info_list.length!=0){
                            console.log(flight_info_list);
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
            }
            is_search=0;
        }

        function order_go(input_id) {
             //传入了当时用的是哪个id,
            var go_back;
            var dep_airport;
            var arr_airport;
            var dep_time;
            var arr_time;
            var carrier_name;
            var seat_type;
            var money;
            var dep_date;
            var flight_id;
            var flight_no;

            go_back=$("#dep_city_id1").text()+'-'+$("#arr_city_id1").text()
            dep_date=$("#dep_date1").text()
            dep_airport=$("#dep_airport_id1").text()
            arr_airport=$("#arr_airport_id1").text()
            dep_time=$("#dep_time_id1").text()
            arr_time=$("#arr_time_id1").text()
            carrier_name=$("#carrier_id_id1").text()
            flight_id=$("#flight_id1").text()
            if(input_id=="decide_first1"){//选择了头等舱
                seat_type=$("#seat_type_first1").text()
                money=$("#seat_price_top1").text()
                flight_no=$("#flight_no_id1").text()

               $("#go_back1").html(go_back+"<br>"+dep_date)
               $("#go_back_airport1").html(dep_airport+"<br>"+arr_airport)
               $("#dep_arr_time1").html(dep_time+"<br>"+arr_time)
               $("#name_seat_type1").html(carrier_name+" "+flight_no+"<br>"+seat_type)
               $("#money1").text("￥"+money)
                $("#flight_order_id1").text(flight_id)

                //还需要设置2号
                $("#go_back2").html(go_back+"<br>"+dep_date)
                $("#go_back_airport2").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time2").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type2").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money2").text("￥"+money)
                $("#flight_order_id2").text(flight_id)

                after_select_go();

            }
            if(input_id=="decide_second1"){
                seat_type=$("#seat_type_second1").text()
                money=$("#seat_price_second1").text()
                flight_no=$("#flight_no_id1").text()

                $("#go_back1").html(go_back+"<br>"+dep_date)
                $("#go_back_airport1").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time1").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type1").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money1").text("￥"+money)
                $("#flight_order_id1").text(flight_id)

                //还需要设置2号
                $("#go_back2").html(go_back+"<br>"+dep_date)
                $("#go_back_airport2").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time2").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type2").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money2").text("￥"+money)
                $("#flight_order_id2").text(flight_id)

                after_select_go();
            }

            if(input_id=="decide_third1"){
                seat_type=$("#seat_type_third1").text()
                money=$("#seat_price_third1").text()
                flight_no=$("#flight_no_id1").text()

                $("#go_back1").html(go_back+"<br>"+dep_date)
                $("#go_back_airport1").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time1").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type1").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money1").text("￥"+money)
                $("#flight_order_id1").text(flight_id)

                //还需要设置2号
                $("#go_back2").html(go_back+"<br>"+dep_date)
                $("#go_back_airport2").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time2").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type2").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money2").text("￥"+money)
                $("#flight_order_id2").text(flight_id)

                after_select_go();
            }


            if(input_id=="decide_fourth1"){
                seat_type=$("#seat_type_fourth1").text()
                money=$("#seat_price_fourth1").text()
                flight_no=$("#flight_no_id1").text()

                $("#go_back1").html(go_back+"<br>"+dep_date)
                $("#go_back_airport1").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time1").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type1").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money1").text("￥"+money)
                $("#flight_order_id1").text(flight_id)

                //还需要设置2号
                $("#go_back2").html(go_back+"<br>"+dep_date)
                $("#go_back_airport2").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time2").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type2").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money2").text("￥"+money)
                $("#flight_order_id2").text(flight_id)

                after_select_go();
            }

            //如果是下半部分点击
            go_back=$("#dep_city_id2").text()+'-'+$("#arr_city_id2").text()
            dep_date=$("#dep_date2").text()
            dep_airport=$("#dep_airport_id2").text()
            arr_airport=$("#arr_airport_id2").text()
            dep_time=$("#dep_time_id2").text()
            arr_time=$("#arr_time_id2").text()
            carrier_name=$("#carrier_id_id2").text()

            if(input_id=="decide_first2"){
                seat_type=$("#seat_type_first2").text()
                money=$("#seat_price_top2").text()
                flight_no=$("#flight_no_id2").text()

                $("#go_back1").html(go_back+"<br>"+dep_date)
                $("#go_back_airport1").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time1").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type1").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money1").text("￥"+money)
                $("#flight_order_id1").text(flight_id)

                //还需要设置2号
                $("#go_back2").html(go_back+"<br>"+dep_date)
                $("#go_back_airport2").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time2").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type2").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money2").text("￥"+money)
                $("#flight_order_id2").text(flight_id)

                after_select_go();
            }

            if(input_id=="decide_second2"){
                seat_type=$("#seat_type_first2").text()
                money=$("#seat_price_top2").text()
                flight_no=$("#flight_no_id2").text()

                $("#go_back1").html(go_back+"<br>"+dep_date)
                $("#go_back_airport1").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time1").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type1").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money1").text("￥"+money)
                $("#flight_order_id1").text(flight_id)

                //还需要设置2号
                $("#go_back2").html(go_back+"<br>"+dep_date)
                $("#go_back_airport2").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time2").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type2").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money2").text("￥"+money)
                $("#flight_order_id2").text(flight_id)

                after_select_go();
            }

            if(input_id=="decide_third2"){
                seat_type=$("#seat_type_third2").text()
                money=$("#seat_price_third2").text()
                flight_no=$("#flight_no_id2").text()

                $("#go_back1").html(go_back+"<br>"+dep_date)
                $("#go_back_airport1").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time1").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type1").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money1").text("￥"+money)
                $("#flight_order_id1").text(flight_id)

                //还需要设置2号
                $("#go_back2").html(go_back+"<br>"+dep_date)
                $("#go_back_airport2").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time2").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type2").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money2").text("￥"+money)
                $("#flight_order_id2").text(flight_id)

                after_select_go();
            }

            if(input_id=="decide_fourth2"){
                seat_type=$("#seat_type_fourth2").text()
                money=$("#seat_price_fourth2").text()
                flight_no=$("#flight_no_id2").text()

                $("#go_back1").html(go_back+"<br>"+dep_date)
                $("#go_back_airport1").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time1").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type1").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money1").text("￥"+money)
                $("#flight_order_id1").text(flight_id)

                //还需要设置2号
                $("#go_back2").html(go_back+"<br>"+dep_date)
                $("#go_back_airport2").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time2").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type2").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money2").text("￥"+money)
                $("#flight_order_id2").text(flight_id)

                after_select_go();
            }
        }

        //点击之后
        function order_back(input_id){
            var go_back;
            var dep_airport;
            var arr_airport;
            var dep_time;
            var arr_time;
            var carrier_name;
            var seat_type;
            var money;
            var dep_date;
            var total_money;
            var flight_id;
            var flight_no;

            go_back=$("#dep_city_id1").text()+'-'+$("#arr_city_id1").text()
            dep_date=$("#dep_date1").text()
            dep_airport=$("#dep_airport_id1").text()
            arr_airport=$("#arr_airport_id1").text()
            dep_time=$("#dep_time_id1").text()
            arr_time=$("#arr_time_id1").text()
            carrier_name=$("#carrier_id_id1").text()
            flight_id=$("#flight_id1").text()
            if(input_id=="decide_first1"){//选择了头等舱
                console.log("进入了order_result")
                seat_type=$("#seat_type_first1").text()
                money=$("#seat_price_top1").text()
                flight_no=$("#flight_no_id1").text()

                $("#go_back3").html(go_back+"<br>"+dep_date)
                $("#go_back_airport3").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time3").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type3").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money3").text("￥"+money)
                $("#flight_order_id3").text(flight_id)


            }
            if(input_id=="decide_second1"){
                seat_type=$("#seat_type_second1").text()
                money=$("#seat_price_second1").text()
                flight_no=$("#flight_no_id1").text()

                $("#go_back3").html(go_back+"<br>"+dep_date)
                $("#go_back_airport3").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time3").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type3").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money3").text("￥"+money)
                $("#flight_order_id3").text(flight_id)

            }

            if(input_id=="decide_third1"){
                seat_type=$("#seat_type_third1").text()
                money=$("#seat_price_third1").text()
                flight_no=$("#flight_no_id1").text()

                $("#go_back3").html(go_back+"<br>"+dep_date)
                $("#go_back_airport3").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time3").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type3").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money3").text("￥"+money)
                $("#flight_order_id3").text(flight_id)

            }


            if(input_id=="decide_fourth1"){
                seat_type=$("#seat_type_fourth1").text()
                money=$("#seat_price_fourth1").text()
                flight_no=$("#flight_no_id1").text()

                $("#go_back3").html(go_back+"<br>"+dep_date)
                $("#go_back_airport3").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time3").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type3").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money3").text("￥"+money)
                $("#flight_order_id3").text(flight_id)

            }

            //如果是下半部分点击
            go_back=$("#dep_city_id2").text()+'-'+$("#arr_city_id2").text()
            dep_date=$("#dep_date2").text()
            dep_airport=$("#dep_airport_id2").text()
            arr_airport=$("#arr_airport_id2").text()
            dep_time=$("#dep_time_id2").text()
            arr_time=$("#arr_time_id2").text()
            carrier_name=$("#carrier_id_id2").text()
            flight_id=$("#flight_id2").text()

            if(input_id=="decide_first2"){
                seat_type=$("#seat_type_first2").text()
                money=$("#seat_price_top2").text()
                flight_no=$("#flight_no_id2").text()

                $("#go_back3").html(go_back+"<br>"+dep_date)
                $("#go_back_airport3").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time3").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type3").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money3").text("￥"+money)
                $("#flight_order_id3").text(flight_id)

            }

            if(input_id=="decide_second2"){
                seat_type=$("#seat_type_first2").text()
                money=$("#seat_price_top2").text()
                flight_no=$("#flight_no_id2").text()

                $("#go_back3").html(go_back+"<br>"+dep_date)
                $("#go_back_airport3").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time3").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type3").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money3").text("￥"+money)
                $("#flight_order_id3").text(flight_id)
            }

            if(input_id=="decide_third2"){
                seat_type=$("#seat_type_third2").text()
                money=$("#seat_price_third2").text()
                flight_no=$("#flight_no_id2").text()

                $("#go_back3").html(go_back+"<br>"+dep_date)
                $("#go_back_airport3").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time3").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type3").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money3").text("￥"+money)
                $("#flight_order_id3").text(flight_id)
            }

            if(input_id=="decide_fourth2"){
                seat_type=$("#seat_type_fourth2").text()
                money=$("#seat_price_fourth2").text()
                flight_no=$("#flight_no_id2").text()

                $("#go_back3").html(go_back+"<br>"+dep_date)
                $("#go_back_airport3").html(dep_airport+"<br>"+arr_airport)
                $("#dep_arr_time3").html(dep_time+"<br>"+arr_time)
                $("#name_seat_type3").html(carrier_name+" "+flight_no+"<br>"+seat_type)
                $("#money3").text("￥"+money)
                $("#flight_order_id3").text(flight_id)
            }
        }


        //
        //点击选定去程或者返程就都发生改变
        // $(function () {
        //     $(".qucheng").click(function () {
        //         $(".qucheng").text("选定返程")
        //         $(".fancheng").text("选定返程")
        //     })
        //     $(".fancheng").click(function () {
        //         $(".qucheng").text("选定返程")
        //         $(".fancheng").text("选定返程")
        //     })
        // })


        //点击之后的处理结果，然后要处理更改的情况
        $(function () {
            $(".qucheng").click(function () {
                //点击当前，获得各种信息
                var result=$(this).attr("id")
                if($(".qucheng").text()=="选定返程选定返程选定返程选定返程"&&$(".fancheng").text()=="选定返程选定返程选定返程选定返程"){
                    $(".qc1").hide()
                    $(".qc2").hide();
                    $(".qc3").hide();
                    $(".qc4").show();//qc4里一个就包含了两个
                    $(".qc5").hide();
                    select_back=1;
                    //然后还要把这些东西传过去
                    console.log("result:"+result);
                    order_back(result)
                }
                if($(".qucheng").text()=="选定去程选定去程选定去程选定去程"&&$(".fancheng").text()=="选定去程选定去程选定去程选定去程"){
                        $(".qc2").show();
                        $(".qc3").show();
                        console.log("进入这个函数，选定返程")
                        $(".qucheng").text("选定返程")
                        $(".fancheng").text("选定返程")
                        select_go=1;
                    order_go(result)
                    }
            })
            $(".fancheng").click(function(){
                var result=$(this).attr("id")
                if($(".qucheng").text()=="选定返程选定返程选定返程选定返程"&&$(".fancheng").text()=="选定返程选定返程选定返程选定返程"){
                    $(".qc1").hide()
                    $(".qc2").hide();
                    $(".qc3").hide();
                    $(".qc4").show();//qc4里一个就包含了两个
                    $(".qc5").hide();
                    select_go=1;
                    order_back(result)
                }
                if($(".qucheng").text()=="选定去程选定去程选定去程选定去程"&&$(".fancheng").text()=="选定去程选定去程选定去程选定去程"){
                    // $(".qc1").hide();
                    $(".qc2").show();
                    $(".qc3").show();
                    $(".qucheng").text("选定返程")
                    $(".fancheng").text("选定返程")
                    select_back=1;
                    order_go(result)
                }
            });

        })



        //设置更改按钮
        function adjust_qucheng() {
            //点击之后，显示
            $(".qc1").show(1)
            $(".qc2").show(1)
            $(".qc3").hide()
            $(".qc5").show()
            //然后保险起见先进行更改
            $(".qucheng").text("选定去程")
            $(".fancheng").text("选定去程")
            select_go=0;
            select_back=0;
        }


        function adjust_all_qucheng(){
            //去程改了之后返程也要修改，所以qc4整个都消失了
            $(".qc4").hide()
            $(".qc1").show()
            $(".qc2").show()
            $(".qc5").show()
            //然后设置全都是去程
            $(".qucheng").text("选定去程")
            $(".fancheng").text("选定去程")
            select_back=0;
            select_go=0;
        }

        function adjust_all_fancheng(){
            //只修改返程的话显示qc3
            $(".qc1").show()
            $(".qc2").show();
            $(".qc3").show();
            $(".qc4").hide();//qc4里一个就包含了两个
            $(".qc5").show();
            //然后设置全都是去程
            $(".qucheng").text("选定返程")
            $(".fancheng").text("选定返程")
            select_back=0;
            select_go=1;
        }

        //这是点击翻页的时候的操作
        $(function () {
            $("#turn_page li").click(function () {
                var id=$(this).attr("id")
                if(id!="before"&&id!='next'){
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

        //进入之后默认查找今天情况
        $(function () {
            console.log("进入自动查找环节")
            var get_html=$("#date_week li a").eq(0).html()
            var splice_result=get_html.split("<br>")
            var dep_time=splice_result[0]
            var final_flight_list=new Array()
            //获取当天情况成功
            $.ajax({
                url:"<%=basePath%>singleOrder/getToday",
                data:{"dep_date":dep_time},
                success:function(resp){
                    //进入之后就获取当天情况
                    flight_info_list.length=0;
                    flight_info_list=resp
                    $("#first_recording").show()
                    $("#second_recording").show()
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



        function search_button_method() {
            is_search=1;
            var dep_date=$("#dep_date").val();
            var dep_city=$("#dep_city").val();
            var arr_city=$("#arr_city").val();
            var arr_date=$("#arr_date").val();
            var carrier_id=$("#dropAirlines option:selected").text();
            console.log("carrier_id:"+carrier_id)
            console.log("select_go:"+select_go);
            if(select_go==0){
                console.log("进入了select_go部分")
                $.ajax({
                    url:"<%=basePath%>singleOrder/search",
                    data:{"dep_date":dep_date,"dep_city":dep_city,"arr_city":arr_city,"carrier_id":carrier_id},
                    success:function (resp) {
                        //得到之后开始赋值,点击的时候可以显示
                        var final_flight_list=new Array()
                        if(resp!=null){
                            flight_info_list.length=0;
                            flight_info_list=resp;
                            console.log(flight_info_list)
                            $("#first_recording").show()
                            $("#second_recording").show()
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
                    }
                })
            }
            if(select_go==1){
                $.ajax({
                    url:"<%=basePath%>singleOrder/search",
                    data:{"dep_date":arr_date,"dep_city":arr_city,"arr_city":dep_city,"carrier_id":carrier_id},
                    success:function (resp) {
                        //得到之后开始赋值,点击的时候可以显示
                        var final_flight_list=new Array()
                        if(resp!=null){
                            flight_info_list.length=0;
                            flight_info_list=resp;
                            console.log(flight_info_list)
                            $("#first_recording").show()
                            $("#second_recording").show()
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
                    }
                })
            }
        }

        //点击之后把所有的结果都发过去
        function turn_to_order(){
           var dep_date;
           var arr_date;
           var dep_city;
           var arr_city;//以过去为标准
           var go_dep_time;
           var back_dep_time
           var go_arr_time;
           var back_arr_time
           var go_dep_airport;
           var back_dep_airport
           var go_arr_airport;
           var back_arr_airport
           var go_seat_type;
           var back_seat_type
           var go_seat_price;
           var back_seat_price
           var go_carrier_name;
           var back_carrier_name
           var go_flight_no
           var back_flight_no
           var go_flight_id;
           var back_flight_id;

           var split_first=$("#go_back2").html().split("<br>")
           dep_date=split_first[1]
           var go_back_city=split_first[0].split("-")
           dep_city=go_back_city[0]
           arr_city=go_back_city[1]

           var dep_arr_airport=$("#go_back_airport2").html().split("<br>")
           go_dep_airport=dep_arr_airport[0]
           go_arr_airport=dep_arr_airport[1]

           var dep_arr_time=$("#dep_arr_time2").html().split("<br>")
           go_dep_time=dep_arr_time[0]
           go_arr_time=dep_arr_time[1]

           var name_seat_type=$("#name_seat_type2").html().split("<br>")
           var split_second=name_seat_type[0].split(' ')
           go_carrier_name=split_second[0]
           go_flight_no=split_second[1]
           go_seat_type=name_seat_type[1]

           var money2=$("#money2").text().split("￥")
           go_seat_price=money2[1]

           go_flight_id=$("#flight_order_id2").text()


           //回来的结果

            split_first=$("#go_back3").html().split("<br>")
            arr_date=split_first[1]
            go_back_city=split_first[0].split("-")
            dep_city=go_back_city[0]
            arr_city=go_back_city[1]

            dep_arr_airport=$("#go_back_airport3").html().split("<br>")
            back_dep_airport=dep_arr_airport[0]
            back_arr_airport=dep_arr_airport[1]

            dep_arr_time=$("#dep_arr_time3").html().split("<br>")
            back_dep_time=dep_arr_time[0]
            back_arr_time=dep_arr_time[1]

            name_seat_type=$("#name_seat_type3").html().split("<br>")
            split_second=name_seat_type[0].split(' ')
            back_carrier_name=split_second[0]
            back_flight_no=split_second[1]
            back_seat_type=name_seat_type[1]

            money2=$("#money3").text().split("￥")
            back_seat_price=money2[1]

            back_flight_id=$("#flight_order_id3").text()


            var url="<%=basePath%>RetnOrder/turn_to_order"
            //在这里传过去
            var urlfinal=url+"?"+"dep_city="+dep_city+"&arr_city="+arr_city+"&dep_date="+dep_date+"&arr_date="+arr_date+"&go_dep_time="+go_dep_time+"&go_arr_time="+go_arr_time+"&go_dep_airport="+go_dep_airport+"&go_arr_airport="+go_arr_airport
                +"&go_carrier_name="+go_carrier_name+"&go_flight_no="+go_flight_no+"&go_seat_type="+go_seat_type+"&go_seat_price="+go_seat_price+"&go_flight_id="+go_flight_id
            +"&back_dep_time="+back_dep_time+"&back_arr_time="+back_arr_time+"&back_dep_airport="+back_dep_airport+"&back_arr_airport="+back_arr_airport
            +"&back_carrier_name="+back_carrier_name+"&back_flight_no="+back_flight_no+"&back_seat_type="+back_seat_type+"&back_seat_price="+back_seat_price
            +"&back_flight_id="+back_flight_id
            window.location.href=urlfinal
        }


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
                        <li><a href="系统管理/修改密码.html">修改密码</a></li>
                        <li><a href="#">退出</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right nav-top-small">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="icon iconfont font14 " style=" vertical-align:middle;"  >&#xe62b;</i>028-12345678 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">（或）028-12345678</a></li>
                        <li><a href="#">（或）028-12345678</a></li>
                        <!--<li role="separator" class="divider"></li>-->
                    </ul>
                </li>

            </ul>
            <ul class="nav navbar-nav navbar-right nav-top-small">


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
                <li  class="active"><a href="<%=basePath%>Orderlist/turn_to_single"><i class="icon iconfont icon-nav-block font24" >&#xe620;</i> 在线预订</a></li>
                <li ><a href="<%=basePath%>RetnOrder/Turn_to_order"><i class="icon iconfont icon-nav-block font24" >&#xe61c;</i> 订单管理</a></li>

            </ul>
        </div><!-- /.navbar-collapse -->

    </div>
</nav>
<!-- header end -->
<!-- 搜索 -->
<div class="index-wall white " style=" ">
    <div class="container" style=" position:relative;">
        <form class="form-inline">
            <div class="form-group">
                <select name="" class="form-control" onchange="top.location=this.value">
                    <option value="<%=basePath%>RetnOrder/turnToSingle">单程</option>
                    <option selected>往返</option>
                </select>
            </div>
            <div class="form-group mar-left-10">
                <label for="dep_city">出发城市</label>
                <input type="text" class="form-control" style="width:85px;" id="dep_city" value="成都" placeholder="">
            </div>
            <div class="form-group">
                <label for="change"> — <a href="#" class="huan" onclick="changeplace()" id="change">换</a> —</label>
            </div>
            <div class="form-group">
                <label for="arr_city">到达城市</label>
                <input type="text" class="form-control" style="width:85px;" id="arr_city" value="北京" placeholder="">
            </div>
            <div class="form-group mar-left-10">
                <label for="dep_date">出发日期</label>
                <input type="text" class="form-control " style="width:110px;" id="dep_date" value="2018-03-13" placeholder="" onClick="WdatePicker()">
            </div>
            <div class="form-group mar-left-10">
                <label for="arr_date">返回日期</label>
                <input type="text" class="form-control " id="arr_date" style="width:110px;" onClick="WdatePicker()" value="2018-03-20" placeholder="">
            </div>
            <div class="form-group mar-left-10">
                <select id="dropAirlines"  class="form-control" style=" width:120px;">
                    <option value="">全部航司</option>
                    <option value="3U">3U-川航</option>
                    <option value="8C">8C-东星</option>
                    <option value="8L">8L-祥鹏</option>
                    <option value="9C">9C-春秋</option>
                    <option value="BK">BK-奥凯</option>
                    <option value="CA">CA-国航</option>
                    <option value="CN">CN-新华</option>
                    <option value="CZ">CZ-南航</option>
                    <option value="DR">DR-瑞丽航空</option>
                    <option value="DZ">DZ-东海</option>
                    <option value="EU">EU-成都(鹰联)</option>
                    <option value="FM">FM-上航</option>
                    <option value="FU">FU-福州航空</option>
                    <option value="G5">G5-华夏</option>
                    <option value="GJ">GJ-长龙航空</option>
                    <option value="GS">GS-天津</option>
                    <option value="GX">GX-广西航空</option>
                    <option value="GY">GY-多彩贵州航空</option>
                    <option value="HO">HO-吉祥</option>
                    <option value="HU">HU-海航</option>
                    <option value="JD">JD-首都(金鹿)</option>
                    <option value="JR">JR-幸福</option>
                    <option value="KN">KN-联航</option>
                    <option value="KY">KY-昆航</option>
                    <option value="MF">MF-厦航</option>
                    <option value="MU">MU-东航</option>
                    <option value="NS">NS-河北</option>
                    <option value="PN">PN-西部</option>
                    <option value="QW">QW-青岛</option>
                    <option value="SC">SC-山东</option>
                    <option value="TV">TV-西藏</option>
                    <option value="UQ">UQ-乌鲁木齐航空</option>
                    <option value="VD">VD-鲲鹏</option>
                    <option value="Y8">Y8-扬子江快运航空</option>
                    <option value="YI">YI-英安</option>
                    <option value="ZH">ZH-深航</option>
                </select>
            </div>

            <button type="button" class="btn btn-warning mar-left-10" onclick="search_button_method()">搜索</button>
        </form>
    </div>
</div>
<!-- 搜索结束 -->

<!-- 已选择航班及航程 -->
<div class="container mar-bottom-15 qc3 " style=" display:none;">
    <div class="hangbanlist">
        <h4>已选择的航班及舱位信息</h4>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-hover table-striped font12">
            <tr class="">
                <th>&nbsp;</th>
                <th>航线</th>
                <th>起抵机场</th>
                <th>起抵时间</th>
                <th>航班信息</th>
                <th>机票单价</th>
                <th>基建燃油费</th>
                <th>&nbsp;</th>
            </tr>
            <tr>
                <td><span class="label label-primary ">去程</span></td>
                <td id="go_back1">上海-呼和浩特<br>2016-02-29</td>
                <td id="go_back_airport1">上海虹桥机场T2<br>白塔机场</td>
                <td id="dep_arr_time1">07:15<br>10:25</td>
                <td id="name_seat_type1">东方航空 MU5459<br>经济舱</td>
                <td><strong class="rmb orange-f60 font16" id="money1">￥1020</strong></td>
                <td><strong class="rmb ">￥50</strong></td>
                <td><a href="#" onclick="adjust_qucheng()">更改</a></td>
                <li class="w-percentage-20 text-center" id="flight_order_id1"> </li>
            </tr>
        </table>
    </div>

</div>
<div class="container mar-bottom-15 qc4 " style=" display:none;">
    <div class="hangbanlist">
        <h4>已选择的航班及舱位信息</h4>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-hover table-striped font12" style="margin-bottom:0;">
            <tr class="">
                <th>&nbsp;</th>
                <th>航线</th>
                <th>起抵机场</th>
                <th>起抵时间</th>
                <th>航班信息</th>
                <th>机票单价</th>
                <th>基建燃油费</th>
                <th>&nbsp;</th>
            </tr>
            <tr>
                <td><span class="label label-primary ">去程</span></td>
                <td id="go_back2">上海-呼和浩特<br>2016-02-29</td>
                <td id="go_back_airport2">上海虹桥机场T2<br>白塔机场</td>
                <td id="dep_arr_time2">07:15<br>10:25</td>
                <td id="name_seat_type2">东方航空 MU5459<br>经济舱</td>
                <td><strong class="rmb orange-f60 font16" id="money2">￥1020</strong></td>
                <td><strong class="rmb ">￥50</strong></td>
                <td><a href="#"onclick="adjust_all_qucheng()">更改</a></td>
                <li class="w-percentage-20 text-center" id="flight_order_id2"> </li>
            </tr>
            <tr>
                <td><span class="label label-primary ">返程</span></td>
                <td id="go_back3">呼和浩特-上海<br>2016-02-29</td>
                <td id="go_back_airport3">白塔机场<br>上海虹桥机场T2</td>
                <td id="dep_arr_time3">07:15<br>10:25</td>
                <td id="name_seat_type3">东方航空 MU5460<br>经济舱</td>
                <td><strong class="rmb orange-f60 font16" id="money3">￥480</strong></td>
                <td><strong class="rmb ">￥50</strong></td>
                <td><a href="#" onclick="adjust_all_fancheng()">更改</a></td>
                <li class="w-percentage-20 text-center" id="flight_order_id3"> </li>
            </tr>
        </table>
        <div class=" pad-15 text-right bor-top-solid-1"><button type="submit" class="btn btn-warning mar-left-20" onClick="turn_to_order()">确定预订</button></div>
    </div>

</div>
<!-- 已选择航班及航程 结束 -->

<div class="qc5">
    <!-- 日期开始 -->
    <div class="container mar-bottom-15 ">
        <div class=" bor-solid-1" style=" background:#EFF2F5;">
            <div class="arrow-left" onclick="turn_to_seven_before()"><a href="#" style="">&nbsp;</a></div>
            <div class="arrow-right" onclick="turn_to_seven_later()"><a href="#" style="">&nbsp;</a></div>
            <ul class="nav nav-tabs nav-justified " id="date_week">
                <li role="presentation" class="active"><a href="#">01-11<br>周一</a></li>
                <li role="presentation"><a href="#">01-12<br>周二</a></li>
                <li role="presentation"><a href="#">01-13<br>周三</a></li>
                <li role="presentation"><a href="#">01-14<br>周四</a></li>
                <li role="presentation"><a href="#">01-15<br>周五</a></li>
                <li role="presentation"><a href="#">01-16<br>周六</a></li>
                <li role="presentation"><a href="#">01-17<br>周日</a></li>
            </ul>

        </div>
    </div>
    <!-- 日期结束 -->

    <!-- 列表开始 -->
    <div class="container mar-bottom-30 ">
        <div  class="hangbanlist">
            <div id="first_recording">
                <ul class="list-inline bor-bottom-solid-1  ">
                    <li class="w-percentage-25"><img src="/images/air/3U.png" width="24" height="24" id="plane_name_id1"> <strong name="carrier_id" id="carrier_id_id1" > 川航</strong><strong name="flight_no" id="flight_no_id1">3U8891</strong><span class="gray-999 font12 mar-left-10"name="air_name"id="air_name_id1">机型：空客320（中）</span></li>
                    <li class="text-right w80"> <strong class="time"id="dep_time_id1"name="dep_time">16:30</strong></li>
                    <li class=""> —— </li>
                    <li class="w80"> <strong class="time "id="arr_time_id1"name="arr_time">23:30</strong></li>
                    <li class="w100 text-right"name="dep_airport"id="dep_airport_id1"> 成都双流T2</li>
                    <li class=""> —— </li>
                    <li class=" w100"name="arr_airport"id="arr_airport_id1"> 北京首都T1 </li>
                    <li class="w100 text-right"name="dep_city"id="dep_city_id1"> 成都</li>
                    <li class=""> —— </li>
                    <li class=" w100"name="arr_city"id="arr_city_id1"> 北京 </li>
                    <li class=" w100"name="dep_date"id="dep_date1"> 出发日期： </li>
                    <li class="w-percentage-20 text-center"> <span class="gray-999 ">机建 + 燃油：</span><span class="gray-999 rmb font12">￥50 + ￥20</span></li>
                    <li class="w-percentage-20 text-center" id="flight_id1"> </li>
                </ul>
                <div class="hangbanlist-body qc1" style=" background-color:#FEFCFC;">
                <ul class="list-inline">
                    <li class="w-percentage-20" id="seat_type_first1">头等舱</li>
                    <li  class="w-percentage-25">座位数：<span id="seat_amount_top1" name="seat_amount">50</span></li>
                    <li  class="w-percentage-25">票面价：￥<span class="rmb" name="seat_price" id="seat_price_top1">1070</span></li>


                    <li class="w-percentage-20 ">会员优惠价：￥<strong class="rmb orange-f60 font16" id="seat_price_top1_cheap">1020</strong> </li>
                    <li class="pull-right"><button type="button" class="btn btn-danger btn-sm qucheng" id="decide_first1">选定去程</button></li>
                </ul>
                <ul class="list-inline">
                    <li class="w-percentage-20" id="seat_type_second1">商务舱</li>
                    <li  class="w-percentage-25">座位数：<span id="seat_amount_second1" name="seat_amount">50</span></li>
                    <li  class="w-percentage-25">票面价：￥<span class="rmb" name="seat_price" id="seat_price_second1">1070</span></li>



                    <li class="w-percentage-20 ">会员优惠价：￥<strong class="rmb orange-f60 font16"id="seat_price_second1_cheap">998</strong></li>
                    <li class="pull-right"><button type="button" class="btn btn-danger btn-sm  qucheng" id="decide_second1">选定去程</button></li>
                </ul>
                <!-- 更多舱位 -->
                <div class="panel1" style="display:none;  background-color:#FEFCFC;">
                    <ul class="list-inline">
                        <li class="w-percentage-20"id="seat_type_third1">经济舱</li>
                        <li  class="w-percentage-25">座位数：<span id="seat_amount_third1" name="seat_amount">50</span></li>
                        <li  class="w-percentage-25">票面价：￥<span class="rmb" name="seat_price" id="seat_price_third1">1070</span></li>


                        <li  class="w-percentage-20 ">会员优惠价：￥<strong class="rmb orange-f60 font16"id="seat_price_third1_cheap">1020</strong></li>
                        <li class="pull-right"><button type="button" class="btn btn-danger btn-sm  qucheng" id="decide_third1">选定去程</button></li>
                    </ul>
                    <ul class="list-inline">
                        <li class="w-percentage-20"><strong class=" red" id="seat_type_fourth1">特惠</strong></li>
                        <li  class="w-percentage-25">座位数：<span id="special_amount1">10</span></li>
                        <li  class="w-percentage-25">票面价：￥<span class="rmb" id="special_price1">2980</span></li>


                        <li  class="w-percentage-20 ">会员优惠价：￥<strong class="rmb orange-f60 font16" id="special_price_cheap1">2560</strong></li>
                        <li class="pull-right "><button type="button" class="btn btn-danger btn-sm qucheng" id="decide_fourth1">选定去程</button></li>
                    </ul>
                </div>
                <!-- 更多舱位 结束 -->
                <div class=" lh30 text-right"> <a href="#" class="mar-right-20 font12 flip1" >更多舱位</a></div>
            </div>
            </div>
                <!-- 表头 -->

                <!-- 表头结束 -->
                <!-- 表BODY -->
                <%--<div class="collapse " id="collapseExample2" style=" display:block;">--%>

                    <!-- 表头 -->
                    <div id="second_recording">
                        <ul class="list-inline bor-bottom-solid-1  ">
                        <li class="w-percentage-25"><img src="/images/air/CA.png" width="24" height="24"id="plane_name_id2"> <strong name="carrier_id" id="carrier_id_id2">国航</strong> </strong> <strong name="flight_no" id="flight_no_id2">CA4109</strong><span class="gray-999 font12 mar-left-10"name="air_name"id="air_name_id2">机型：空客320（中）</span></li>
                        <li class="text-right w80"> <strong class="time" id="dep_time_id2" name="dep_time">16:30</strong></li>
                        <li class=""> —— </li>
                        <li class="w80"> <strong class="time" id="arr_time_id2"name="arr_time">23:30</strong></li>
                        <li class="w100 text-right"name="dep_airport"id="dep_airport_id2"> 成都双流T2</li>
                        <li class=""> —— </li>
                        <li class=" w100"name="dep_airport"name="arr_airport"id="arr_airport_id2"> 北京首都T1 </li>
                            <li class="w100 text-right"name="dep_city"id="dep_city_id2"> 成都</li>
                            <li class=""> —— </li>
                            <li class=" w100"name="arr_city"id="arr_city_id2"> 北京 </li>
                            <li class=" w100"name="dep_date"id="dep_date2"> 出发日期： </li>
                        <li class="w-percentage-20 text-center"> <span class="gray-999 ">机建 + 燃油：</span><span class="gray-999 rmb font12">￥50 + ￥20</span></li>
                            <li class="w-percentage-20 text-center" id="flight_id2"> </li>
                        </ul>
                        <div class="hangbanlist-body qc2" style="display:block;  background-color:#FEFCFC;">
                        <ul class="list-inline">
                            <li class="w-percentage-20" id="seat_type_first2">头等舱</li>
                            <li  class="w-percentage-25">座位数：<span id="seat_amount_top2" name="seat_amount">≥9</span></li>
                            <li  class="w-percentage-25">票面价：￥<span class="rmb"name="seat_price" id="seat_price_top2">1070</span></li>


                            <li  class="w-percentage-20 ">会员优惠价：￥<strong class="rmb orange-f60 font16"id="seat_price_top2_cheap">1020</strong></li>
                            <li class="pull-right "><button type="button" class="btn btn-danger btn-sm fancheng" id="decide_first2" >选定返程</button></li>
                        </ul>
                        <ul class="list-inline">
                            <li class="w-percentage-20" id="seat_type_second2">商务舱</li>
                            <li  class="w-percentage-25">座位数：<span id="seat_amount_second2" name="seat_amount">≤5</span></li>
                            <li  class="w-percentage-25">票面价：￥<span class="rmb"name="seat_price" id="seat_price_second2">2980</span></li>


                            <li  class="w-percentage-20 ">会员优惠价：￥<strong class="rmb orange-f60 font16"id="seat_price_second2_cheap">2560</strong></li>
                            <li class="pull-right "><button type="button" class="btn btn-danger btn-sm fancheng" id="decide_second2">选定返程</button></li>
                        </ul>
                        <!-- 更多舱位 -->
                        <div class="panel2" style="display:none;  background-color:#FEFCFC;">
                            <ul class="list-inline">
                                <li class="w-percentage-20"id="seat_type_third2">经济舱</li>
                                <li  class="w-percentage-25">座位数：<span id="seat_amount_third2" name="seat_amount">50</span></li>
                                <li  class="w-percentage-25">票面价：￥<span class="rmb"name="seat_price" id="seat_price_third2">1070</span></li>


                                <li  class="w-percentage-20 ">会员优惠价：￥<strong class="rmb orange-f60 font16"id="seat_price_third2_cheap">1020</strong></li>
                                <li class="pull-right "><button type="button" class="btn btn-danger btn-sm fancheng" id="decide_third2">选定返程</button></li>
                            </ul>
                            <ul class="list-inline">
                                <li class="w-percentage-20" id="seat_type_fourth2"><strong class=" red">特惠</strong></li>
                                <li  class="w-percentage-25">座位数：<span id="special_amount2">10</span></li>
                                <li  class="w-percentage-25">票面价：￥<span class="rmb"id="special_price2">2980</span></li>


                                <li  class="w-percentage-20 ">会员优惠价：￥<strong class="rmb orange-f60 font16"id="special_price_cheap2">2560</strong></li>
                                <li class="pull-right "><button type="button" class="btn btn-danger btn-sm fancheng" id="decide_fourth2">选定返程</button></li>
                            </ul>
                        </div>
                        <!-- 更多舱位 结束 -->
                        <div class=" lh30 text-right"> <a href="#" class="mar-right-20 font12 flip2" >更多舱位</a></div>
                    </div>
                    </div>

                    <!-- 表头结束 -->
                    <!-- 表BODY -->
                    <%--<div class="collapse" id="collapseExample" style=" display:block;">--%>

                    </div>

                <!-- 表BODY 结束 -->

            <!-- 分页 -->
            <nav class=" pull-right ">
                <ul id="turn_page" class="pagination">
                    <li id="before">
                        <a href="#" aria-label="Previous" onclick="changet_to_before()">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li id="next">
                        <a href="#" aria-label="Next" onclick="changet_to_next()">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>

                </ul>
            </nav>
            <!-- 分页结束 -->
            <div class="clearfix"></div>
        </div>




    </div>
    <!-- 列表结束 -->
</div>
</div>
<script type="text/javascript">
    $(document).ready(function(){

        $(".flip1").click(function(){  //更多舱位
            $(".panel1").slideToggle("");
        });

        $(".flip2").click(function(){  //更多舱位
            $(".panel2").slideToggle("");
        });

        //开始的时候选择了


        // $(".fancheng").click(function(){
        //     $(".qc2").hide();
        //     $(".qc3").hide();
        //     $(".qc4").show();//qc4里一个就包含了两个
        //     $(".qc5").hide();
        // });


    });
</script>
</body>
</html>

