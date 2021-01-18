<%@ page language="C#" autoeventwireup="true" inherits="cbmsWA.Login" codebehind="Login.aspx.cs" %>

<!DOCTYPE html>
<!--[if IEMobile]><html class="iemobile" lang="en-gb"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en-gb"> <![endif]-->
<!--[if gt IE 8]><!-->
<html slick-uniqueid="3" class=" desktop landscape js csstransforms3d" lang="en-gb">
<!--<![endif]-->
<head runat="server">
    <title>Account Details : Login</title>

    <link href="Content/css.css" rel="stylesheet" type="text/css">


    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <meta name="robots" content="NOINDEX, NOFOLLOW, NOARCHIVE, NOSNIPPET" />

    <link rel="stylesheet" href="Content/facebox.css" type="text/css" />
    <link rel="stylesheet" href="Content/chosen.css" type="text/css" />
    <link rel="stylesheet" href="Content/modal.css" type="text/css" />
    <link rel="stylesheet" href="Content/normalize.css" type="text/css" />
    <link rel="stylesheet" href="Content/font-awesome.css" type="text/css" />
    <link rel="stylesheet" href="Content/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="Content/allvmscripts.css" type="text/css" />
    <%--<link rel="stylesheet" href="Content/virtuemart.css" type="text/css" />--%>
    <link rel="stylesheet" href="Content/animate.css" type="text/css" />
    <link rel="stylesheet" href="Content/template.css" type="text/css" />
    <link rel="stylesheet" href="Content/style.css" type="text/css" />
    <link rel="stylesheet" href="Content/superfish.css" type="text/css" />
    <link rel="stylesheet" href="Content/slicknav.css" type="text/css" />
    <style type="text/css">
        #facebox .content {
            display: block !important;
            height: 480px !important;
            overflow: auto;
            width: 560px !important;
        }
    </style>
    <style type="text/css">
        .cf-hidden {
            display: none;
        }

        .cf-invisible {
            visibility: hidden;
        }
    </style>



    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <!--[if lt IE 9]><div style='clear:both;height:59px;padding:0 15px 0 15px;position:relative;z-index:10000;text-align:center;'><a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a></div><![endif]-->
    <script type="text/javascript">
        var animate = '1';
    </script>

    <style type="text/css">
        .acyregfield label, .acysubscribe label {
            float: left;
            width: 160px;
            text-align: right;
        }

        .acyregfield span label, .acysubscribe .acy_lists label {
            width: auto;
        }

        .acyregfield div:first-of-type, .acyregfield select:first-of-type, .acyregfield input, .acyregfield textarea, .acysubscribe input {
            margin-left: 20px;
        }

        .acyregfield, .acysubscribe {
            clear: both;
            padding-top: 18px;
        }
    </style>

    <script data-cfasync="false" defer="defer" async="" src="Your%20account%20details_files/application2.js"></script>
    <style type="text/css">
        .olark-key, #hbl_code, #olark-data {
            display: none !important;
        }
    </style>
    <link href="Your%20account%20details_files/cbb092d6554938a9549cb716ffcb1f94.css" rel="stylesheet" type="text/css" id="habla_style_div">
    <style type="text/css">
        @media print {
            #habla_beta_container_do_not_rely_on_div_classes_or_names {
                display: none !important;
            }
        }
    </style>
    <style type="text/css">
        .fb_hidden {
            position: absolute;
            top: -10000px;
            z-index: 10001;
        }

        .fb_reposition {
            overflow-x: hidden;
            position: relative;
        }

        .fb_invisible {
            display: none;
        }

        .fb_reset {
            background: none;
            border: 0;
            border-spacing: 0;
            color: #000;
            cursor: auto;
            direction: ltr;
            font-family: "lucida grande", tahoma, verdana, arial, sans-serif;
            font-size: 11px;
            font-style: normal;
            font-variant: normal;
            font-weight: normal;
            letter-spacing: normal;
            line-height: 1;
            margin: 0;
            overflow: visible;
            padding: 0;
            text-align: left;
            text-decoration: none;
            text-indent: 0;
            text-shadow: none;
            text-transform: none;
            visibility: visible;
            white-space: normal;
            word-spacing: normal;
        }

            .fb_reset > div {
                overflow: hidden;
            }

        .fb_link img {
            border: none;
        }

        .fb_dialog {
            background: rgba(82, 82, 82, .7);
            position: absolute;
            top: -10000px;
            z-index: 10001;
        }

        .fb_reset .fb_dialog_legacy {
            overflow: visible;
        }

        .fb_dialog_advanced {
            padding: 10px;
            -moz-border-radius: 8px;
            -webkit-border-radius: 8px;
            border-radius: 8px;
        }

        .fb_dialog_content {
            background: #fff;
            color: #333;
        }

        .fb_dialog_close_icon {
            background: url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/yq/r/IE9JII6Z1Ys.png) no-repeat scroll 0 0 transparent;
            _background-image: url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/yL/r/s816eWC-2sl.gif);
            cursor: pointer;
            display: block;
            height: 15px;
            position: absolute;
            right: 18px;
            top: 17px;
            width: 15px;
        }

        .fb_dialog_mobile .fb_dialog_close_icon {
            top: 5px;
            left: 5px;
            right: auto;
        }

        .fb_dialog_padding {
            background-color: transparent;
            position: absolute;
            width: 1px;
            z-index: -1;
        }

        .fb_dialog_close_icon:hover {
            background: url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/yq/r/IE9JII6Z1Ys.png) no-repeat scroll 0 -15px transparent;
            _background-image: url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/yL/r/s816eWC-2sl.gif);
        }

        .fb_dialog_close_icon:active {
            background: url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/yq/r/IE9JII6Z1Ys.png) no-repeat scroll 0 -30px transparent;
            _background-image: url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/yL/r/s816eWC-2sl.gif);
        }

        .fb_dialog_loader {
            background-color: #f6f7f8;
            border: 1px solid #606060;
            font-size: 24px;
            padding: 20px;
        }

        .fb_dialog_top_left, .fb_dialog_top_right, .fb_dialog_bottom_left, .fb_dialog_bottom_right {
            height: 10px;
            width: 10px;
            overflow: hidden;
            position: absolute;
        }

        .fb_dialog_top_left {
            background: url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/ye/r/8YeTNIlTZjm.png) no-repeat 0 0;
            left: -10px;
            top: -10px;
        }

        .fb_dialog_top_right {
            background: url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/ye/r/8YeTNIlTZjm.png) no-repeat 0 -10px;
            right: -10px;
            top: -10px;
        }

        .fb_dialog_bottom_left {
            background: url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/ye/r/8YeTNIlTZjm.png) no-repeat 0 -20px;
            bottom: -10px;
            left: -10px;
        }

        .fb_dialog_bottom_right {
            background: url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/ye/r/8YeTNIlTZjm.png) no-repeat 0 -30px;
            right: -10px;
            bottom: -10px;
        }

        .fb_dialog_vert_left, .fb_dialog_vert_right, .fb_dialog_horiz_top, .fb_dialog_horiz_bottom {
            position: absolute;
            background: #525252;
            filter: alpha(opacity=70);
            opacity: .7;
        }

        .fb_dialog_vert_left, .fb_dialog_vert_right {
            width: 10px;
            height: 100%;
        }

        .fb_dialog_vert_left {
            margin-left: -10px;
        }

        .fb_dialog_vert_right {
            right: 0;
            margin-right: -10px;
        }

        .fb_dialog_horiz_top, .fb_dialog_horiz_bottom {
            width: 100%;
            height: 10px;
        }

        .fb_dialog_horiz_top {
            margin-top: -10px;
        }

        .fb_dialog_horiz_bottom {
            bottom: 0;
            margin-bottom: -10px;
        }

        .fb_dialog_iframe {
            line-height: 0;
        }

        .fb_dialog_content .dialog_title {
            background: #6d84b4;
            border: 1px solid #3a5795;
            color: #fff;
            font-size: 14px;
            font-weight: bold;
            margin: 0;
        }

            .fb_dialog_content .dialog_title > span {
                background: url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/yd/r/Cou7n-nqK52.gif) no-repeat 5px 50%;
                float: left;
                padding: 5px 0 7px 26px;
            }

        body.fb_hidden {
            -webkit-transform: none;
            height: 100%;
            margin: 0;
            overflow: visible;
            position: absolute;
            top: -10000px;
            left: 0;
            width: 100%;
        }

        .fb_dialog.fb_dialog_mobile.loading {
            background: url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/ya/r/3rhSv5V8j3o.gif) white no-repeat 50% 50%;
            min-height: 100%;
            min-width: 100%;
            overflow: hidden;
            position: absolute;
            top: 0;
            z-index: 10001;
        }

            .fb_dialog.fb_dialog_mobile.loading.centered {
                width: auto;
                height: auto;
                min-height: initial;
                min-width: initial;
                background: none;
            }

                .fb_dialog.fb_dialog_mobile.loading.centered #fb_dialog_loader_spinner {
                    width: 100%;
                }

                .fb_dialog.fb_dialog_mobile.loading.centered .fb_dialog_content {
                    background: none;
                }

        .loading.centered #fb_dialog_loader_close {
            color: #fff;
            display: block;
            padding-top: 20px;
            clear: both;
            font-size: 18px;
        }

        #fb-root #fb_dialog_ipad_overlay {
            background: rgba(0, 0, 0, .45);
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            min-height: 100%;
            z-index: 10000;
        }

            #fb-root #fb_dialog_ipad_overlay.hidden {
                display: none;
            }

        .fb_dialog.fb_dialog_mobile.loading iframe {
            visibility: hidden;
        }

        .fb_dialog_content .dialog_header {
            -webkit-box-shadow: white 0 1px 1px -1px inset;
            background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#738ABA), to(#2C4987));
            border-bottom: 1px solid;
            border-color: #1d4088;
            color: #fff;
            font: 14px Helvetica, sans-serif;
            font-weight: bold;
            text-overflow: ellipsis;
            text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0;
            vertical-align: middle;
            white-space: nowrap;
        }

            .fb_dialog_content .dialog_header table {
                -webkit-font-smoothing: subpixel-antialiased;
                height: 43px;
                width: 100%;
            }

            .fb_dialog_content .dialog_header td.header_left {
                font-size: 12px;
                padding-left: 5px;
                vertical-align: middle;
                width: 60px;
            }

            .fb_dialog_content .dialog_header td.header_right {
                font-size: 12px;
                padding-right: 5px;
                vertical-align: middle;
                width: 60px;
            }

        .fb_dialog_content .touchable_button {
            background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#4966A6), color-stop(.5, #355492), to(#2A4887));
            border: 1px solid #2f477a;
            -webkit-background-clip: padding-box;
            -webkit-border-radius: 3px;
            -webkit-box-shadow: rgba(0, 0, 0, .117188) 0 1px 1px inset, rgba(255, 255, 255, .167969) 0 1px 0;
            display: inline-block;
            margin-top: 3px;
            max-width: 85px;
            line-height: 18px;
            padding: 4px 12px;
            position: relative;
        }

        .fb_dialog_content .dialog_header .touchable_button input {
            border: none;
            background: none;
            color: #fff;
            font: 12px Helvetica, sans-serif;
            font-weight: bold;
            margin: 2px -12px;
            padding: 2px 6px 3px 6px;
            text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0;
        }

        .fb_dialog_content .dialog_header .header_center {
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            line-height: 18px;
            text-align: center;
            vertical-align: middle;
        }

        .fb_dialog_content .dialog_content {
            background: url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/y9/r/jKEcVPZFk-2.gif) no-repeat 50% 50%;
            border: 1px solid #555;
            border-bottom: 0;
            border-top: 0;
            height: 150px;
        }

        .fb_dialog_content .dialog_footer {
            background: #f6f7f8;
            border: 1px solid #555;
            border-top-color: #ccc;
            height: 40px;
        }

        #fb_dialog_loader_close {
            float: left;
        }

        .fb_dialog.fb_dialog_mobile .fb_dialog_close_button {
            text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0;
        }

        .fb_dialog.fb_dialog_mobile .fb_dialog_close_icon {
            visibility: hidden;
        }

        #fb_dialog_loader_spinner {
            animation: rotateSpinner 1.2s linear infinite;
            background-color: transparent;
            background-image: url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/yD/r/t-wz8gw1xG1.png);
            background-repeat: no-repeat;
            background-position: 50% 50%;
            height: 24px;
            width: 24px;
        }

        @keyframes rotateSpinner {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }

        .fb_iframe_widget {
            display: inline-block;
            position: relative;
        }

            .fb_iframe_widget span {
                display: inline-block;
                position: relative;
                text-align: justify;
            }

            .fb_iframe_widget iframe {
                position: absolute;
            }

        .fb_iframe_widget_fluid_desktop, .fb_iframe_widget_fluid_desktop span, .fb_iframe_widget_fluid_desktop iframe {
            max-width: 100%;
        }

            .fb_iframe_widget_fluid_desktop iframe {
                min-width: 220px;
                position: relative;
            }

        .fb_iframe_widget_lift {
            z-index: 1;
        }

        .fb_hide_iframes iframe {
            position: relative;
            left: -10000px;
        }

        .fb_iframe_widget_loader {
            position: relative;
            display: inline-block;
        }

        .fb_iframe_widget_fluid {
            display: inline;
        }

            .fb_iframe_widget_fluid span {
                width: 100%;
            }

        .fb_iframe_widget_loader iframe {
            min-height: 32px;
            z-index: 2;
            zoom: 1;
        }

        .fb_iframe_widget_loader .FB_Loader {
            background: url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/y9/r/jKEcVPZFk-2.gif) no-repeat;
            height: 32px;
            width: 32px;
            margin-left: -16px;
            position: absolute;
            left: 50%;
            z-index: 4;
        }
    </style>
</head>


<body class="all user" onload="setInterval('updateClock()', 200);">
    <form id="form1" runat="server" autocomplete="off">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="wrapper" class="z-index">
            <div class="cotainer-top">

                <div style="position: relative; top: 0px;" class="top-row">
                    <div class="top">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-2 col-lg-2 col-sm-2">
                                    <div class="navigation">
                                        <i class="fa fa-bars dropdown-toggle" type="button"></i>
                                    </div>

                                </div>
                                <div class="col-md-10 col-lg-10 col-sm-10">
                                    <div class="moduletable moduletable__top-menu mod_menu">
                                        <div class="module_content">
                                            <ul class="menu menu__inline">
                                                <li class="item-302"><a>
                                                    <asp:label font-size="16" font-bold="true" runat="server" id="clock"></asp:label>
                                                </a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="module_header">
                                    </div>
                                    <div class="module_content">




                                        <div class="vmCartModule" id="vmCartModule">

                                            <div id="hiddencontainer" style="display: none">
                                                <div class="container">
                                                    <div class="wrapper marg-bot sp">
                                                        <div class="spinner"></div>

                                                        <div class="image">
                                                        </div>
                                                        <div class="fleft">
                                                            <div class="product_row">
                                                                <span class="product_name"></span>
                                                                <div class="clear"></div>
                                                                <span class="quantity"></span>
                                                                <div class="prices" style="display: inline;"></div>
                                                                <a class="vm2-remove_from_cart" onclick="remove_product_cart(this);"><i class="fa fa-times-circle"></i><span class="product_cart_id" style="display: none;"></span></a>
                                                            </div>
                                                            <div class="product_attributes"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: none;" id="cart_list">
                                                <div class="text-cart">
                                                </div>
                                                <div class="vm_cart_products" id="vm_cart_products">
                                                </div>
                                                <div class="total">
                                                </div>
                                                <div class="show_cart">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="position: relative; display: block; height: 0px;" class="pseudoStickyBlock"></div>

            <div class="header-row">
                <div class="header">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3 col-lg-3 col-sm-3">
                                <div class="logo-fleft">

                                    <div class="site-logo site-logo__header">
                                        <a class="site-logo_link">
                                            <img runat="server" class="site-logo_img" src="images/nedco.jpg" alt="" style="margin-top:-20px;margin-bottom:-20px; height: 60px; width: 200px;"/>
                                        </a>
                                        <span class="site-desc"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-9 col-lg-9 col-sm-9">
                                <div class="moduletable  mod_custom">
                                    <div class="module_content">
                                        <div class="custom">
                                            <ul>
                                                <li style="font-weight: 600; font-size: 25px; letter-spacing: 5px; color: #13b1ec;"><i class="fa fa-4x fa-users"></i>CUSTOMER BILLING MANAGEMENT SYSTEM</li>
                                                <%--<li><i class="fa fa-thumbs-o-up">&nbsp;</i>SATISFACTION 100% GUARANTEED</li>
<li><i class="fa fa-refresh">&nbsp;</i>14 DAY EASY RETURN</li>
<li><i class="fa fa-mobile">&nbsp;</i>800-2345-6789</li>--%>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>


        <div class="main-row">
            <div class="container">
                <div class="main">
                    <div class="row">
                        <div class="col-md-12">

                            <div class="top-content">
                                <%--<div class="moduletable  mod_search">
<div class="module_content">

</div>
</div>--%>
                                <div class="moduletable   mod_breadcrumbs">
                                    <div class="module_content">
                                        <div class="breadcrumbs ">
                                            <ol class="breadcrumb">
                                                <li class="showHere">You are here: </li>
                                                <li><a class="pathway">Sign in</a></li>
                                                <li>Your account details</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div>
                                <div class="clear"></div>
                            </div>

                            <div class="main-content">


                                <div class="page account-view">
                                    <div class="page_heading">
                                        <h1 class="page_title">Your account details</h1>
                                    </div>
                                    <div class="form-login">
                                        <div id="com-form-login" action="" method="post" name="com-login">
                                            <div>
                                                <asp:label runat="server" id="result" font-bold="True" forecolor="Red"></asp:label>
                                                <h2 class="login">&nbsp;Please login here</h2>
                                            </div>
                                            <div class="container2">
                                                <div class="row">
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="form-group">
                                                            <div id="com-form-login-username">
                                                                <label class="sr-only" for="">Username</label>
                                                                <asp:textbox id="username" cssclass="form-control inputbox" runat="server"></asp:textbox>
                                                                <asp:requiredfieldvalidator id="RequiredFieldValidator1" errormessage="required" font-bold="true" forecolor="red" controltovalidate="password" display="Dynamic" validationgroup="lgn" runat="server"></asp:requiredfieldvalidator>
                                                               <%-- <asp:TextBox ID="ac" runat="server" >ere</asp:TextBox>--%>
                                                                <%--<input name="username" id="username" runat="server" class="form-control inputbox" alt="Username" placeholder="Username" type="text">--%>
                                                            </div>
                                                        </div>
                                                        <div class="checkbox">
                                                            <div id="com-form-login-remember" style="margin-left: -30px">
                                                                <asp:checkbox id="rememberme" text="Remember me" runat="server" Visible="False" />

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12">
                                                        <div class="row">
                                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                                <div class="form-group">
                                                                    <div id="com-form-login-password">
                                                                        <label class="sr-only" for="">Password</label>
                                                                        <asp:textbox id="password" cssclass="form-control inputbox" textmode="Password" runat="server" AutoComplete="nope"></asp:textbox>
                                                                        <asp:requiredfieldvalidator controltovalidate="password" errormessage="required" font-bold="true" forecolor="Red" display="Dynamic" validationgroup="lgn" runat="server"></asp:requiredfieldvalidator>
                                                                        <%--<input id="password" name="password" runat="server" class="form-control inputbox" alt="Password" placeholder="Password" type="password">--%>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                                <asp:button runat="server" id="btnLogin" cssclass="btn btn-primary" height="38px" validationgroup="lgn" text="Login" onclick="btnLogin_Click"></asp:button>
                                                            </div>
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <ul class="list__login-links">
                                                                    <%--<li>
<a href="" rel="nofollow">
Forgot your username?</a>
</li>--%>
                                                                    <%--<li class="or">or</li>--%>
                                                                    <%--<li>
<a href="" rel="nofollow">
Forgot your password?</a>
</li>--%>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <input name="task" value="user.login" type="hidden">
                                            <input name="option" value="com_users" type="hidden">
                                            <input name="return" value="aHR0cDovL2xpdmVkZW1vMDAudGVtcGxhdGUtaGVscC5jb20vdmlydHVlbWFydF81MzUwNC9pbmRleC5waHAvc2lnbi1pbg==" type="hidden">
                                            <input name="7ded0f7e744cc9c27a204c093bc77e0b" value="1" type="hidden">
                                        </div>
                                    </div>


                                </div>



                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="push"></div>
        <div id="footer">


            <div class="footer-row">
                <div class="container">
                    <div class="footer">
                    </div>
                </div>
            </div>

            <div class="copyright-row">
                <div class="container">
                    <div class="copyright">
                        <div class="moduletable   mod_footer">
                            <div class="module_content">
                                Copyright © 2015. All Rights Reserved.
                            </div>
                        </div>
                        <div class="moduletable   mod_menu">
                            <div class="module_content">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>







    </form>
</body>
</html>
