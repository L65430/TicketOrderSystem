<%@ page import="com.Static.Userinfo" %>
<%@ page import="com.bean.Orderinfobean" %><%--
  Created by IntelliJ IDEA.
  User: L
  Date: 2018/3/19
  Time: 10:50
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
    <script src="../../../js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../../../js/bootstrap.min.js"></script>
    <!-- 兼容IE8 -->
    <!--[if lte IE 9]>
    <script type="text/javascript" src="../../js/html5shiv.min.js"></script>
    <script type="text/javascript" src="../../js/respond.min.js"></script>
    <![endif]-->

    <!-- layer弹框 2.1 -->
    <script type="text/javascript" src="../../../js/layer/layer.js"></script>
    <script>
        $(document).ready(function() {
            $(".qiye01").click(function(){  //查看企业
                layer.open({
                    type: 1,
                    shift: 2,  //出场动画
                    area: ['400px', '550px'],
                    title :'企业详情',
                    shadeClose: true, //开启遮罩关闭
                    content: '<div class="pad-15">  <form class="form-horizontal">    <div class="form-group">      <label for="label" class="col-sm-4 control-label"><span class="red">*</span> 公司名称</label>      <div class="col-sm-8">        <p class="form-control-static">四川龙翔国际旅行社</p>      </div>    </div>    <div class="form-group">      <label for="label4" class="col-sm-4 control-label"><span class="red">*</span> 所在城市</label>      <div class="col-sm-8">        <p class="form-control-static">成都</p>      </div>    </div>    <div class="form-group">      <label for="label" class="col-sm-4 control-label"><span class="red">*</span> 公司性质</label>      <div class="col-sm-8">        <p class="form-control-static">上市公司</p>      </div>    </div>    <div class="form-group">      <label for="label2" class="col-sm-4 control-label"><span class="red">*</span> 所属行业</label>      <div class="col-sm-8">        <p class="form-control-static">计算机/互联网/通信/电子</p>      </div>    </div>    <div class="form-group">      <label for="label3" class="col-sm-4 control-label">公司规模</label>      <div class="col-sm-8">        <p class="form-control-static">200-500人</p>      </div>    </div>    <div class="form-group">      <label for="" class="col-sm-4 control-label">固定电话</label>      <div class="col-sm-8">        <p class="form-control-static">028-12345678</p>      </div>    </div>    <div class="form-group">      <label for="" class="col-sm-4 control-label">传真</label>      <div class="col-sm-8">        <p class="form-control-static">028-12345678</p>      </div>    </div>    <div class="form-group">      <label for="" class="col-sm-4 control-label">Email</label>      <div class="col-sm-8">        <p class="form-control-static">wangbaoqiang@720u.com</p>     </div>    </div>    <div class="form-group">      <div class="col-sm-offset-4 col-sm-8">  <button type="submit" class="btn btn-primary qiye02">修改</button>        <button type="submit" class="btn btn-default" onClick="javascript:window.history.back(-1);">返回</button>      </div>    </div>  </form></div>'
                });
            });

            $(".qiye02").click(function(){  //添加企业
                layer.open({
                    type: 1,
                    shift: 2,  //出场动画
                    area: ['400px', '550px'],
                    title :'添加企业',
                    shadeClose: true, //开启遮罩关闭
                    content: '<div class="pad-15">  <form class="form-horizontal">  <div class="form-group">      <label for="label" class="col-sm-4 control-label"><span class="red">*</span> 公司名称</label>      <div class="col-sm-8">        <input type="text" class="form-control" id="label" placeholder="请输入公司名称" />      </div>    </div>    <div class="form-group">      <label for="label" class="col-sm-4 control-label"><span class="red">*</span> 所在城市</label>      <div class="col-sm-8">        <input type="text" class="form-control" id="label" placeholder="请输入所在城市" />      </div>    </div>    <div class="form-group">      <label for="label" class="col-sm-4 control-label"><span class="red">*</span> 公司性质</label>      <div class="col-sm-8">        <select name="select" class="form-control">          <option>外资 </option>          <option>合资</option>          <option>国企</option>          <option>民营</option>          <option>上市公司</option>          <option>政府机关</option>          <option>事业单位</option>          <option>非盈利机关</option>        </select>      </div>    </div>    <div class="form-group">      <label for="label2" class="col-sm-4 control-label"><span class="red">*</span> 所属行业</label>      <div class="col-sm-8">        <select name="select2" class="form-control">          <option>计算机/互联网/通信/电子 </option>         <option>会计/金融/银行/保险</option>          <option>贸易/消费/制造/营运</option>          <option>制药/医疗</option>          <option>广告/媒体</option>          <option>房地产/建筑</option>          <option>专业服务/教育/培训</option>          <option>服务业</option>          <option>物流/运输</option>          <option>能源/原材料</option>          <option>政府/非盈利机构/其他</option>        </select>      </div>    </div>    <div class="form-group">      <label for="label3" class="col-sm-4 control-label">公司规模</label>      <div class="col-sm-8">        <select name="select3" class="form-control">          <option>少于50人 </option>          <option>50-100人</option>          <option>100-200人</option>          <option>200-500人</option>          <option>500-1000人</option>          <option>1000人以上</option>        </select>      </div>    </div>    <div class="form-group">     <label for="" class="col-sm-4 control-label">固定电话</label>      <div class="col-sm-8">        <input type="text" class="form-control" id="" placeholder="请输入座机号">      </div>    </div>    <div class="form-group">     <label for="" class="col-sm-4 control-label">传真</label>      <div class="col-sm-8">        <input type="text" class="form-control" id="" placeholder="请输入QQ号">      </div>    </div>    <div class="form-group">      <label for="" class="col-sm-4 control-label">Email</label>      <div class="col-sm-8">        <input type="text" class="form-control" id="" placeholder="请输入Email">      </div>    </div>    <div class="form-group">      <div class="col-sm-offset-4 col-sm-8">        <button type="submit" class="btn btn-primary">确定</button>        <button type="submit" class="btn btn-default" onClick="javascript:window.history.back(-1);">取消</button>      </div>    </div></form></div>'
                });
            });

            $(".qiye03").click(function(){  //组织架构
                layer.open({
                    type: 2,
                    shift: 2,  //出场动画
                    area: ['800px', '80%'],
                    title :'组织架构',
                    shadeClose: true, //开启遮罩关闭
                    content: '新组织架构.html'
                });
            });

            $(".qiye04").click(function(){  //参数设置
                layer.open({
                    type: 1,
                    shift: 2,  //出场动画
                    area: ['360px', '180px'],
                    title :'参数设置',
                    shadeClose: true, //开启遮罩关闭
                    content: '<div class=" pad-15 "><form class="form-horizontal">        <div class="form-group">            <label for="inputEmail3" class="col-sm-4 control-label">公司统一后返</label>            <div class="col-sm-8">              <input type="text" class="form-control w100 mar-right-10 " style=" display:inline-block;" id="inputEmail3" placeholder="费率">‰                    </div>          </div> <div class="form-group">            <div class="col-sm-offset-4 col-sm-8">              <button type="submit" class="btn btn-primary" onClick="javascript: history.go(-1);">确定</button>            </div>          </div>        </form>          </div>'
                });
            });

            $(".qiye05").click(function(){  //企业状态
                layer.confirm('您确定要禁用该企业？', {
                    title :'企业状态',
                    btn: ['确定','取消'] //按钮
                }, function(){
                    layer.msg('该企业已禁用', {icon: 1});
                });
            });


        });

        $(function () {
            //就是一个初始化的过程
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

            order_type='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getOrder_type()%>';
            console.log("此时order_type:"+order_type)
            if(order_type==1){//单程
                sg_dep_city='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getSg_dep_city()%>';
                sg_arr_city='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getSg_arr_city()%>';
                sg_dep_date='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getSg_dep_date()%>';
                sg_dep_time='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getSg_dep_time()%>';
                sg_dep_airport='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getSg_dep_airport()%>';
                sg_arr_time='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getSg_arr_time()%>';
                sg_arr_airport='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getSg_arr_airport()%>';
                sg_flight_no='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getSg_flight_id()%>';
                sg_seat_type='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getSg_seat_type()%>';
                order_id='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getOrder_id()%>';
                psg_name='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getPsg_name()%>';
                psg_id='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getPsg_id()%>';
                psg_phone='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getPsg_phone()%>';
                sg_seat_price='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getSg_seat_price()%>';
                psg_type='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getPsg_type()%>';
                console.log("psg_type:"+psg_type)
                //然后插入进去
                $("#dep_city").text(sg_dep_city)
                $("#arr_city").text(sg_arr_city)
                $("#dep_date_time_airport").html(sg_dep_date+"<br/>"+sg_dep_time+"<br/>"+sg_dep_airport)
                $("#arr_date_time_airport").html(sg_dep_date+"<br/>"+sg_arr_time+"<br/>"+sg_arr_airport)
                $("#seat_type").text(sg_seat_type)
                $("#flight_no").text(sg_flight_no)
                $("#order_id").text("100000000"+order_id)
                if(order_type==1){
                    $("#order_type").text("行程(单程)")
                }
                if(order_type==2){
                    $("#order_type").text("行程(往返)")
                }
                if(psg_type=='成人'){
                    $("#psg_name_type").text(psg_name)
                    $("#psg_name_type2").text(psg_name)
                }
                if(psg_type=='儿童'){
                    $("#psg_name_type").text(psg_name+"(儿童)")
                    $("#psg_name_type2").text(psg_name+"(儿童)")
                }
                if(psg_type=='婴儿'){
                    $("#psg_name_type").text(psg_name+"(婴儿)")
                    $("#psg_name_type2").text(psg_name+"(婴儿)")
                }
                $("#psg_id").text(psg_id)
                $("#seat_price").text(sg_seat_price)
                sg_seat_price=Number(sg_seat_price)+50
                $("#seat_price_total").text(sg_seat_price)
                $("#psg_phone").text(psg_phone)
            }
            if(order_type==2){
                console.log("此时order_code:"+order_code)
                order_code='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getOrder_code()%>';
                if(order_code==1){
                    console.log("进入了orer_code=1这里")
                    ret_dep_city='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getRet_dep_city()%>';
                    ret_arr_city='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getRet_arr_city()%>';
                    ret_dep_date='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getRet_dep_date()%>';
                    ret_go_dep_time='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getRet_go_dep_time()%>';
                    ret_go_dep_airport='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getRet_go_dep_airport()%>';
                    ret_go_arr_time='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getRet_go_arr_time()%>';
                    ret_go_arr_airport='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getRet_go_arr_airport()%>';
                    ret_go_flight_no='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getRet_go_flight_no()%>';
                    ret_go_seat_type='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getRet_go_seat_type()%>';
                    order_id='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getOrder_id()%>';
                    psg_name='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getPsg_name()%>';
                    psg_id='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getPsg_id()%>';
                    psg_phone='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getPsg_phone()%>';
                    ret_go_seat_price='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getRet_go_seat_price()%>';
                    psg_type='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getPsg_type()%>';
                    //然后插入进去
                    $("#dep_city").text(ret_dep_city)
                    $("#arr_city").text(ret_arr_city)
                    $("#dep_date_time_airport").html(ret_dep_date+"</br>"+ret_go_dep_time+"</br>"+ret_go_dep_airport)
                    $("#arr_date_time_airport").html(ret_dep_date+"</br>"+ret_go_arr_time+"</br>"+ret_go_arr_airport)
                    $("#seat_type").text(ret_go_seat_type)
                    $("#flight_no").text(ret_go_flight_no)
                    $("#order_id").text("100000000"+order_id)
                    $("#psg_phone").text(psg_phone)
                    if(order_type==1){
                        $("#order_type").text("行程(单程)")
                    }
                    if(order_type==2){
                        $("#order_type").text("行程(往返)")
                    }
                    if(psg_type=='成人'){
                        $("#psg_name_type").text(psg_name)
                        $("#psg_name_type2").text(psg_name)
                    }
                    if(psg_type=='儿童'){
                        $("#psg_name_type").text(psg_name+"(儿童)")
                        $("#psg_name_type2").text(psg_name+"(儿童)")
                    }
                    if(psg_type=='婴儿'){
                        $("#psg_name_type").text(psg_name+"(婴儿)")
                        $("#psg_name_type2").text(psg_name+"(婴儿)")
                    }
                    $("#psg_id").text(psg_id)
                    $("#seat_price").text(ret_go_seat_price)
                    ret_go_seat_price=Number(ret_go_seat_price)+50
                    $("#seat_price_total").text(ret_go_seat_price)
                }
                if(order_code==2){
                    ret_dep_city='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getRet_dep_city()%>';
                    ret_arr_city='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getRet_arr_city()%>';
                    ret_arr_date='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getRet_arr_date()%>';
                    ret_back_dep_time='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getRet_back_dep_time()%>';
                    ret_back_dep_airport='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getRet_back_dep_airport()%>';
                    ret_back_arr_time='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getRet_back_arr_time()%>';
                    ret_back_arr_airport='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getRet_back_arr_airport()%>';
                    ret_back_flight_no='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getRet_back_flight_no()%>';
                    ret_back_seat_type='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getRet_back_seat_type()%>';
                    order_id='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getOrder_id()%>';
                    psg_name='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getPsg_name()%>';
                    psg_id='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getPsg_id()%>';
                    psg_phone='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getPsg_phone()%>';
                    ret_back_seat_price='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getRet_back_seat_price()%>';
                    psg_type='<%=((Orderinfobean)request.getAttribute("orderinfobean")).getPsg_type()%>';
                    //然后插入进去
                    $("#dep_city").text(ret_dep_city)
                    $("#arr_city").text(ret_arr_city)
                    $("#dep_date_time_airport").html(ret_arr_date+"</br>"+ret_back_dep_time+"</br>"+ret_back_dep_airport)
                    $("#arr_date_time_airport").html(ret_arr_date+"</br>"+ret_back_arr_time+"</br>"+ret_back_arr_airport)
                    $("#seat_type").text(ret_back_seat_type)
                    $("#flight_no").text(ret_back_flight_no)
                    $("#order_id").text("100000000"+order_id)
                    if(order_type==1){
                        $("#order_type").text("行程(单程)")
                    }
                    if(order_type==2){
                        $("#order_type").text("行程(往返)")
                    }
                    if(psg_type=='成人'){
                        $("#psg_name_type").text(psg_name)
                        $("#psg_name_type2").text(psg_name)
                    }
                    if(psg_type=='儿童'){
                        $("#psg_name_type").text(psg_name+"(儿童)")
                        $("#psg_name_type2").text(psg_name+"(儿童)")
                    }
                    if(psg_type=='婴儿'){
                        $("#psg_name_type").text(psg_name+"(婴儿)")
                        $("#psg_name_type2").text(psg_name+"(婴儿)")
                    }
                    $("#psg_id").text(psg_id)
                    $("#seat_price").text(ret_back_seat_price)
                    ret_back_seat_price=Number(ret_back_seat_price)+50
                    $("#seat_price_total").text(ret_back_seat_price)
                    $("#psg_phone").text(psg_phone)
                }
            }

        })

        //用于生成保险单号
        function get_scure_id(len) {
            len = len || 32;
            var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';    /****默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1****/
            var maxPos = $chars.length;
            var pwd = '';
            for (i = 0; i < len; i++) {
                pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
            }
            return pwd;
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
                <li  ><a href="<%=basePath%>/Orderlist/turn_to_single"><i class="icon iconfont icon-nav-block font24" >&#xe620;</i> 在线预订</a></li>
                <li class="active"><a href="<%=basePath%>/Orderlist/turn_to_orderlist"><i class="icon iconfont icon-nav-block font24" >&#xe61c;</i> 订单管理</a></li>

            </ul>
        </div><!-- /.navbar-collapse -->

    </div>
</nav>
<!-- header end -->

<!-- 管理模板 -->
<div class="container bg-gray-eee box-shadow mar-bottom-30" style="padding-right:0px; padding-left:0px; position:relative; margin-top:120px;">
    <!-- nav -->

    <!-- nav end -->

    <!-- main -->
    <div class="rightCon">
        <!-- 引导 -->
        <ol class="breadcrumb">
            <li>首页</li>

            <li>订单管理</li>
            <li>订单列表</li>
            <li class="active">订单详情</li>
        </ol>
        <!-- 引导结束 -->

        <h3>订单信息</h3>
        <table border="0" cellspacing="0" cellpadding="0" class="table font12  v-align-top bor-bottom-solid-1" >
            <tr class=" bg-gray-f5">
                <th style="width:20%" id="order_type">行程（单程）</th>
                <th style="width:25%">起飞时间/机场</th>
                <th style="width:25%">到达时间/机场</th>
                <th style="width:15%">航班号</th>
                <th style="width:15%">舱位</th>
            </tr>
            <tr class="">
                <td class="font16"><strong class="blue-0093dd" id="dep_city">三亚</strong> <span class="font12">至</span> <strong class="blue-0093dd" id="arr_city">哈尔滨</strong></td>
                <td><p id="dep_date_time_airport">2015-12-20 <span>11:45 </span>凤凰国际机场</p></td>
                <td><p id="arr_date_time_airport">2015-12-20 <span>14:25 </span>太平国际机场</p></td>
                <td id="flight_no">（国航）HU7360</td>
                <td id="seat_type">经济舱</td>
            </tr>
        </table>
        <table border="0" cellspacing="0" cellpadding="0" class="table font12  v-align-top bor-bottom-solid-1" >
            <tr class="bg-gray-f5">
                <th>订单编号</th>
                <th>订单状态</th>
            </tr>
            <tr class="">
                <td id="order_id">1601151023024030101001106</td>
                <td>已出票</td>
            </tr>

        </table>
        <!--<h5 id="liebiao" class="mar-left-20" style="cursor:pointer; color:#337ab7;" align="right">退改签说明&nbsp;</h5>-->
        <div id="biaoge" style="display:none;">
            <table border="0" cellspacing="0" cellpadding="0" class="table font12  table-bordered table-striped v-align-top bor-bottom-solid-1 mar-left-20" style="width:1100px;">
                <tr class=" bg-gray-f5-f5">
                    <th>乘机人类型</th>
                    <th>退改签时间节点</th>
                    <th>退票手续费</th>
                    <th>改期加收手续费</th>
                    <th>签转</th>
                </tr>
                <tr>
                    <td rowspan="2" class="font16">成人票</td>
                    <td><p>起飞前</p></td>
                    <td>￥355/人</td>
                    <td>￥213/人</td>
                    <td rowspan="2">不可签转<span style="color:#ff0253; font-size:14px; font-weight:bold;"></span></td>
                </tr>
                <tr class="">
                    <td class="bg-white">起飞后</td>
                    <td class="bg-white">只退机建燃油</td>
                    <td class="bg-white">￥355/人</td>
                </tr>

            </table></div>

        <h3>政策备注</h3>
        <div class="lh25 pad-10 mar-bottom-20" style="background-color:#f4f2f2;">签转换开跨月改期收回代理费</div>

        <h3>乘客信息</h3>
        <table border="0" cellspacing="0" cellpadding="0" class="table font12  v-align-top bor-bottom-solid-1" >
            <tr class=" bg-gray-f5">
                <th>乘客姓名</th>
                <th>证件类型</th>
                <th>证件号码</th>
                <th>手机号码</th>
                <th>票面价</th>
                <th>机建燃油</th>
                <th class="text-right">结算价</th>
            </tr>
            <tr class="">
                <td id="psg_name_type">吴光团</td>
                <td>身份证</td>
                <td id="psg_id">350425197011110557</td>
                <td id="psg_phone">18381668542</td>
                <td id="seat_price">850</td>
                <td>50/0</td>
                <td align="right" style="color:#ff0253; font-size:14px; font-weight:bold;" id="seat_price_total">280.00</td>
            </tr>
        </table>

        <h3>保险信息</h3>
        <table border="0" cellspacing="0" cellpadding="0" class="table font12  v-align-top bor-bottom-solid-1" >
            <tr class="bg-gray-f5">
                <th>姓名</th>
                <th>保险名称</th>
                <th>份数</th>
                <th>保单号</th>
                <th>状态</th>
                <th class="text-right">销售价</th>
            </tr>
            <tr class="">
                <td id="psg_name_type2">吴光团</td>
                <td>PICC 航意险 A款</td>
                <td>1份</td>
                <td>605137813164008</td>
                <td>出保成功</td>
                <td align="right" style="color:#ff0253; font-size:14px; font-weight:bold;">40.00</td>
            </tr>
        </table>
        <!--<h3>保险信息</h3>
                <table border="0" cellspacing="0" cellpadding="0" class="table font12  v-align-top bor-bottom-solid-1" >
              <tr class="bg-gray-f5">
                <th>姓名</th>
                <th>保险名称</th>
                <th>单价</th>
                <th>份数</th>
                <th>保单号</th>
                <th>状态</th>
                </tr>
              <tr class="">
                <td>孙靖</td>
                <td>PICC 航意险 A款</td>
                <td>30.00</td>
                <td>1份</td>
                <td>605137813164008</td>
                <td>出保成功</td>
                </tr>
            </table>-->
        <div class="text-center"><input type="button" value="返回" class="btn btn-default" onClick="javascript: history.go(-1);"></div>
        <div class="clearfix"></div>

    </div>


</div>
<!-- main end -->

</div>
<!-- 管理模板 结束 -->


<script type="text/javascript">
    $("#liebiao").click(
        function(){
            $("#biaoge").slideToggle();

        });
</script>


</body>
</html>
