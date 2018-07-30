<%--
  Created by IntelliJ IDEA.
  User: L
  Date: 2018/3/17
  Time: 20:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.bean.Order_preparebean" %>
<%@ page import="com.Static.Userinfo" %>
<%@ page import="com.Static.RetOrderinfo" %><%--
  Created by IntelliJ IDEA.
  User: L
  Date: 2018/3/16
  Time: 10:45
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
    <title>商旅系统</title>
    <link href="../../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../../css/common.css" rel="stylesheet">
    <link href="../../../css/corptravel.css" rel="stylesheet">
    <link href="../../../css/enterprise.css" rel="stylesheet">
    <!--<link href="../../../js/icheck/skins/all.css" rel="stylesheet" type="text/css">-->
    <!-- IconFont图标 -->
    <link href="../../../css/iconfont.css" rel="stylesheet">
    <script type="text/javascript" src="../../../js/jquery-1.9.1.min.js"></script>
    <script src="../../../js/bootstrap.min.js"></script>
    <!-- 兼容IE8 -->
    <!--[if lte IE 9]>
    <script type="text/javascript" src="../../../js/html5shiv.min.js"></script>
    <script type="text/javascript" src="../../../js/respond.min.js"></script>
    <![endif]-->
    <!-- layer弹框 2.1 -->
    <script type="text/javascript" src="../../../js/layer/layer.js"></script>
    <!-- 日历控件 -->
    <script language="javascript" type="text/javascript" src="../../../js/My97DatePicker/WdatePicker.js"></script>


    <script>
        var go_seat_price;//用来得到取出来的价格
        var dep_city
        var arr_city
        var dep_date
        var go_dep_time
        var go_arr_time
        var go_dep_airport
        var go_arr_airport
        var go_carrier_name
        var go_flight_no
        var go_seat_type
        var back_seat_price;//用来得到取出来的价格
        var back_dep_time
        var back_arr_time
        var back_dep_airport
        var back_arr_airport
        var back_carrier_name
        var back_flight_no
        var back_seat_type
        var total;
        var psg_id;
        var go_flight_id;
        var back_flight_id;

        $(function () {
            //取出结果然后进行赋值
            dep_city='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getDep_city()%>';
            arr_city='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getArr_city()%>';
            dep_date='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getDep_date()%>';
            arr_date='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getArr_date()%>';
            go_dep_time='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getGo_dep_time()%>';
            go_arr_time='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getGo_arr_time()%>';
            go_dep_airport='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getGo_dep_airport()%>';
            go_arr_airport='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getGo_arr_airport()%>';
            go_carrier_name='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getGo_carrier_name()%>';
            go_flight_no='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getGo_flight_no()%>';
            go_seat_type='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getGo_seat_type()%>';
            go_seat_price='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getGo_seat_price()%>';
            go_flight_id='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getGo_flight_id()%>';

            back_seat_price='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getBack_seat_price()%>'
            back_dep_time='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getBack_dep_time()%>';
            back_arr_time='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getBack_arr_time()%>';
            back_dep_airport='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getBack_dep_airport()%>';
            back_arr_airport='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getBack_arr_airport()%>';
            back_carrier_name='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getBack_carrier_name()%>';
            back_flight_no='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getBack_flight_no()%>';
            back_seat_type='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getBack_seat_type()%>';
            back_flight_id='<%=((RetOrderinfo)request.getAttribute("order_preparebean")).getBack_flight_id()%>';


            if(go_seat_type==1){
                go_seat_type="头等舱"
            }
            if(go_seat_type==2){
                go_seat_type="商务舱"
            }
            if(go_seat_type==3){
                go_seat_type="经济舱"
            }
            if(back_seat_type==1){
                back_seat_type="头等舱"
            }
            if(back_seat_type==2){
                back_seat_type="商务舱"
            }
            if(back_seat_type==3){
                back_seat_type="经济舱"
            }

            var go_back=dep_city+"-"+arr_city
            var go_back2=arr_city+"-"+dep_city
            var carrier_name_flight_no=go_carrier_name+" "+go_flight_no
            var carrier_name_flight_no2=back_carrier_name+" "+back_flight_no
            $("#dep_date").text(dep_date)
            $("#dep_date2").text(arr_date)
            $("#go_back_city").text(go_back)
            $("#go_back_city2").text(go_back2)
            $("#seat_type").text(go_seat_type)
            $("#seat_type2").text(back_seat_type)
            $("#dep_time").text(go_dep_time)
            $("#arr_time").text(go_arr_time)
            $("#dep_time2").text(back_dep_time)
            $("#arr_time2").text(back_arr_time)
            $("#dep_airport").text(go_dep_airport)
            $("#dep_airport2").text(back_dep_airport)
            $("#arr_airport").text(go_arr_airport)
            $("#arr_airport2").text(back_arr_airport)
            $("#carrier_name_flight_no").text(carrier_name_flight_no)
            $("#carrier_name_flight_no2").text(carrier_name_flight_no2)
        })



        $(function () {
            var passenger_type=$("#passenger_type option:selected").val()
            $("#passenger_type_show").text("成人票")
            $("#passenger_type_price").text("￥"+go_seat_price+"/人"+"+"+"￥"+back_seat_price+"/人")
            go_seat_price=Number(go_seat_price)
            back_seat_price=Number(back_seat_price)
            total=Number(go_seat_price+back_seat_price+80)
            total=total.toString()
            $("#total_money").text("￥"+total)


            $("#passenger_type").change(function () {
                passenger_type=$("#passenger_type option:selected").val()
                console.log("进入了change函数")
                if(passenger_type=="成人"){
                    console.log("passenger_type:"+passenger_type)
                    $("#passenger_type_show").text("成人票")
                    $("#passenger_type_price").text("￥"+go_seat_price+"/人"+"+"+"￥"+back_seat_price+"/人")
                    total=Number(go_seat_price+back_seat_price+80)
                    total=total.toString()
                    $("#total_money").text("￥"+total)
                }
                if(passenger_type=="儿童"){
                    passenger_type=$("#passenger_type option:selected").val()
                    $("#passenger_type_show").text("儿童票")
                    var child_price=Number(go_seat_price*0.5+back_seat_price*0.5)
                    child_price=child_price.toString()
                    $("#passenger_type_price").text("￥"+go_seat_price*0.5+"/人"+"+"+"￥"+back_seat_price*0.5+"/人")
                    total=Number(child_price)+80
                    total=total.toString()
                    $("#total_money").text("￥"+total)
                }
                if(passenger_type=="婴儿"){
                    passenger_type=$("#passenger_type option:selected").val()
                    $("#passenger_type_show").text("婴儿票")
                    $("#passenger_type_price").text("免费")
                    $("#total_money").text("￥80")
                }
                console.log("此时是否点击了:"+$("#have_read").attr("value"))
            })

        })

        //点击按钮之后跳转过去
        function post_order(){
            var passenger_name=$("#passenger").val()
            var passenger_type=$("#passenger_type option:selected").val()
            var relative_phone=$("#relative_phone").val()
            psg_id=$("#Id_card").val()
            var relative_name=$("#relative_name").val()
            console.log("passenger_name"+passenger_name);
            if(!passenger_name){
                console.log("passenger_name:"+passenger_name)
                alert("请输入乘客名");
            }else if(!psg_id){
                alert("请输入证件号码")
            }else if(!relative_name){
                alert("请输入联系人名")
            }else if(!relative_phone){
                alert("请输入联系电话");
            }else if($("#have_read").is(":checked")==false){
                alert("请确认阅读了重要事项");
            } else{
                //然后把这些内容传到后台去
                var url="<%=basePath%>RetnOrder/turn_to_pay"
                var urlfinal=url+"?"+"passenger_name="+passenger_name+"&relative_phone="+relative_phone+"&passenger_type="
                    +passenger_type+"&psg_id="+psg_id+"&go_flight_id="+go_flight_id+"&back_flight_id="+back_flight_id
                window.location.href=urlfinal
            }
        }

    </script>
</head>
<body >
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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="icon iconfont font14 " style=" vertical-align:middle;"  >&#xe62b;</i>帮助电话：15528088735 <span class="caret"></span></a>
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
    <div class="col-sm-7 container bg-white  pad-bottom-20">
        <!-- 航班信息 -->
        <div style="overflow:hidden;">
            <h3 class="mar-bottom-20" style=" display:block; float:left;">乘机人</h3>
        </div>
        <div>
            <input id ="passenger" name="input" type="text" class="form-control input-sm w300" style=" display: inline-block;" placeholder="姓名，与登机所持证件中的姓名一致">
            <select id="passenger_type" name="select" class="form-control input-sm w150" style=" display: inline-block;">
                <option value="成人" selected="selected" >成人</option>
                <option value="儿童" >儿童（2-12岁）</option>
                <option value="婴儿" >婴儿（14天-2岁）</option>
            </select>
        </div>
        <div class="mar-top-10">
            <select name="select" class="form-control input-sm w150" style=" display: inline-block;">
                <option value="身份证" selected="selected">身份证</option>
            </select>
            <input id="Id_card" name="input" type="text" class="form-control input-sm w300" style=" display: inline-block;" placeholder="证件号码">
        </div>


        <!-- 航班信息 结束 -->

        <!-- 保险 -->
        <div style="position:relative;">
            <h3 class="mar-bottom-20">保险</h3>
            <a href="" class="mar-right-10 safe">航意险</a>
            <select name="select" class="form-control input-sm w150 mar-right-10" style=" display: inline-block;">
                <option value="保险" selected="selected">￥30/份X1</option>

            </select>
            <span>保额￥260万/份</span>

            <!--航意险说明-->
            <div style="width:460px; border:1px solid #C4C4C4; padding:5px; position:absolute; left:0px; top:75px; background-color:#eee;" class="explain">
                <h5>航意险说明</h5>
                <p>1.保险费：<i class="rmb">¥</i>30/份。保险金额及保险责任：<i class="rmb">¥</i>260万/份。航空意外险由太平财产保险有限公司深圳分公司承保。</p>
                <p>2.保险购买即生效，不可单独退保。机票退款后，自动退保。机票改签后，保险责任保护到改签后航班。提供保险定额发票作为报销凭证。</p>
            </div>
        </div>

        <!-- 联系人 -->
        <h3 class="mar-bottom-20">联系人</h3>
        <input name="input" id="relative_name" type="text" class="form-control input-sm" style=" display: inline-block; width:460px;" placeholder="姓名">
        <div class="mar-top-10">
            <select name="select" class="form-control input-sm w110 mar-right-10" style=" display: inline-block;">
                <option value="国家" selected="selected">中国&nbsp;&nbsp;+86</option>
            </select>
            <input name="input" id="relative_phone" type="text" class="form-control input-sm" style=" display: inline-block; width:337px;" placeholder="手机号码，接收航班信息">
        </div>


        <!-- 报销 -->
        <h3 class="mar-bottom-20">报销</h3>
        <input type="checkbox" name="choice" id="check_confrom">&nbsp;需要报销凭证<span style=" color:#999;">（含：行程单和差额发票，快递费发票）</span>
    </div>
    <div class="col-sm-5 bg-gray-eee">
        <div style=" margin-left:-15px;">
            <h4 style="overflow:hidden; margin-left:10px;">
                <span style="display:block; float:left;" id="dep_date">03-16</span>
                <span style="display:block; float:left; margin-left:80px;" id="go_back_city">成都-北京</span>
                <span style=" display:block; float:right;color:#999; font-size:14px; margin-right:5px;"id="seat_type">经济舱</span>
            </h4>
        </div>
        <div style=" overflow:hidden; margin-bottom:20px;">
            <div class="flight-from" style="float:left;">
                <span class="time text-center" id="dep_time">07:00</span><br/>
                <span class="text-center" id="dep_airport">双流机场</span>
            </div>
            <div class="flight-info" style="float:left; margin-left:100px;">
                <img src="/images/a.png">
                <span class="font12 gray-999"></span>
                <img src="/images/b.png"><br/>
                <span class="text-center font12 gray-999 mar-left-10"id="carrier_name_flight_no">西藏航空有限公司 TV6101</span><br/>
                <span class="airline-direct"></span>
                <span class="arrow"></span>
            </div>
            <div class="flight-to" style="float:right;">
                <span class="time text-center" id="arr_time">09:35</span><br/>
                <span class="text-center" id="arr_airport">首都机场</span>
            </div>
        </div>
        <div style=" margin-left:-15px;">
            <h4 style="overflow:hidden; margin-left:10px;">
                <span style="display:block; float:left;" id="dep_date2">03-16</span>
                <span style="display:block; float:left; margin-left:80px;" id="go_back_city2">成都-北京</span>
                <span style=" display:block; float:right;color:#999; font-size:14px; margin-right:5px;"id="seat_type2">经济舱</span>
            </h4>
        </div>
        <div style=" overflow:hidden; margin-bottom:20px;">
            <div class="flight-from" style="float:left;">
                <span class="time text-center" id="dep_time2">07:00</span><br/>
                <span class="text-center" id="dep_airport2">双流机场</span>
            </div>
            <div class="flight-info" style="float:left; margin-left:100px;">
                <img src="/images/a.png">
                <span class="font12 gray-999"></span>
                <img src="/images/b.png"><br/>
                <span class="text-center font12 gray-999 mar-left-10"id="carrier_name_flight_no2">西藏航空有限公司 TV6101</span><br/>
                <span class="airline-direct"></span>
                <span class="arrow"></span>
            </div>
            <div class="flight-to" style="float:right;">
                <span class="time text-center" id="arr_time2">09:35</span><br/>
                <span class="text-center" id="arr_airport2">首都机场</span>
            </div>
        </div>
        <div>
            <div class="tuigaiqian" style="cursor:pointer; color:#337ab7;">退改签说明</div>
            <div class="instruction">
                <table class="table table-bordered" style="height:150px;">
                    <tr>
                        <td>成人票</td>
                        <td>退票扣费</td>
                        <td>改期加收手续费</td>
                        <td>签转</td>
                    </tr>
                    <tr>
                        <td>起飞前24小时之前</td>
                        <td>￥169/人</td>
                        <td>￥368/人</td>
                        <td>可以签转</td>
                    </tr>
                    <tr>
                        <td>起飞前24小时之后</td>
                        <td>￥338/人</td>
                        <td>￥368/人</td>
                        <td>可以签转</td>
                    </tr>
                </table>
            </div>
        </div>

        <div style=" margin-left:-15px; overflow:hidden;">
            <h4 class="mar-left-10" style="display:block; float:left;">订单总额</h4>
            <h4 class="red" style=" display:block; float:right; font-weight:bold;" id="total_money">￥1079</h4>
        </div>
        <table class="table">
            <tr>
                <td id="passenger_type_show">成人票</td>
                <td id="passenger_type_price">￥991/人</td>
                <td>x2</td>
            </tr>
            <tr>
                <td>机建费</td>
                <td>￥50/人</td>
                <td>x1</td>
            </tr>
            <tr>
                <td>航意险</td>
                <td>￥30/人</td>
                <td>x1</td>
            </tr>
        </table>
        <div class="order-discount">
        </div>
    </div>


</div>


<div class="text-center mar-top-10">
    <input type="checkbox" name="choice" id="have_read">&nbsp;我已阅读并接受免责条款、费用扣除、退保等在内的重要事项，其中包括 <a href="">《网络电子客票协议》</a> <a href="">《航意险说明》</a> <a href="">《延误险说明》</a> <a href="">《保险经纪委托协议》</a><br/>
    <input type="button" value="提交订单" class="btn btn-danger mar-top-20" onclick="post_order()" >
</div>


<!-- 添加乘机人弹框 -->
<div id="rev" style="display:none">
    <div class="modal-body" >
        <div>
            <input name="input" type="text" class="form-control input-sm w200" style=" display: inline-block;" placeholder="姓名">
            <select name="select" class="form-control input-sm w150" style=" display: inline-block;">
                <option value="成人" selected="selected">成人</option>
                <option value="儿童">儿童（2-12岁）</option>
                <option value="婴儿">婴儿（14天-2岁）</option>
            </select>
        </div>
        <div class="mar-top-10">
            <select name="select" class="form-control input-sm w150" style=" display: inline-block;">
                <option value="身份证" selected="selected">身份证</option>
            </select>
            <input name="input" type="text" class="form-control input-sm w200" style=" display: inline-block;" placeholder="证件号码">
        </div>
    </div>

    <div class="modal-footer mar-top-5">
        <button type="button" class="btn btn-primary" onClick="">确认添加</button>
        <button type="button" class="btn btn-default" onClick="">取消</button>
    </div>
</div>




<script type="text/javascript">

    $(function() {
        $('.bubbleinfo').each(function() {
            var distance = 10;
            var time = 10;
            var hideDelay = 100;

            var hideDelayTimer = null;

            var beingShown = false;
            var shown = false;
            var trigger = $('.trigger', this);
            var info = $('.popup', this).css('opacity', 0);


            $([trigger.get(0), info.get(0)]).mouseover(function() {
                if (hideDelayTimer) clearTimeout(hideDelayTimer);
                if (beingShown || shown) {
                    // don't trigger the animation again
                    return;
                } else {
                    // reset position of info box
                    beingShown = true;

                    info.css({
                        top: 30,
                        left:0,
                        display: 'block'
                    }).animate({
                        top: '-=' + distance + 'px',
                        opacity: 1
                    }, time, 'swing', function() {
                        beingShown = false;
                        shown = true;
                    });
                }

                return false;
            }).mouseout(function() {
                if (hideDelayTimer) clearTimeout(hideDelayTimer);
                hideDelayTimer = setTimeout(function() {
                    hideDelayTimer = null;
                    info.animate({
                        top: '-=' + distance + 'px',
                        opacity: 0
                    }, time, 'swing', function() {
                        shown = false;
                        info.css('display', 'none');
                    });

                }, hideDelay);

                return false;
            });
        });
    });


</script>





<script>
    $(document).ready(function() {


        $('.zw2').on('click', function(){  //添加乘机人弹框
            layer.open({
                type: 1,
                title: '添加乘机人',
                area: ['400px', 'auto'],
                fix: false, //不固定
                maxmin: false,
                content: $('#rev'),
            });
        });

    });
</script>

<script>
    $('.explain').hide();
    $('.safe').mouseenter(
        function(){
            $('.explain').show();
        }
    ).mouseleave(
        function(){
            $('.explain').hide();
        }
    )

    $('.instruction').hide();
    $('.tuigaiqian').click(
        function(){
            $('.instruction').toggle();
        }
    )
</script>




</body>
</html>

