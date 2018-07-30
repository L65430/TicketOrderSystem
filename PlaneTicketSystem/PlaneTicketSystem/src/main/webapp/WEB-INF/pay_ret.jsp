<%@ page import="com.Static.Userinfo" %>
<%@ page import="com.Static.RetOrderinfo" %><%--
  Created by IntelliJ IDEA.
  User: L
  Date: 2018/3/17
  Time: 21:48
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
<script src="http://cdn.static.runoob.com/libs/jquery/1.10.2/jquery.min.js"></script>
<html lang="zh-CN">
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

    <!-- TAB -->
    <script type="text/javascript" src="../../../js/base.js"></script>
    <script>
        $(document).ready(function() {

            $("#bank-change li").first().prepend("<span class='ico-bank-change'></span>");
            $("#bank-change li").click(function(){
                $(this).prepend("<span class='ico-bank-change'></span>");
                $(this).siblings().children("span.ico-bank-change").remove();
                $(this)
            });
            $("#bank-change2 li").click(function(){
                $(this).prepend("<span class='ico-bank-change'></span>");
                $(this).siblings().children("span.ico-bank-change").remove();
                $(this)
            })
        });

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
        var psg_type
        var psg_name
        var psg_phone



        $(function () {
            //取出结果然后进行赋值
            dep_city='<%=((RetOrderinfo)request.getAttribute("order_info")).getDep_city()%>';
            arr_city='<%=((RetOrderinfo)request.getAttribute("order_info")).getArr_city()%>';
            dep_date='<%=((RetOrderinfo)request.getAttribute("order_info")).getDep_date()%>';
            arr_date='<%=((RetOrderinfo)request.getAttribute("order_info")).getArr_date()%>';
            go_dep_time='<%=((RetOrderinfo)request.getAttribute("order_info")).getGo_dep_time()%>';
            go_arr_time='<%=((RetOrderinfo)request.getAttribute("order_info")).getGo_arr_time()%>';
            go_dep_airport='<%=((RetOrderinfo)request.getAttribute("order_info")).getGo_dep_airport()%>';
            go_arr_airport='<%=((RetOrderinfo)request.getAttribute("order_info")).getGo_arr_airport()%>';
            go_carrier_name='<%=((RetOrderinfo)request.getAttribute("order_info")).getGo_carrier_name()%>';
            go_flight_no='<%=((RetOrderinfo)request.getAttribute("order_info")).getGo_flight_no()%>';
            go_seat_type='<%=((RetOrderinfo)request.getAttribute("order_info")).getGo_seat_type()%>';
            go_seat_price='<%=((RetOrderinfo)request.getAttribute("order_info")).getGo_seat_price()%>';
            go_flight_id='<%=((RetOrderinfo)request.getAttribute("order_info")).getGo_flight_id()%>';

            back_seat_price='<%=((RetOrderinfo)request.getAttribute("order_info")).getBack_seat_price()%>'
            back_dep_time='<%=((RetOrderinfo)request.getAttribute("order_info")).getBack_dep_time()%>';
            back_arr_time='<%=((RetOrderinfo)request.getAttribute("order_info")).getBack_arr_time()%>';
            back_dep_airport='<%=((RetOrderinfo)request.getAttribute("order_info")).getBack_dep_airport()%>';
            back_arr_airport='<%=((RetOrderinfo)request.getAttribute("order_info")).getBack_arr_airport()%>';
            back_carrier_name='<%=((RetOrderinfo)request.getAttribute("order_info")).getBack_carrier_name()%>';
            back_flight_no='<%=((RetOrderinfo)request.getAttribute("order_info")).getBack_flight_no()%>';
            back_seat_type='<%=((RetOrderinfo)request.getAttribute("order_info")).getBack_seat_type()%>';
            back_flight_id='<%=((RetOrderinfo)request.getAttribute("order_info")).getBack_flight_id()%>';

            psg_type='<%=((RetOrderinfo)request.getAttribute("order_info")).getPsg_type()%>';
            psg_name='<%=((RetOrderinfo)request.getAttribute("order_info")).getPsg_name()%>';
            psg_phone='<%=((RetOrderinfo)request.getAttribute("order_info")).getPsg_phone()%>';
            psg_id='<%=((RetOrderinfo)request.getAttribute("order_info")).getPsg_id()%>';

            console.log("此时go_flight_no:"+go_flight_no)

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

            if(psg_type==1){
                psg_type="成人"
            }
            if(psg_type==2){
                psg_type="儿童"
            }
            if(psg_type==3){
                psg_type="婴儿"
            }


            var go_back_city=dep_city+"-"+arr_city
            var go_back_city2=arr_city+"-"+dep_city;
            var carrier_name_flight_no=go_carrier_name+" "+go_flight_no
            var carrier_name_flight_no2=back_carrier_name+" "+back_flight_no
            var dep_date_time=dep_date+" "+go_dep_time
            var dep_date_time2=arr_date+" "+back_dep_time;
            var arr_date_time=dep_date+" "+go_arr_time
            var arr_date_time2=arr_date+" "+back_arr_time
            var psg_type_name=psg_type+":"+psg_name
            go_seat_price=Number(go_seat_price)
            back_seat_price=Number(back_seat_price)
            total="合计:"+"<b>"+(Number(go_seat_price+back_seat_price+80)).toString()+"</b>"
            var seat_price="结算价："+Number(go_seat_price+back_seat_price)
            psg_id="身份证："+psg_id;
            psg_phone="手机："+psg_phone;




            $("#go_back_city").text(go_back_city)
            $("#go_back_city2").text(go_back_city2)
            $("#carrier_name_flight_no").text(carrier_name_flight_no)
            $("#carrier_name_flight_no2").text(carrier_name_flight_no2)
            $("#dep_date_time").html(dep_date_time+"<b>")
            $("#dep_date_time2").html(dep_date_time2+"<b>")
            $("#arr_date_time").html(arr_date_time+"<b>")
            $("#arr_date_time2").html(arr_date_time2+"<b>")
            $("#psg_type_name").text(psg_type_name)
            $("#psg_id").text(psg_id)
            $("#psg_phone").text(psg_phone)
            $("#total_money").html(total)
            $("#seat_type").text(go_seat_type)
            $("#seat_type2").text(back_seat_type)
            $("#seat_price").text(seat_price)

        })

        //立即支付，就是把这些内容都存到订单表里去
        function  pay_immediately() {
            var url="<%=basePath%>RetnOrder/pay_success"
            window.location.href=url
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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="icon iconfont font14 " style=" vertical-align:middle;"  >&#xe62b;</i> 028-12345678 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">（或）028-12345678</a></li>
                        <li><a href="#">（或）028-12345678</a></li>
                        <!--<li role="separator" class="divider"></li>-->
                    </ul>
                </li>

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
                <li  class="active"><a href="../查询列表.html"><i class="icon iconfont icon-nav-block font24" >&#xe620;</i> 在线预订</a></li>
                <li ><a href="../订单管理/订单列表.html"><i class="icon iconfont icon-nav-block font24" >&#xe61c;</i> 订单管理</a></li>

            </ul>
        </div><!-- /.navbar-collapse -->

    </div>
</nav>
<!-- header end -->

<div class="container bg-white box-shadow pad-15 mar-bottom-30" style="margin-top:120px;">
    <!-- 航班信息 -->
    <h3 class="mar-bottom-20">航班信息 <span class="label label-primary font12 mar-left-10" style=" vertical-align:middle;">往返</span></h3>
    <div class="lh30 pad-10 bg-gray-f5">
        <ul class="list-inline ">
            <li class="w-percentage-20" id="go_back_city"><b class="font16">成都 — 乌鲁木齐</b></li>
            <li class="w-percentage-15" id="carrier_name_flight_no">南航 CZ1252</li>
            <li class="w-percentage-15" id="seat_type">S舱(250折)</li>
            <li class="w-percentage-20"><b class="font16" id="dep_date_time">2015-08-27 06:45</b> 起飞</li>
            <li class="w-percentage-20"><b class="font16" id="arr_date_time">2015-08-27 12:45</b> 到达</li>
        </ul>
        <ul class="list-inline ">
            <li class="w-percentage-20" id="go_back_city2"><b class="font16">成都 — 乌鲁木齐</b></li>
            <li class="w-percentage-15" id="carrier_name_flight_no2">南航 CZ1252</li>
            <li class="w-percentage-15" id="seat_type2">S舱(250折)</li>
            <li class="w-percentage-20"><b class="font16" id="dep_date_time2">2015-08-27 06:45</b> 起飞</li>
            <li class="w-percentage-20"><b class="font16" id="arr_date_time2">2015-08-27 12:45</b> 到达</li>
        </ul>
    </div>
    <!-- 航班信息 结束 -->

    <!-- 旅客信息 -->
    <h3 class="mar-bottom-20">订单信息 <small class="mar-left-20 font14">乘客人数：1 人</small></h3>
    <div class="lh30 ">
        <div class=" bor-bottom-solid-d8-1 bor-top-solid-1">
            <ul class="list-inline ">
                <li class="w-percentage-25" id="psg_type_name"></li>
                <li class="w-percentage-25" id="psg_id">身份证：510301198808085555</li>
                <li class="" id="psg_phone">手机：13855559999</li>
            </ul>
            <ul class="list-inline ">
                <li class="w-percentage-25" id="seat_price">价格</li>
                <li class="w-percentage-25">机建/燃油/服务费：50/0/0</li>
                <li class=""><b>保险</b> 30元</li>
                <li class="pull-right" id="total_money">合计：<b>1058</b></li>
            </ul>
        </div>

        <div class="clearfix"></div>
    </div>

    <!-- 旅客信息 结束 -->

    <!-- 支付选择 -->
    <div class="tabbable" >
        <ul class="nav nav-tabs mar-bottom-20">
            <li class="active"><a href="#tab2" data-toggle="tab">第三方支付</a></li>
            <li ><a href="#tab1" data-toggle="tab" >银行卡</a></li>
            <!--<li><a href="#tab3" data-toggle="tab">pos机信息维护</a></li>-->
        </ul>
        <!--list 01-->
        <div class="tab-content">
            <div class="tab-pane bank-block-list2" id="tab1">
                <ul id="bank-change" style=" width:90%; margin-left:auto; margin-right:auto;">
                    <li><img src="/images/wallet/ico-bank/1.gif"></li>
                    <li><img src="/images/wallet/ico-bank/2.gif"></li>
                    <li><img src="/images/wallet/ico-bank/3.gif"></li>
                    <li><img src="/images/wallet/ico-bank/4.gif"></li>
                    <li><img src="/images/wallet/ico-bank/5.gif"></li>
                    <li><img src="/images/wallet/ico-bank/6.gif"></li>
                    <li><img src="/images/wallet/ico-bank/7.gif"></li>
                    <li><img src="/images/wallet/ico-bank/8.gif"></li>
                    <li><img src="/images/wallet/ico-bank/9.gif"></li>
                    <li><img src="/images/wallet/ico-bank/10.gif"></li>
                    <li><img src="/images/wallet/ico-bank/11.gif"></li>
                    <li><img src="/images/wallet/ico-bank/16.gif"></li>
                </ul>
                <div class="clearfix"></div>
                <div class="mar-top-10 mar-bottom-30 pad-15" style=" width:90%; margin-left:auto; margin-right:auto; border:1px solid #EAE4B5; background-color:#FFFBE7;">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="" class="col-sm-5 control-label">银行卡号</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="" placeholder="输入卡号">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-5 control-label">姓名</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="" placeholder="银行卡开户姓名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-5 control-label">证件</label>
                            <div class="col-sm-4">
                                <select name="" class="form-control" style="display:inline-block; width:95px;">
                                    <option>身份证</option>
                                    <option>护照</option>
                                    <option>台胞证</option>
                                    <option>港澳通行证</option>
                                    <option>其它</option>
                                </select>
                                <input type="text" class="form-control" style="display:inline-block; width:205px;" id="" placeholder="输入证件号">
                            </div>

                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-5 control-label">银行预留手机号</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="" placeholder="输入手机号">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-5 control-label">短信验证码</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" style=" display:inline-block; width:100px; " id="" placeholder="输入验证码"> <input type="button" value="免费获取" class="btn btn-primary btn-sm"  >
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <!--list 02-->
            <div class="tab-pane active bank-block-list2" id="tab2">
                <ul id="bank-change2" style=" width:90%; margin-left:auto; margin-right:auto;">
                    <!--<li ><img src="../../../img/wallet/ico-bank/yucunkuan.jpg"></li>-->
                    <li><img src="/images/wallet/ico-bank/zhifubao.jpg"></li>
                    <li><img src="/images/wallet/ico-bank/caifutong.jpg"></li>
                </ul>
                <div class="clearfix"></div>
                <div class="mar-top-10 mar-bottom-30 font16 pad-10" style=" width:90%; margin-left:auto; margin-right:auto; border:1px solid #EAE4B5; background-color:#FFFBE7;">
                    跳转至平台页面支付！
                </div>
                <!--<div class="mar-top-10 mar-bottom-30" style=" width:90%; margin-left:auto; margin-right:auto; border:1px solid #EAE4B5; background-color:#FFFBE7;">
                  <form class="form-horizontal">
                    <div class="form-group">
                      <label for="" class="col-sm-5 control-label">预存款可用余额</label>
                 <div class="col-sm-4">
                   <p class="form-control-static">50000 元</p>
                 </div>
               </div>
               <div class="form-group">
                 <label for="" class="col-sm-5 control-label">授信剩余可用额度</label>
                 <div class="col-sm-4">
                   <p class="form-control-static">100000 元</p>
                 </div>
               </div>
               <div class="form-group">
                 <label for="" class="col-sm-5 control-label">支付密码</label>
                 <div class="col-sm-4">
                   <input type="password" class="form-control" id="" placeholder="Password">
                 </div>
               </div>
             </form>
                </div>-->
            </div>

            <!--list 03-->
            <div class="tab-pane" id="tab3">pos机信息维护···
            </div>

        </div>
    </div>
    <!-- 支付选择 结束 -->



    <div class="clearfix"></div>
    <div class="text-center mar-bottom-10">
        <input type="button" value="立即支付" class="btn btn-danger" onClick="pay_immediately()" >
    </div>

</div>


<!-- 修改联系人弹框 -->
<div id="contact-info" style="display:none">

    <div class="modal-body" >
        <form class="form-horizontal">
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-4 control-label">联系人</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" id="inputEmail3" placeholder="请输入姓名">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-4 control-label">手机号</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" id="inputPassword3" placeholder="请输入手机号">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-4 control-label">座机号</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" id="" placeholder="请输入座机号">
                </div>
            </div>

        </form>
    </div>

    <div class="modal-footer ">
        <label class="mar-right-30" style=" font-weight:normal;"><input name="" type="checkbox" value="" checked> 下次继续使用该联系人</label>

        <button type="button" class="btn btn-primary" onClick="layer.closeAll()">确 定</button>	<button type="button" class="btn btn-default" onClick="layer.closeAll()">关 闭</button>
    </div>
</div>

<!-- 提交订单弹框 -->
<div id="rev" style="display:none">

    <div class="modal-body" >
        <div class="pad-10 ">  <span class="red"> 您购买的保险份数，少于实际预订乘客人数，请确认是否有乘客遗漏了保险。</span></div>

    </div>

    <div class="modal-footer mar-top-5">

        <button type="button" class="btn btn-primary" onClick="layer.closeAll()">返回，核实保险</button>	<button type="button" class="btn btn-default" onClick="location.href='支付.html'">没有问题，继续下一步</button>
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

        $(".clk01").click(function(){  //组织架构
            layer.open({
                type: 2,
                shift: 2,  //出场动画
                area: ['800px', '60%'],
                title :'组织架构',
                shadeClose: true, //开启遮罩关闭
                content: '../企业客户管理/新组织架构.html'
            });
        });

        $('.zw1').on('click', function(){
            layer.open({
                type: 1,
                title: '修改联系人信息',
                area: ['400px', 'auto'],
                fix: false, //不固定
                maxmin: false,
                content: $('#contact-info'),
            });
        });

        $('.zw2').on('click', function(){  //提交订单弹框
            layer.open({
                type: 1,
                title: '提示',
                area: ['400px', 'auto'],
                fix: false, //不固定
                maxmin: false,
                content: $('#rev'),
            });
        });

    });
</script>
</body>
</html>


