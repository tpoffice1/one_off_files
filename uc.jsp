<%@ page import="io.ipgeolocation.api.IPGeolocationAPI" %>
<%@ page import="io.ipgeolocation.api.GeolocationParams" %>
<%@ page import="com.cars.Constants" %>
<%@ page import="io.ipgeolocation.api.Geolocation" %>
<!DOCTYPE html>
<html>
<head>
<title>Welcome</title>
<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
<meta name="google-signin-client_id" content="135558060565-nvjl5hgo4jf3hbrmrqdvn1oub29cuhdt.apps.googleusercontent.com">
<meta property="og:image" content="/res/img/img_webp/img_webp/logo1.webp"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link rel="stylesheet" href="/res/font-awesome/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<%--    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">--%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%--    <link data-require="datatables@*" data-semver="1.10.12" rel="stylesheet" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"/>--%>
<link data-require="font-awesome@*" data-semver="4.5.0" rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://apis.google.com/js/platform.js?onload=onLoad" async="" defer="" gapi_processed="true"></script>

<style>
    body {
        background-size: 100vw 100vh;
    }

    .card {
        /*padding-top: 20px;*/
        /*margin: 10px 0 20px 0;*/
    / / background-color: rgba(214, 224, 226, 0.2);
        border-top-width: 0;
        border-bottom-width: 2px;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
        -webkit-box-shadow: none;
        -moz-box-shadow: none;
        box-shadow: none;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }

    .card .card-heading {
        padding: 0 20px;
        margin: 0;
    }

    .card .card-heading.simple {
        font-size: 20px;
        font-weight: 300;
        color: #777;
        border-bottom: 1px solid #e5e5e5;
    }

    .card .card-heading.image img {
        display: inline-block;
        width: 46px;
        height: 46px;
        margin-right: 15px;
        vertical-align: top;
        border: 0;
        -webkit-border-radius: 50%;
        -moz-border-radius: 50%;
        border-radius: 50%;
    }

    .card .card-heading.image .card-heading-header {
        display: inline-block;
        vertical-align: top;
    }

    .card .card-heading.image .card-heading-header h3 {
        margin: 0;
        font-size: 14px;
        line-height: 16px;
        color: #262626;
    }

    .card .card-heading.image .card-heading-header span {
        font-size: 12px;
        color: #999999;
    }

    .card .card-body {
        padding: 0 20px;
        margin-top: 20px;
    }

    .card .card-media {
        padding: 0 20px;
        margin: 0 -14px;
    }

    .card .card-media img {
        max-width: 100%;
        max-height: 100%;
    }

    .card .card-actions {
        min-height: 30px;
        padding: 0 20px 20px 20px;
        margin: 20px 0 0 0;
    }

    .card .card-comments {
        padding: 20px;
        margin: 0;
        background-color: #f8f8f8;
    }

    .card .card-comments .comments-collapse-toggle {
        padding: 0;
        margin: 0 20px 12px 20px;
    }

    .card .card-comments .comments-collapse-toggle a,
    .card .card-comments .comments-collapse-toggle span {
        padding-right: 5px;
        overflow: hidden;
        font-size: 12px;
        color: #999;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .card-comments .media-heading {
        font-size: 13px;
        font-weight: bold;
    }

    .card.people {
        position: relative;
        display: inline-block;
        width: 170px;
        height: 300px;
        padding-top: 0;
        margin-left: 20px;
        overflow: hidden;
        vertical-align: top;
    }

    .card.people:first-child {
        margin-left: 0;
    }

    .card.people .card-top {
        position: absolute;
        top: 0;
        left: 0;
        display: inline-block;
        width: 170px;
        height: 150px;
        background-color: #ffffff;
    }

    .card.people .card-top.green {
        background-color: #53a93f;
    }

    .card.people .card-top.blue {
        background-color: #427fed;
    }

    .card.people .card-info {
        position: absolute;
        top: 150px;
        display: inline-block;
        width: 100%;
        height: 101px;
        overflow: hidden;
        background: #ffffff;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }

    .card.people .card-info .title {
        display: block;
        margin: 8px 14px 0 14px;
        overflow: hidden;
        font-size: 16px;
        font-weight: bold;
        line-height: 18px;
        color: #404040;
    }

    .card.people .card-info .desc {
        display: block;
        margin: 8px 14px 0 14px;
        overflow: hidden;
        font-size: 12px;
        line-height: 16px;
        color: #737373;
        text-overflow: ellipsis;
    }

    .card.people .card-bottom {
        position: absolute;
        bottom: 0;
        left: 0;
        display: inline-block;
        width: 100%;
        padding: 10px 20px;
        line-height: 29px;
        text-align: center;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }

    .card.hovercard {
        /*position: relative;*/
        /*padding-top: 0;*/
        /*overflow: hidden;*/
        text-align: center;
    / / background-color: rgba(214, 224, 226, 0.2);
    }

    .card.hovercard .cardheader {
    / / background: url("/res/img/img_webp/img_webp/farazbg.webp");
        background-size: cover;
        /*height: 135px;*/
    / / border: 0 px solid #1C6EA4;
    / / border-radius: 20 px 20 px 0 px 0 px;
    }

    .card.hovercard .avatar {
        /*position: relative;*/
        /*top: -8vh;*/
        /*margin-bottom: -50px;*/

        height: 45vh;
        //width: 100%;
        //margin-top: -5vh;
        background-image: url('/res/img/img_webp/img_webp/ide.webp');
        background-size: cover;
        background-repeat: no-repeat;
        border: #9b9b9b 5px solid;
        box-shadow: 0 0 33px -2px #FFFFFF;
    }

    .card.hovercard .avatar a {
        position: relative;
    }

    .card.hovercard .avatar a img {
        width: 100px;
        height: 100px;
        max-width: 100px;
        max-height: 100px;
    / / -webkit-border-radius: 50 %;
        -moz-border-radius: 50%;
        border-radius: 50%;
        border: 2px solid rgba(0, 0, 0, 0.5);
        filter: invert(100%);
        box-shadow: 0 0 33px -2px #ffffff;
        margin: 0;
        position: inherit;
        top: 30%;

        /*border: none;
        box-shadow: 0 0 43px -2px #FFFFFF;
        filter: invert(0);*/
    }

    .card.hovercard .avatar a img:hover {
        border: none;
        box-shadow: 0 0 43px -2px #FFFFFF;
        /*filter: invert(0);*/
    }

    .card.hovercard .info {
        padding: 4px 8px 10px;
    }

    .card.hovercard .info .title {
        margin-bottom: 4px;
        font-size: 24px;
        line-height: 1;
        color: #262626;
        vertical-align: middle;
    }

    .card.hovercard .info .desc {
        overflow: hidden;
        font-size: 18px;
        line-height: 20px;
        color: black;
    / / #737373;
        text-overflow: ellipsis;
    }

    .card.hovercard .info .desc h1 {
    / / font-size: 4 vw;
    }

    .card.hovercard .info .desc p {
    / / font-size: 4 vw;
    }

    .card.hovercard .bottom {
        padding: 0 20px;
        margin-bottom: 17px;
    }

    .c{
        /*position: absolute;
        top:0;
        bottom: 0;
        left: 0;
        right: 0;*/



        /*margin: auto;*/
    }


    /*img,
    svg {
        position: absolute;
        transform: translate(-50%, -50%);
    }

    img {
        width: 168px;
        height: 196px;
        transform: translate(-50%, -50%) rotate(30deg);
        animation: glow 1.5s linear infinite alternate;
        filter: blur(0px);
        z-index: -10;
        fill: #aaa;
        transition: .2s;
    }

    @keyframes glow {
        from,
        to {
            filter: blur(0px);
        }
        50% {
            filter: blur(80px);
        }
    }

    img:hover+svg {
        fill: rgba(244, 66, 232, 1);
    }*/

    #av1 {
        width: 200px;
        height: 200px;
        border-radius: 100px;
        animation: glow 1s infinite alternate;
    }

    @keyframes glow {
        from {
            box-shadow: 0 0 10px -10px #000000;
        }
        to {
            box-shadow: 0 0 10px 10px #000000;
        }
    }

    p#countdown {
        padding-left: 16px !important;
    }


</style>
</head>
      
// How do I use a reference to an mp4 file here in line 380 instead of a reference to a webp file?
<body style="background-image:url('/res/img/site_background.webp')">

<%--<body style="background-image:url('/res/img/site_background.mp4')">--%>

<%

    boolean showPhone = false;

    String countryCode = (String) request.getAttribute("countryCode");
    if(countryCode!=null)
        showPhone = countryCode.equalsIgnoreCase("us");

%>

<div class="container c">
    <div class="row" style="margin-top: 10%">
        <div class="col-xl-12">

            <div class="card hovercard">
                <div class="cardheader" >
                </div>
                <div class="info" style="width: 100%;color: white">
                    <!--<div class="title">
                        <a target="_blank" href="https://scripteden.com/">Script Eden</a>
                    </div>-->
                    <div class="desc"><h1>COMING SOON</h1></div>
                    <%if(showPhone){%>
                    <div class="desc"><p>Ph/Txt:  254-214-3013</p></div>
                    <%
                        }
                    %>
                    <div class="desc"><p id="countdown">
                        <div class="container" title="Carlist"><div class="desc"><p><button><a href="https://profitsharingprojects.com/carlist" style="text-decoration: none;">Example Project</a></button></p></div>
                        </div>
                        <div class="container" title="Make a Payment"><div class="desc"><p><button><a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=4E9PLQ66JPJFQ" style="text-decoration: none;">Make a Payment</a></button></p></div>
                        </div>
                        <div class="container" title="Schedule a Call"><div class="desc"><p><button><a href="https://calendly.com/tedpenner/meeting-with-ted-penner-from-profitsharingprojects-com" style="text-decoration: none;">Schedule a Call</a></button></p></div>
                    <div id="responseMSG" class="" style="color: white;"></div>
                </div><p></p><p></p>
                <div class="avatar" style="width:60%; margin-left: 20%">
                    <a href="javascript:void(0);" onclick="OpenDialogBox(false);">
                        <img id="av1" alt="" src="/res/img/img_webp/img_webp/java.webp">
                    </a>
                </div>

                <!--
                <div class="bottom">
                    <a class="btn btn-primary btn-twitter btn-sm" href="https://twitter.com/webmaniac">
                        <i class="fa fa-twitter"></i>
                    </a>
                    <a class="btn btn-danger btn-sm" rel="publisher"
                       href="https://plus.google.com/+ahmshahnuralam">
                        <i class="fa fa-google-plus"></i>
                    </a>
                    <a class="btn btn-primary btn-sm" rel="publisher"
                       href="https://plus.google.com/shahnuralam">
                        <i class="fa fa-facebook"></i>
                    </a>
                    <a class="btn btn-warning btn-sm" rel="publisher" href="https://plus.google.com/shahnuralam">
                        <i class="fa fa-behance"></i>
                    </a>
                </div>-->
            </div>

        </div>

    </div>
</div>

<script>
    /*Set the date that we are counting down to under "coming soon"*/
    var countDownDate = new Date("Jun 01, 2022 15:37:25").getTime();

    // Update the count down every 1 second
    var countdownfunction = setInterval(function () {

        // Get todays date and time
        var now = new Date().getTime();

        // Find the distance between now an the count down date
        var distance = countDownDate - now;

        // Time calculations for days, hours, minutes and seconds
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        // Output the result in an element with id="countdown"
        document.getElementById("countdown").innerHTML = days + "d " + hours + "h "
            + minutes + "m " + seconds + "s ";

        // If the count down is over, write some text
        if (distance < 0) {
            clearInterval(countdownfunction);
            document.getElementById("countdown").innerHTML = "EXPIRED";
        }
    }, 1000);
</script>

<div id="landing_dialogue" class="modal fade in" tabindex="-1" data-backdrop="false" role="dialog" aria-labelledby="basicModal" aria-hidden="false">
    <div class="modal-dialog modal-login">
        <div class="modal-content">
            <form id="" method="post" action="LandingData">
                <div class="modal-header">
                    <button id="btn_close_x" type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                    <h4 class="modal-title" id="landing_dialogue_header">PLEASE TELL US ABOUT YOUR PROJECT</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Name</label>
                        <label for="name"></label><input type="text" id="name" name="name" class="form-control" required="required">
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <label for="email"></label><input type="text" id="email" name="email" class="form-control" required="required">
                    </div>
                    <div class="form-group">
                        <label>Phone</label>
                        <div class="iti iti--allow-dropdown iti--separate-dial-code"><div class="iti__flag-container"><div class="iti__selected-flag" role="combobox" aria-controls="iti-0__country-listbox" aria-owns="iti-0__country-listbox" aria-expanded="false" tabindex="0" title="United States: +1" aria-activedescendant="iti-0__item-us-preferred"><div class="iti__flag iti__us"></div><div id="iti_selected_country_code" class="iti__selected-dial-code">+1</div><div class="iti__arrow"></div></div><ul class="iti__country-list iti__hide" id="iti-0__country-listbox" role="listbox" aria-label="List of countries"><li class="iti__country iti__preferred iti__active" tabindex="-1" id="iti-0__item-us-preferred" role="option" data-dial-code="1" data-country-code="us" aria-selected="true"><div class="iti__flag-box"><div class="iti__flag iti__us"></div></div><span class="iti__country-name">United States</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__preferred" tabindex="-1" id="iti-0__item-gb-preferred" role="option" data-dial-code="44" data-country-code="gb" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__gb"></div></div><span class="iti__country-name">United Kingdom</span><span class="iti__dial-code">+44</span></li><li class="iti__divider" role="separator" aria-disabled="true"></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-af" role="option" data-dial-code="93" data-country-code="af" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__af"></div></div><span class="iti__country-name">Afghanistan (‫افغانستان‬‎)</span><span class="iti__dial-code">+93</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-al" role="option" data-dial-code="355" data-country-code="al" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__al"></div></div><span class="iti__country-name">Albania (Shqipëri)</span><span class="iti__dial-code">+355</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-dz" role="option" data-dial-code="213" data-country-code="dz" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__dz"></div></div><span class="iti__country-name">Algeria (‫الجزائر‬‎)</span><span class="iti__dial-code">+213</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-as" role="option" data-dial-code="1" data-country-code="as" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__as"></div></div><span class="iti__country-name">American Samoa</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ad" role="option" data-dial-code="376" data-country-code="ad" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ad"></div></div><span class="iti__country-name">Andorra</span><span class="iti__dial-code">+376</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ao" role="option" data-dial-code="244" data-country-code="ao" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ao"></div></div><span class="iti__country-name">Angola</span><span class="iti__dial-code">+244</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ai" role="option" data-dial-code="1" data-country-code="ai" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ai"></div></div><span class="iti__country-name">Anguilla</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ag" role="option" data-dial-code="1" data-country-code="ag" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ag"></div></div><span class="iti__country-name">Antigua and Barbuda</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ar" role="option" data-dial-code="54" data-country-code="ar" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ar"></div></div><span class="iti__country-name">Argentina</span><span class="iti__dial-code">+54</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-am" role="option" data-dial-code="374" data-country-code="am" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__am"></div></div><span class="iti__country-name">Armenia (Հայաստան)</span><span class="iti__dial-code">+374</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-aw" role="option" data-dial-code="297" data-country-code="aw" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__aw"></div></div><span class="iti__country-name">Aruba</span><span class="iti__dial-code">+297</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-au" role="option" data-dial-code="61" data-country-code="au" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__au"></div></div><span class="iti__country-name">Australia</span><span class="iti__dial-code">+61</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-at" role="option" data-dial-code="43" data-country-code="at" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__at"></div></div><span class="iti__country-name">Austria (Österreich)</span><span class="iti__dial-code">+43</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-az" role="option" data-dial-code="994" data-country-code="az" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__az"></div></div><span class="iti__country-name">Azerbaijan (Azərbaycan)</span><span class="iti__dial-code">+994</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-bs" role="option" data-dial-code="1" data-country-code="bs" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__bs"></div></div><span class="iti__country-name">Bahamas</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-bh" role="option" data-dial-code="973" data-country-code="bh" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__bh"></div></div><span class="iti__country-name">Bahrain (‫البحرين‬‎)</span><span class="iti__dial-code">+973</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-bd" role="option" data-dial-code="880" data-country-code="bd" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__bd"></div></div><span class="iti__country-name">Bangladesh (বাংলাদেশ)</span><span class="iti__dial-code">+880</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-bb" role="option" data-dial-code="1" data-country-code="bb" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__bb"></div></div><span class="iti__country-name">Barbados</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-by" role="option" data-dial-code="375" data-country-code="by" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__by"></div></div><span class="iti__country-name">Belarus (Беларусь)</span><span class="iti__dial-code">+375</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-be" role="option" data-dial-code="32" data-country-code="be" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__be"></div></div><span class="iti__country-name">Belgium (België)</span><span class="iti__dial-code">+32</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-bz" role="option" data-dial-code="501" data-country-code="bz" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__bz"></div></div><span class="iti__country-name">Belize</span><span class="iti__dial-code">+501</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-bj" role="option" data-dial-code="229" data-country-code="bj" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__bj"></div></div><span class="iti__country-name">Benin (Bénin)</span><span class="iti__dial-code">+229</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-bm" role="option" data-dial-code="1" data-country-code="bm" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__bm"></div></div><span class="iti__country-name">Bermuda</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-bt" role="option" data-dial-code="975" data-country-code="bt" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__bt"></div></div><span class="iti__country-name">Bhutan (འབྲུག)</span><span class="iti__dial-code">+975</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-bo" role="option" data-dial-code="591" data-country-code="bo" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__bo"></div></div><span class="iti__country-name">Bolivia</span><span class="iti__dial-code">+591</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ba" role="option" data-dial-code="387" data-country-code="ba" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ba"></div></div><span class="iti__country-name">Bosnia and Herzegovina (Босна и Херцеговина)</span><span class="iti__dial-code">+387</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-bw" role="option" data-dial-code="267" data-country-code="bw" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__bw"></div></div><span class="iti__country-name">Botswana</span><span class="iti__dial-code">+267</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-br" role="option" data-dial-code="55" data-country-code="br" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__br"></div></div><span class="iti__country-name">Brazil (Brasil)</span><span class="iti__dial-code">+55</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-io" role="option" data-dial-code="246" data-country-code="io" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__io"></div></div><span class="iti__country-name">British Indian Ocean Territory</span><span class="iti__dial-code">+246</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-vg" role="option" data-dial-code="1" data-country-code="vg" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__vg"></div></div><span class="iti__country-name">British Virgin Islands</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-bn" role="option" data-dial-code="673" data-country-code="bn" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__bn"></div></div><span class="iti__country-name">Brunei</span><span class="iti__dial-code">+673</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-bg" role="option" data-dial-code="359" data-country-code="bg" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__bg"></div></div><span class="iti__country-name">Bulgaria (България)</span><span class="iti__dial-code">+359</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-bf" role="option" data-dial-code="226" data-country-code="bf" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__bf"></div></div><span class="iti__country-name">Burkina Faso</span><span class="iti__dial-code">+226</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-bi" role="option" data-dial-code="257" data-country-code="bi" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__bi"></div></div><span class="iti__country-name">Burundi (Uburundi)</span><span class="iti__dial-code">+257</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-kh" role="option" data-dial-code="855" data-country-code="kh" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__kh"></div></div><span class="iti__country-name">Cambodia (កម្ពុជា)</span><span class="iti__dial-code">+855</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-cm" role="option" data-dial-code="237" data-country-code="cm" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__cm"></div></div><span class="iti__country-name">Cameroon (Cameroun)</span><span class="iti__dial-code">+237</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ca" role="option" data-dial-code="1" data-country-code="ca" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ca"></div></div><span class="iti__country-name">Canada</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-cv" role="option" data-dial-code="238" data-country-code="cv" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__cv"></div></div><span class="iti__country-name">Cape Verde (Kabu Verdi)</span><span class="iti__dial-code">+238</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-bq" role="option" data-dial-code="599" data-country-code="bq" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__bq"></div></div><span class="iti__country-name">Caribbean Netherlands</span><span class="iti__dial-code">+599</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ky" role="option" data-dial-code="1" data-country-code="ky" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ky"></div></div><span class="iti__country-name">Cayman Islands</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-cf" role="option" data-dial-code="236" data-country-code="cf" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__cf"></div></div><span class="iti__country-name">Central African Republic (République centrafricaine)</span><span class="iti__dial-code">+236</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-td" role="option" data-dial-code="235" data-country-code="td" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__td"></div></div><span class="iti__country-name">Chad (Tchad)</span><span class="iti__dial-code">+235</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-cl" role="option" data-dial-code="56" data-country-code="cl" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__cl"></div></div><span class="iti__country-name">Chile</span><span class="iti__dial-code">+56</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-cn" role="option" data-dial-code="86" data-country-code="cn" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__cn"></div></div><span class="iti__country-name">China (中国)</span><span class="iti__dial-code">+86</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-cx" role="option" data-dial-code="61" data-country-code="cx" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__cx"></div></div><span class="iti__country-name">Christmas Island</span><span class="iti__dial-code">+61</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-cc" role="option" data-dial-code="61" data-country-code="cc" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__cc"></div></div><span class="iti__country-name">Cocos (Keeling) Islands</span><span class="iti__dial-code">+61</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-co" role="option" data-dial-code="57" data-country-code="co" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__co"></div></div><span class="iti__country-name">Colombia</span><span class="iti__dial-code">+57</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-km" role="option" data-dial-code="269" data-country-code="km" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__km"></div></div><span class="iti__country-name">Comoros (‫جزر القمر‬‎)</span><span class="iti__dial-code">+269</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-cd" role="option" data-dial-code="243" data-country-code="cd" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__cd"></div></div><span class="iti__country-name">Congo (DRC) (Jamhuri ya Kidemokrasia ya Kongo)</span><span class="iti__dial-code">+243</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-cg" role="option" data-dial-code="242" data-country-code="cg" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__cg"></div></div><span class="iti__country-name">Congo (Republic) (Congo-Brazzaville)</span><span class="iti__dial-code">+242</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ck" role="option" data-dial-code="682" data-country-code="ck" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ck"></div></div><span class="iti__country-name">Cook Islands</span><span class="iti__dial-code">+682</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-cr" role="option" data-dial-code="506" data-country-code="cr" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__cr"></div></div><span class="iti__country-name">Costa Rica</span><span class="iti__dial-code">+506</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ci" role="option" data-dial-code="225" data-country-code="ci" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ci"></div></div><span class="iti__country-name">Côte d’Ivoire</span><span class="iti__dial-code">+225</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-hr" role="option" data-dial-code="385" data-country-code="hr" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__hr"></div></div><span class="iti__country-name">Croatia (Hrvatska)</span><span class="iti__dial-code">+385</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-cu" role="option" data-dial-code="53" data-country-code="cu" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__cu"></div></div><span class="iti__country-name">Cuba</span><span class="iti__dial-code">+53</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-cw" role="option" data-dial-code="599" data-country-code="cw" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__cw"></div></div><span class="iti__country-name">Curaçao</span><span class="iti__dial-code">+599</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-cy" role="option" data-dial-code="357" data-country-code="cy" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__cy"></div></div><span class="iti__country-name">Cyprus (Κύπρος)</span><span class="iti__dial-code">+357</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-cz" role="option" data-dial-code="420" data-country-code="cz" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__cz"></div></div><span class="iti__country-name">Czech Republic (Česká republika)</span><span class="iti__dial-code">+420</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-dk" role="option" data-dial-code="45" data-country-code="dk" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__dk"></div></div><span class="iti__country-name">Denmark (Danmark)</span><span class="iti__dial-code">+45</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-dj" role="option" data-dial-code="253" data-country-code="dj" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__dj"></div></div><span class="iti__country-name">Djibouti</span><span class="iti__dial-code">+253</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-dm" role="option" data-dial-code="1" data-country-code="dm" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__dm"></div></div><span class="iti__country-name">Dominica</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-do" role="option" data-dial-code="1" data-country-code="do" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__do"></div></div><span class="iti__country-name">Dominican Republic (República Dominicana)</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ec" role="option" data-dial-code="593" data-country-code="ec" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ec"></div></div><span class="iti__country-name">Ecuador</span><span class="iti__dial-code">+593</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-eg" role="option" data-dial-code="20" data-country-code="eg" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__eg"></div></div><span class="iti__country-name">Egypt (‫مصر‬‎)</span><span class="iti__dial-code">+20</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-sv" role="option" data-dial-code="503" data-country-code="sv" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__sv"></div></div><span class="iti__country-name">El Salvador</span><span class="iti__dial-code">+503</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-gq" role="option" data-dial-code="240" data-country-code="gq" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__gq"></div></div><span class="iti__country-name">Equatorial Guinea (Guinea Ecuatorial)</span><span class="iti__dial-code">+240</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-er" role="option" data-dial-code="291" data-country-code="er" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__er"></div></div><span class="iti__country-name">Eritrea</span><span class="iti__dial-code">+291</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ee" role="option" data-dial-code="372" data-country-code="ee" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ee"></div></div><span class="iti__country-name">Estonia (Eesti)</span><span class="iti__dial-code">+372</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-et" role="option" data-dial-code="251" data-country-code="et" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__et"></div></div><span class="iti__country-name">Ethiopia</span><span class="iti__dial-code">+251</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-fk" role="option" data-dial-code="500" data-country-code="fk" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__fk"></div></div><span class="iti__country-name">Falkland Islands (Islas Malvinas)</span><span class="iti__dial-code">+500</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-fo" role="option" data-dial-code="298" data-country-code="fo" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__fo"></div></div><span class="iti__country-name">Faroe Islands (Føroyar)</span><span class="iti__dial-code">+298</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-fj" role="option" data-dial-code="679" data-country-code="fj" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__fj"></div></div><span class="iti__country-name">Fiji</span><span class="iti__dial-code">+679</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-fi" role="option" data-dial-code="358" data-country-code="fi" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__fi"></div></div><span class="iti__country-name">Finland (Suomi)</span><span class="iti__dial-code">+358</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-fr" role="option" data-dial-code="33" data-country-code="fr" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__fr"></div></div><span class="iti__country-name">France</span><span class="iti__dial-code">+33</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-gf" role="option" data-dial-code="594" data-country-code="gf" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__gf"></div></div><span class="iti__country-name">French Guiana (Guyane française)</span><span class="iti__dial-code">+594</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-pf" role="option" data-dial-code="689" data-country-code="pf" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__pf"></div></div><span class="iti__country-name">French Polynesia (Polynésie française)</span><span class="iti__dial-code">+689</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ga" role="option" data-dial-code="241" data-country-code="ga" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ga"></div></div><span class="iti__country-name">Gabon</span><span class="iti__dial-code">+241</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-gm" role="option" data-dial-code="220" data-country-code="gm" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__gm"></div></div><span class="iti__country-name">Gambia</span><span class="iti__dial-code">+220</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ge" role="option" data-dial-code="995" data-country-code="ge" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ge"></div></div><span class="iti__country-name">Georgia (საქართველო)</span><span class="iti__dial-code">+995</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-de" role="option" data-dial-code="49" data-country-code="de" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__de"></div></div><span class="iti__country-name">Germany (Deutschland)</span><span class="iti__dial-code">+49</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-gh" role="option" data-dial-code="233" data-country-code="gh" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__gh"></div></div><span class="iti__country-name">Ghana (Gaana)</span><span class="iti__dial-code">+233</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-gi" role="option" data-dial-code="350" data-country-code="gi" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__gi"></div></div><span class="iti__country-name">Gibraltar</span><span class="iti__dial-code">+350</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-gr" role="option" data-dial-code="30" data-country-code="gr" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__gr"></div></div><span class="iti__country-name">Greece (Ελλάδα)</span><span class="iti__dial-code">+30</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-gl" role="option" data-dial-code="299" data-country-code="gl" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__gl"></div></div><span class="iti__country-name">Greenland (Kalaallit Nunaat)</span><span class="iti__dial-code">+299</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-gd" role="option" data-dial-code="1" data-country-code="gd" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__gd"></div></div><span class="iti__country-name">Grenada</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-gp" role="option" data-dial-code="590" data-country-code="gp" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__gp"></div></div><span class="iti__country-name">Guadeloupe</span><span class="iti__dial-code">+590</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-gu" role="option" data-dial-code="1" data-country-code="gu" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__gu"></div></div><span class="iti__country-name">Guam</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-gt" role="option" data-dial-code="502" data-country-code="gt" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__gt"></div></div><span class="iti__country-name">Guatemala</span><span class="iti__dial-code">+502</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-gg" role="option" data-dial-code="44" data-country-code="gg" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__gg"></div></div><span class="iti__country-name">Guernsey</span><span class="iti__dial-code">+44</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-gn" role="option" data-dial-code="224" data-country-code="gn" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__gn"></div></div><span class="iti__country-name">Guinea (Guinée)</span><span class="iti__dial-code">+224</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-gw" role="option" data-dial-code="245" data-country-code="gw" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__gw"></div></div><span class="iti__country-name">Guinea-Bissau (Guiné Bissau)</span><span class="iti__dial-code">+245</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-gy" role="option" data-dial-code="592" data-country-code="gy" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__gy"></div></div><span class="iti__country-name">Guyana</span><span class="iti__dial-code">+592</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ht" role="option" data-dial-code="509" data-country-code="ht" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ht"></div></div><span class="iti__country-name">Haiti</span><span class="iti__dial-code">+509</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-hn" role="option" data-dial-code="504" data-country-code="hn" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__hn"></div></div><span class="iti__country-name">Honduras</span><span class="iti__dial-code">+504</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-hk" role="option" data-dial-code="852" data-country-code="hk" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__hk"></div></div><span class="iti__country-name">Hong Kong (香港)</span><span class="iti__dial-code">+852</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-hu" role="option" data-dial-code="36" data-country-code="hu" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__hu"></div></div><span class="iti__country-name">Hungary (Magyarország)</span><span class="iti__dial-code">+36</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-is" role="option" data-dial-code="354" data-country-code="is" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__is"></div></div><span class="iti__country-name">Iceland (Ísland)</span><span class="iti__dial-code">+354</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-in" role="option" data-dial-code="91" data-country-code="in" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__in"></div></div><span class="iti__country-name">India (भारत)</span><span class="iti__dial-code">+91</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-id" role="option" data-dial-code="62" data-country-code="id" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__id"></div></div><span class="iti__country-name">Indonesia</span><span class="iti__dial-code">+62</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ir" role="option" data-dial-code="98" data-country-code="ir" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ir"></div></div><span class="iti__country-name">Iran (‫ایران‬‎)</span><span class="iti__dial-code">+98</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-iq" role="option" data-dial-code="964" data-country-code="iq" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__iq"></div></div><span class="iti__country-name">Iraq (‫العراق‬‎)</span><span class="iti__dial-code">+964</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ie" role="option" data-dial-code="353" data-country-code="ie" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ie"></div></div><span class="iti__country-name">Ireland</span><span class="iti__dial-code">+353</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-im" role="option" data-dial-code="44" data-country-code="im" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__im"></div></div><span class="iti__country-name">Isle of Man</span><span class="iti__dial-code">+44</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-il" role="option" data-dial-code="972" data-country-code="il" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__il"></div></div><span class="iti__country-name">Israel (‫ישראל‬‎)</span><span class="iti__dial-code">+972</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-it" role="option" data-dial-code="39" data-country-code="it" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__it"></div></div><span class="iti__country-name">Italy (Italia)</span><span class="iti__dial-code">+39</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-jm" role="option" data-dial-code="1" data-country-code="jm" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__jm"></div></div><span class="iti__country-name">Jamaica</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-jp" role="option" data-dial-code="81" data-country-code="jp" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__jp"></div></div><span class="iti__country-name">Japan (日本)</span><span class="iti__dial-code">+81</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-je" role="option" data-dial-code="44" data-country-code="je" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__je"></div></div><span class="iti__country-name">Jersey</span><span class="iti__dial-code">+44</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-jo" role="option" data-dial-code="962" data-country-code="jo" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__jo"></div></div><span class="iti__country-name">Jordan (‫الأردن‬‎)</span><span class="iti__dial-code">+962</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-kz" role="option" data-dial-code="7" data-country-code="kz" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__kz"></div></div><span class="iti__country-name">Kazakhstan (Казахстан)</span><span class="iti__dial-code">+7</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ke" role="option" data-dial-code="254" data-country-code="ke" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ke"></div></div><span class="iti__country-name">Kenya</span><span class="iti__dial-code">+254</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ki" role="option" data-dial-code="686" data-country-code="ki" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ki"></div></div><span class="iti__country-name">Kiribati</span><span class="iti__dial-code">+686</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-xk" role="option" data-dial-code="383" data-country-code="xk" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__xk"></div></div><span class="iti__country-name">Kosovo</span><span class="iti__dial-code">+383</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-kw" role="option" data-dial-code="965" data-country-code="kw" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__kw"></div></div><span class="iti__country-name">Kuwait (‫الكويت‬‎)</span><span class="iti__dial-code">+965</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-kg" role="option" data-dial-code="996" data-country-code="kg" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__kg"></div></div><span class="iti__country-name">Kyrgyzstan (Кыргызстан)</span><span class="iti__dial-code">+996</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-la" role="option" data-dial-code="856" data-country-code="la" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__la"></div></div><span class="iti__country-name">Laos (ລາວ)</span><span class="iti__dial-code">+856</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-lv" role="option" data-dial-code="371" data-country-code="lv" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__lv"></div></div><span class="iti__country-name">Latvia (Latvija)</span><span class="iti__dial-code">+371</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-lb" role="option" data-dial-code="961" data-country-code="lb" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__lb"></div></div><span class="iti__country-name">Lebanon (‫لبنان‬‎)</span><span class="iti__dial-code">+961</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ls" role="option" data-dial-code="266" data-country-code="ls" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ls"></div></div><span class="iti__country-name">Lesotho</span><span class="iti__dial-code">+266</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-lr" role="option" data-dial-code="231" data-country-code="lr" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__lr"></div></div><span class="iti__country-name">Liberia</span><span class="iti__dial-code">+231</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ly" role="option" data-dial-code="218" data-country-code="ly" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ly"></div></div><span class="iti__country-name">Libya (‫ليبيا‬‎)</span><span class="iti__dial-code">+218</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-li" role="option" data-dial-code="423" data-country-code="li" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__li"></div></div><span class="iti__country-name">Liechtenstein</span><span class="iti__dial-code">+423</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-lt" role="option" data-dial-code="370" data-country-code="lt" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__lt"></div></div><span class="iti__country-name">Lithuania (Lietuva)</span><span class="iti__dial-code">+370</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-lu" role="option" data-dial-code="352" data-country-code="lu" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__lu"></div></div><span class="iti__country-name">Luxembourg</span><span class="iti__dial-code">+352</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-mo" role="option" data-dial-code="853" data-country-code="mo" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__mo"></div></div><span class="iti__country-name">Macau (澳門)</span><span class="iti__dial-code">+853</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-mk" role="option" data-dial-code="389" data-country-code="mk" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__mk"></div></div><span class="iti__country-name">Macedonia (FYROM) (Македонија)</span><span class="iti__dial-code">+389</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-mg" role="option" data-dial-code="261" data-country-code="mg" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__mg"></div></div><span class="iti__country-name">Madagascar (Madagasikara)</span><span class="iti__dial-code">+261</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-mw" role="option" data-dial-code="265" data-country-code="mw" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__mw"></div></div><span class="iti__country-name">Malawi</span><span class="iti__dial-code">+265</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-my" role="option" data-dial-code="60" data-country-code="my" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__my"></div></div><span class="iti__country-name">Malaysia</span><span class="iti__dial-code">+60</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-mv" role="option" data-dial-code="960" data-country-code="mv" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__mv"></div></div><span class="iti__country-name">Maldives</span><span class="iti__dial-code">+960</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ml" role="option" data-dial-code="223" data-country-code="ml" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ml"></div></div><span class="iti__country-name">Mali</span><span class="iti__dial-code">+223</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-mt" role="option" data-dial-code="356" data-country-code="mt" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__mt"></div></div><span class="iti__country-name">Malta</span><span class="iti__dial-code">+356</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-mh" role="option" data-dial-code="692" data-country-code="mh" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__mh"></div></div><span class="iti__country-name">Marshall Islands</span><span class="iti__dial-code">+692</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-mq" role="option" data-dial-code="596" data-country-code="mq" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__mq"></div></div><span class="iti__country-name">Martinique</span><span class="iti__dial-code">+596</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-mr" role="option" data-dial-code="222" data-country-code="mr" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__mr"></div></div><span class="iti__country-name">Mauritania (‫موريتانيا‬‎)</span><span class="iti__dial-code">+222</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-mu" role="option" data-dial-code="230" data-country-code="mu" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__mu"></div></div><span class="iti__country-name">Mauritius (Moris)</span><span class="iti__dial-code">+230</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-yt" role="option" data-dial-code="262" data-country-code="yt" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__yt"></div></div><span class="iti__country-name">Mayotte</span><span class="iti__dial-code">+262</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-mx" role="option" data-dial-code="52" data-country-code="mx" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__mx"></div></div><span class="iti__country-name">Mexico (México)</span><span class="iti__dial-code">+52</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-fm" role="option" data-dial-code="691" data-country-code="fm" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__fm"></div></div><span class="iti__country-name">Micronesia</span><span class="iti__dial-code">+691</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-md" role="option" data-dial-code="373" data-country-code="md" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__md"></div></div><span class="iti__country-name">Moldova (Republica Moldova)</span><span class="iti__dial-code">+373</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-mc" role="option" data-dial-code="377" data-country-code="mc" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__mc"></div></div><span class="iti__country-name">Monaco</span><span class="iti__dial-code">+377</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-mn" role="option" data-dial-code="976" data-country-code="mn" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__mn"></div></div><span class="iti__country-name">Mongolia (Монгол)</span><span class="iti__dial-code">+976</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-me" role="option" data-dial-code="382" data-country-code="me" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__me"></div></div><span class="iti__country-name">Montenegro (Crna Gora)</span><span class="iti__dial-code">+382</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ms" role="option" data-dial-code="1" data-country-code="ms" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ms"></div></div><span class="iti__country-name">Montserrat</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ma" role="option" data-dial-code="212" data-country-code="ma" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ma"></div></div><span class="iti__country-name">Morocco (‫المغرب‬‎)</span><span class="iti__dial-code">+212</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-mz" role="option" data-dial-code="258" data-country-code="mz" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__mz"></div></div><span class="iti__country-name">Mozambique (Moçambique)</span><span class="iti__dial-code">+258</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-mm" role="option" data-dial-code="95" data-country-code="mm" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__mm"></div></div><span class="iti__country-name">Myanmar (Burma) (မြန်မာ)</span><span class="iti__dial-code">+95</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-na" role="option" data-dial-code="264" data-country-code="na" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__na"></div></div><span class="iti__country-name">Namibia (Namibië)</span><span class="iti__dial-code">+264</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-nr" role="option" data-dial-code="674" data-country-code="nr" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__nr"></div></div><span class="iti__country-name">Nauru</span><span class="iti__dial-code">+674</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-np" role="option" data-dial-code="977" data-country-code="np" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__np"></div></div><span class="iti__country-name">Nepal (नेपाल)</span><span class="iti__dial-code">+977</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-nl" role="option" data-dial-code="31" data-country-code="nl" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__nl"></div></div><span class="iti__country-name">Netherlands (Nederland)</span><span class="iti__dial-code">+31</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-nc" role="option" data-dial-code="687" data-country-code="nc" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__nc"></div></div><span class="iti__country-name">New Caledonia (Nouvelle-Calédonie)</span><span class="iti__dial-code">+687</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-nz" role="option" data-dial-code="64" data-country-code="nz" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__nz"></div></div><span class="iti__country-name">New Zealand</span><span class="iti__dial-code">+64</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ni" role="option" data-dial-code="505" data-country-code="ni" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ni"></div></div><span class="iti__country-name">Nicaragua</span><span class="iti__dial-code">+505</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ne" role="option" data-dial-code="227" data-country-code="ne" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ne"></div></div><span class="iti__country-name">Niger (Nijar)</span><span class="iti__dial-code">+227</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ng" role="option" data-dial-code="234" data-country-code="ng" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ng"></div></div><span class="iti__country-name">Nigeria</span><span class="iti__dial-code">+234</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-nu" role="option" data-dial-code="683" data-country-code="nu" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__nu"></div></div><span class="iti__country-name">Niue</span><span class="iti__dial-code">+683</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-nf" role="option" data-dial-code="672" data-country-code="nf" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__nf"></div></div><span class="iti__country-name">Norfolk Island</span><span class="iti__dial-code">+672</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-kp" role="option" data-dial-code="850" data-country-code="kp" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__kp"></div></div><span class="iti__country-name">North Korea (조선 민주주의 인민 공화국)</span><span class="iti__dial-code">+850</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-mp" role="option" data-dial-code="1" data-country-code="mp" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__mp"></div></div><span class="iti__country-name">Northern Mariana Islands</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-no" role="option" data-dial-code="47" data-country-code="no" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__no"></div></div><span class="iti__country-name">Norway (Norge)</span><span class="iti__dial-code">+47</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-om" role="option" data-dial-code="968" data-country-code="om" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__om"></div></div><span class="iti__country-name">Oman (‫عُمان‬‎)</span><span class="iti__dial-code">+968</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-pk" role="option" data-dial-code="92" data-country-code="pk" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__pk"></div></div><span class="iti__country-name">Pakistan (‫پاکستان‬‎)</span><span class="iti__dial-code">+92</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-pw" role="option" data-dial-code="680" data-country-code="pw" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__pw"></div></div><span class="iti__country-name">Palau</span><span class="iti__dial-code">+680</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ps" role="option" data-dial-code="970" data-country-code="ps" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ps"></div></div><span class="iti__country-name">Palestine (‫فلسطين‬‎)</span><span class="iti__dial-code">+970</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-pa" role="option" data-dial-code="507" data-country-code="pa" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__pa"></div></div><span class="iti__country-name">Panama (Panamá)</span><span class="iti__dial-code">+507</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-pg" role="option" data-dial-code="675" data-country-code="pg" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__pg"></div></div><span class="iti__country-name">Papua New Guinea</span><span class="iti__dial-code">+675</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-py" role="option" data-dial-code="595" data-country-code="py" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__py"></div></div><span class="iti__country-name">Paraguay</span><span class="iti__dial-code">+595</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-pe" role="option" data-dial-code="51" data-country-code="pe" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__pe"></div></div><span class="iti__country-name">Peru (Perú)</span><span class="iti__dial-code">+51</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ph" role="option" data-dial-code="63" data-country-code="ph" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ph"></div></div><span class="iti__country-name">Philippines</span><span class="iti__dial-code">+63</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-pl" role="option" data-dial-code="48" data-country-code="pl" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__pl"></div></div><span class="iti__country-name">Poland (Polska)</span><span class="iti__dial-code">+48</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-pt" role="option" data-dial-code="351" data-country-code="pt" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__pt"></div></div><span class="iti__country-name">Portugal</span><span class="iti__dial-code">+351</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-pr" role="option" data-dial-code="1" data-country-code="pr" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__pr"></div></div><span class="iti__country-name">Puerto Rico</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-qa" role="option" data-dial-code="974" data-country-code="qa" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__qa"></div></div><span class="iti__country-name">Qatar (‫قطر‬‎)</span><span class="iti__dial-code">+974</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-re" role="option" data-dial-code="262" data-country-code="re" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__re"></div></div><span class="iti__country-name">Réunion (La Réunion)</span><span class="iti__dial-code">+262</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ro" role="option" data-dial-code="40" data-country-code="ro" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ro"></div></div><span class="iti__country-name">Romania (România)</span><span class="iti__dial-code">+40</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ru" role="option" data-dial-code="7" data-country-code="ru" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ru"></div></div><span class="iti__country-name">Russia (Россия)</span><span class="iti__dial-code">+7</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-rw" role="option" data-dial-code="250" data-country-code="rw" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__rw"></div></div><span class="iti__country-name">Rwanda</span><span class="iti__dial-code">+250</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-bl" role="option" data-dial-code="590" data-country-code="bl" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__bl"></div></div><span class="iti__country-name">Saint Barthélemy</span><span class="iti__dial-code">+590</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-sh" role="option" data-dial-code="290" data-country-code="sh" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__sh"></div></div><span class="iti__country-name">Saint Helena</span><span class="iti__dial-code">+290</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-kn" role="option" data-dial-code="1" data-country-code="kn" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__kn"></div></div><span class="iti__country-name">Saint Kitts and Nevis</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-lc" role="option" data-dial-code="1" data-country-code="lc" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__lc"></div></div><span class="iti__country-name">Saint Lucia</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-mf" role="option" data-dial-code="590" data-country-code="mf" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__mf"></div></div><span class="iti__country-name">Saint Martin (Saint-Martin (partie française))</span><span class="iti__dial-code">+590</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-pm" role="option" data-dial-code="508" data-country-code="pm" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__pm"></div></div><span class="iti__country-name">Saint Pierre and Miquelon (Saint-Pierre-et-Miquelon)</span><span class="iti__dial-code">+508</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-vc" role="option" data-dial-code="1" data-country-code="vc" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__vc"></div></div><span class="iti__country-name">Saint Vincent and the Grenadines</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ws" role="option" data-dial-code="685" data-country-code="ws" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ws"></div></div><span class="iti__country-name">Samoa</span><span class="iti__dial-code">+685</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-sm" role="option" data-dial-code="378" data-country-code="sm" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__sm"></div></div><span class="iti__country-name">San Marino</span><span class="iti__dial-code">+378</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-st" role="option" data-dial-code="239" data-country-code="st" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__st"></div></div><span class="iti__country-name">São Tomé and Príncipe (São Tomé e Príncipe)</span><span class="iti__dial-code">+239</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-sa" role="option" data-dial-code="966" data-country-code="sa" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__sa"></div></div><span class="iti__country-name">Saudi Arabia (‫المملكة العربية السعودية‬‎)</span><span class="iti__dial-code">+966</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-sn" role="option" data-dial-code="221" data-country-code="sn" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__sn"></div></div><span class="iti__country-name">Senegal (Sénégal)</span><span class="iti__dial-code">+221</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-rs" role="option" data-dial-code="381" data-country-code="rs" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__rs"></div></div><span class="iti__country-name">Serbia (Србија)</span><span class="iti__dial-code">+381</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-sc" role="option" data-dial-code="248" data-country-code="sc" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__sc"></div></div><span class="iti__country-name">Seychelles</span><span class="iti__dial-code">+248</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-sl" role="option" data-dial-code="232" data-country-code="sl" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__sl"></div></div><span class="iti__country-name">Sierra Leone</span><span class="iti__dial-code">+232</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-sg" role="option" data-dial-code="65" data-country-code="sg" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__sg"></div></div><span class="iti__country-name">Singapore</span><span class="iti__dial-code">+65</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-sx" role="option" data-dial-code="1" data-country-code="sx" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__sx"></div></div><span class="iti__country-name">Sint Maarten</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-sk" role="option" data-dial-code="421" data-country-code="sk" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__sk"></div></div><span class="iti__country-name">Slovakia (Slovensko)</span><span class="iti__dial-code">+421</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-si" role="option" data-dial-code="386" data-country-code="si" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__si"></div></div><span class="iti__country-name">Slovenia (Slovenija)</span><span class="iti__dial-code">+386</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-sb" role="option" data-dial-code="677" data-country-code="sb" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__sb"></div></div><span class="iti__country-name">Solomon Islands</span><span class="iti__dial-code">+677</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-so" role="option" data-dial-code="252" data-country-code="so" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__so"></div></div><span class="iti__country-name">Somalia (Soomaaliya)</span><span class="iti__dial-code">+252</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-za" role="option" data-dial-code="27" data-country-code="za" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__za"></div></div><span class="iti__country-name">South Africa</span><span class="iti__dial-code">+27</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-kr" role="option" data-dial-code="82" data-country-code="kr" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__kr"></div></div><span class="iti__country-name">South Korea (대한민국)</span><span class="iti__dial-code">+82</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ss" role="option" data-dial-code="211" data-country-code="ss" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ss"></div></div><span class="iti__country-name">South Sudan (‫جنوب السودان‬‎)</span><span class="iti__dial-code">+211</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-es" role="option" data-dial-code="34" data-country-code="es" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__es"></div></div><span class="iti__country-name">Spain (España)</span><span class="iti__dial-code">+34</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-lk" role="option" data-dial-code="94" data-country-code="lk" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__lk"></div></div><span class="iti__country-name">Sri Lanka (ශ්‍රී ලංකාව)</span><span class="iti__dial-code">+94</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-sd" role="option" data-dial-code="249" data-country-code="sd" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__sd"></div></div><span class="iti__country-name">Sudan (‫السودان‬‎)</span><span class="iti__dial-code">+249</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-sr" role="option" data-dial-code="597" data-country-code="sr" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__sr"></div></div><span class="iti__country-name">Suriname</span><span class="iti__dial-code">+597</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-sj" role="option" data-dial-code="47" data-country-code="sj" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__sj"></div></div><span class="iti__country-name">Svalbard and Jan Mayen</span><span class="iti__dial-code">+47</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-sz" role="option" data-dial-code="268" data-country-code="sz" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__sz"></div></div><span class="iti__country-name">Swaziland</span><span class="iti__dial-code">+268</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-se" role="option" data-dial-code="46" data-country-code="se" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__se"></div></div><span class="iti__country-name">Sweden (Sverige)</span><span class="iti__dial-code">+46</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ch" role="option" data-dial-code="41" data-country-code="ch" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ch"></div></div><span class="iti__country-name">Switzerland (Schweiz)</span><span class="iti__dial-code">+41</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-sy" role="option" data-dial-code="963" data-country-code="sy" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__sy"></div></div><span class="iti__country-name">Syria (‫سوريا‬‎)</span><span class="iti__dial-code">+963</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-tw" role="option" data-dial-code="886" data-country-code="tw" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__tw"></div></div><span class="iti__country-name">Taiwan (台灣)</span><span class="iti__dial-code">+886</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-tj" role="option" data-dial-code="992" data-country-code="tj" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__tj"></div></div><span class="iti__country-name">Tajikistan</span><span class="iti__dial-code">+992</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-tz" role="option" data-dial-code="255" data-country-code="tz" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__tz"></div></div><span class="iti__country-name">Tanzania</span><span class="iti__dial-code">+255</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-th" role="option" data-dial-code="66" data-country-code="th" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__th"></div></div><span class="iti__country-name">Thailand (ไทย)</span><span class="iti__dial-code">+66</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-tl" role="option" data-dial-code="670" data-country-code="tl" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__tl"></div></div><span class="iti__country-name">Timor-Leste</span><span class="iti__dial-code">+670</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-tg" role="option" data-dial-code="228" data-country-code="tg" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__tg"></div></div><span class="iti__country-name">Togo</span><span class="iti__dial-code">+228</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-tk" role="option" data-dial-code="690" data-country-code="tk" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__tk"></div></div><span class="iti__country-name">Tokelau</span><span class="iti__dial-code">+690</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-to" role="option" data-dial-code="676" data-country-code="to" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__to"></div></div><span class="iti__country-name">Tonga</span><span class="iti__dial-code">+676</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-tt" role="option" data-dial-code="1" data-country-code="tt" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__tt"></div></div><span class="iti__country-name">Trinidad and Tobago</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-tn" role="option" data-dial-code="216" data-country-code="tn" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__tn"></div></div><span class="iti__country-name">Tunisia (‫تونس‬‎)</span><span class="iti__dial-code">+216</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-tr" role="option" data-dial-code="90" data-country-code="tr" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__tr"></div></div><span class="iti__country-name">Turkey (Türkiye)</span><span class="iti__dial-code">+90</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-tm" role="option" data-dial-code="993" data-country-code="tm" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__tm"></div></div><span class="iti__country-name">Turkmenistan</span><span class="iti__dial-code">+993</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-tc" role="option" data-dial-code="1" data-country-code="tc" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__tc"></div></div><span class="iti__country-name">Turks and Caicos Islands</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-tv" role="option" data-dial-code="688" data-country-code="tv" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__tv"></div></div><span class="iti__country-name">Tuvalu</span><span class="iti__dial-code">+688</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-vi" role="option" data-dial-code="1" data-country-code="vi" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__vi"></div></div><span class="iti__country-name">U.S. Virgin Islands</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ug" role="option" data-dial-code="256" data-country-code="ug" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ug"></div></div><span class="iti__country-name">Uganda</span><span class="iti__dial-code">+256</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ua" role="option" data-dial-code="380" data-country-code="ua" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ua"></div></div><span class="iti__country-name">Ukraine (Україна)</span><span class="iti__dial-code">+380</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ae" role="option" data-dial-code="971" data-country-code="ae" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ae"></div></div><span class="iti__country-name">United Arab Emirates (‫الإمارات العربية المتحدة‬‎)</span><span class="iti__dial-code">+971</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-gb" role="option" data-dial-code="44" data-country-code="gb" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__gb"></div></div><span class="iti__country-name">United Kingdom</span><span class="iti__dial-code">+44</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-us" role="option" data-dial-code="1" data-country-code="us" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__us"></div></div><span class="iti__country-name">United States</span><span class="iti__dial-code">+1</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-uy" role="option" data-dial-code="598" data-country-code="uy" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__uy"></div></div><span class="iti__country-name">Uruguay</span><span class="iti__dial-code">+598</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-uz" role="option" data-dial-code="998" data-country-code="uz" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__uz"></div></div><span class="iti__country-name">Uzbekistan (Oʻzbekiston)</span><span class="iti__dial-code">+998</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-vu" role="option" data-dial-code="678" data-country-code="vu" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__vu"></div></div><span class="iti__country-name">Vanuatu</span><span class="iti__dial-code">+678</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-va" role="option" data-dial-code="39" data-country-code="va" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__va"></div></div><span class="iti__country-name">Vatican City (Città del Vaticano)</span><span class="iti__dial-code">+39</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ve" role="option" data-dial-code="58" data-country-code="ve" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ve"></div></div><span class="iti__country-name">Venezuela</span><span class="iti__dial-code">+58</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-vn" role="option" data-dial-code="84" data-country-code="vn" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__vn"></div></div><span class="iti__country-name">Vietnam (Việt Nam)</span><span class="iti__dial-code">+84</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-wf" role="option" data-dial-code="681" data-country-code="wf" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__wf"></div></div><span class="iti__country-name">Wallis and Futuna (Wallis-et-Futuna)</span><span class="iti__dial-code">+681</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-eh" role="option" data-dial-code="212" data-country-code="eh" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__eh"></div></div><span class="iti__country-name">Western Sahara (‫الصحراء الغربية‬‎)</span><span class="iti__dial-code">+212</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ye" role="option" data-dial-code="967" data-country-code="ye" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ye"></div></div><span class="iti__country-name">Yemen (‫اليمن‬‎)</span><span class="iti__dial-code">+967</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-zm" role="option" data-dial-code="260" data-country-code="zm" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__zm"></div></div><span class="iti__country-name">Zambia</span><span class="iti__dial-code">+260</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-zw" role="option" data-dial-code="263" data-country-code="zw" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__zw"></div></div><span class="iti__country-name">Zimbabwe</span><span class="iti__dial-code">+263</span></li><li class="iti__country iti__standard" tabindex="-1" id="iti-0__item-ax" role="option" data-dial-code="358" data-country-code="ax" aria-selected="false"><div class="iti__flag-box"><div class="iti__flag iti__ax"></div></div><span class="iti__country-name">Åland Islands</span><span class="iti__dial-code">+358</span></li></ul></div>
                            <label for="phone_number"></label><input id="phone_number" type="tel" name="phone_number" class="form-control" autocomplete="off" data-intl-tel-input-id="0" placeholder="201-555-0123" style="padding-left: 74px;"><input type="hidden" name="full"></div>
                    </div>

                    <div class="form-group">
                        <label for="how_did_you_hear_about_me">How did you hear about me?&nbsp&nbsp</label>
                        <textarea  rows="4" id="how_did_you_hear_about_me" type="text"
                                   name="how_did_you_hear_about_me"
                                   class="form-control"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="achievement_details">What are you looking to achieve?&nbsp&nbsp</label>
                        <textarea  rows="4" id="achievement_details" type="text"
                                   name="achievement_details"
                                   class="form-control"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="checkboxsms">Do you agree to be contacted via sms?</label>
                        <input type="checkbox" id="checkboxsms" checked="true">
                    </div>
                </div>
                <div class="modal-footer justify-content-between">
                    <button style="display: inline-flex;" type="button" class="btn btn-default" data-dismiss="modal" id="cancelmodalbtn">Cancel</button>
                    <div style="display: inline-flex;" id="btnSignin" class="g-signin2 btn" data-onsuccess="onSignIn"></div>
                    <button style="display: inline-flex;" type="button" class="btn btn-primary" id="actionOkay" onclick="submitForm()">Ok</button>

                </div>
            </form>
            <form id="google_login_form" class="form1" method="post" action="LandingData">
                <input id="oauthid" type="hidden" name="oauthtoken">
                <input id="stored_email" type="hidden" name="stored_email">
            </form>
        </div>
    </div>
</div>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>

<script>

    var phone_number = window.intlTelInput(document.querySelector("#phone_number"), {
        separateDialCode: true,
        hiddenInput: "full",
        utilsScript: "//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.3/js/utils.js"
    });
    let is_phone_updating = false;

    $(document).ready(function () {
        //$('#landing_dialogue').modal('show');//display phone dialog on webpage ready. testing purposes only

    })


    //open dialog box based on cookies data
    //if there are cookies then user is under sign-up process.
    function OpenDialogBox(next) {
        <% if(request.getAttribute("userID")!=null){ %>
        window.location.href="/menu.jsp";
        <%}
        else
        {%>
        if(next)
            window.location.href="/menu.jsp";

        let cookie_email = get_stored_data_Cookie("email");
        console.log("EmailCookie:"+cookie_email);
        if(cookie_email !== ""){
            //change Dialogue header Message
            window.location.href="/menu.jsp";

            document.getElementById("landing_dialogue_header").innerText = "Information Saved. Please Complete the Signup Process by Google Login";
            //user has stored some information from this page and not log-in so show only google sign-in button
            document.getElementById("btnSignin").style.display      =   "inline-flex";
            document.getElementById("actionOkay").style.display     =   "none";
            document.getElementById("cancelmodalbtn").style.display =   "none";
            document.getElementById("btn_close_x").style.display    =   "none";
            //load last added coockies
            document.getElementById("name").value =                         get_stored_data_Cookie("name");
            document.getElementById("email").value =                        get_stored_data_Cookie("email");
            document.getElementById("phone_number").value =                 get_stored_data_Cookie("phone");
            document.getElementById("how_did_you_hear_about_me").value =    get_stored_data_Cookie("where");
            document.getElementById("achievement_details").value =          get_stored_data_Cookie("what");


            document.getElementById("name").disabled =                      true;
            document.getElementById("email").disabled =                     true;
            document.getElementById("phone_number").disabled =              true;
            document.getElementById("how_did_you_hear_about_me").disabled = true;
            document.getElementById("achievement_details").disabled =       true

        }
        else
        {
            //change Dialogue header Message
            document.getElementById("landing_dialogue_header").innerText = "PLEASE TELL US ABOUT YOUR PROJECT";
            //user has stored some information from this page and not logedin so show only google sign-in button
            document.getElementById("btnSignin").style.display      =   "none";
            document.getElementById("actionOkay").style.display     =   "inline-flex";
            document.getElementById("cancelmodalbtn").style.display =   "inline-flex";
            document.getElementById("btn_close_x").style.display    =   "inline-flex";
            //load last added coockies
            document.getElementById("name").value = "";
            document.getElementById("email").value = "";
            document.getElementById("phone_number").value = "";
            document.getElementById("how_did_you_hear_about_me").value = "";
            document.getElementById("achievement_details").value = ""

        }
        $('#landing_dialogue').modal('show');
        <%}%>
    }

    function submitForm() {
        let name = document.getElementById('name');
        let email = document.getElementById('email');
        let phone = document.getElementById('phone_number');
        let hear = document.getElementById('how_did_you_hear_about_me');
        let achievement = document.getElementById('achievement_details');
        let checkboxsms = document.getElementById("checkboxsms");
        /* add combo box boolean flag */
        hear = hear ? hear.value.trim() : "";
        achievement = achievement ? achievement.value.trim() : "";
        if (!name.value.trim() || name.value.trim() === '') {
            alert("Enter name")
            name.focus();
        } else if (!email.value.trim() || email.value.trim() === '') {
            alert("Enter email")
            email.focus();
        } else if (!phone.value.trim() || phone.value.trim() === '') {
            alert("Enter phone number")
            phone.focus();
        }
        else
        {
            let phoneNumberWithCountryCode = $('#iti_selected_country_code').text() + phone.value.trim();

        $.ajax({
            type: "POST",
            url: "/cars/LandingData",
            data: {
                'name':         name.value.trim(),
                'email':        email.value.trim(),
                'phone_number': phoneNumberWithCountryCode,
                'how_did_you_hear_about_me':hear,
                'achievement_details':achievement,
                /* add combo box boolean flag */
                'checkboxsms':checkboxsms.checked
            },
            success: function (result) {
                console.log(result + (result.includes("insert done")));
                $('#landing_dialogue').modal('hide');
                if(result.includes("insert done")){
                    alert('Thank you for your interest. You will now be redirected to the menu page where you will see an example of some of our work in one public-facing project called "Car Prices". This project illustrates our ability to tightly control permissions on multiple levels, construct new APIs, and utilize APIs that already exist in order to pull data from them and other sources.')

                    document.getElementById("responseMSG").innerHTML = "Thank you for submit to the service.";
                    set_stored_data_Cookie("name",  name.value,         5);
                    set_stored_data_Cookie("email", email.value,        5);
                    set_stored_data_Cookie("phone", phone.value,        5);
                    set_stored_data_Cookie("where", hear.value,         5);
                    set_stored_data_Cookie("what",  achievement.value,  5);
                    /* add combo box boolean flag */
                    //user data is stored now refresh dialogue for google login
                    setTimeout(function(){
                        OpenDialogBox(true);
                    }, 600);
                }
                else if(result.includes("already exist")){
                    alert('Thank you for your interest. You will now be redirected to the menu page where you will see an example of some of our work in one public-facing project called "Car Prices". This project illustrates our ability to tightly control permissions on multiple levels, construct new APIs, and utilize APIs that already exist in order to pull data from them and other sources.')

                    OpenDialogBox(true);
                    document.getElementById("responseMSG").innerHTML = "We appear to already have you on file. Please click <a href='menu.jsp'> here</a> to enter the site menu with your approved services or contact the admin at the number shown above in order to gain further access.";
                }

            }
        });
    }
    }

    function set_stored_data_Cookie(cname,cvalue,exdays) {
        const d = new Date();
        d.setTime(d.getTime() + (exdays*24*60*60*1000));
        let expires = "expires=" + d.toGMTString();
        document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
    }

    function get_stored_data_Cookie(cname) {
        let name = cname + "=";
        let decodedCookie = decodeURIComponent(document.cookie);
        let ca = decodedCookie.split(';');
        for(let i = 0; i < ca.length; i++) {
            let c = ca[i];
            while (c.charAt(0) === ' ') {
                c = c.substring(1);
            }
            if (c.indexOf(name) === 0) {
                return c.substring(name.length, c.length);
            }
        }
        return "";
    }


    function checkCookie() {
        let user = get_stored_data_Cookie("username");
        if (user !== "") {
            alert("Welcome again " + user);
        } else {
            user = prompt("Please enter your name:","");
            if (user !== "" && user != null) {
                set_stored_data_Cookie("username", user, 30);
            }
        }
    }


    function onSignIn(googleUser) {

        document.getElementById('btnSignin').disabled=true;

        let profile = googleUser.getBasicProfile();
        let id_token = googleUser.getAuthResponse().id_token;

        let elementById = document.getElementById("oauthid");
        elementById.value=id_token
        document.getElementById("stored_email").value = get_stored_data_Cookie("email");

        // send as oauthtoken in post request
        if(profile.getEmail() !== get_stored_data_Cookie("email"))
            //alert("The email you entered is different then the login. we add google login as your secondary email.");

            //ajax call to update this email to secondary and redirect on success
            $.ajax({
                type: "POST",
                url: "/cars/LandingData",
                data: {
                    'oauthtoken':           id_token,
                    'stored_email':        document.getElementById("email").value.trim()        //to query
                },
                success: function (result) {
                    console.log(result);
                    if(confirm("Go to menu page?"))
                        window.location.href="/menu.jsp";
                }
            });

        //document.getElementById("form1").submit()
        //$('#landing_dialogue').modal('hide');

    }

    function googleSignOut() {

        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function () {
            console.log('User signed out.');

            document.cookie.split(";").forEach(function (c) {
                document.cookie = c.replace(/^ +/, "").replace(/=.*/, "=;expires=" + new Date().toUTCString() + ";path=/");
            });
        });
    }
    function onLoad() {
        gapi.load('auth2', function () {
            auth2 = gapi.auth2.init();
        });
    }
    /*$('#landing_dialogue').on('click', '#actionOkay', function (e) {
        is_phone_updating = true;
        $('#landing_dialogue').modal('hide');
        var full_number = phone_number.getNumber(intlTelInputUtils.numberFormat.E164);
        $("input[name='phone_number[full]']").val(full_number);
        console.log(full_number);
        //phone number VALIDATION code here
        //updatePhone(full_number);
        //$('#landing_dialogue').modal('show');
        e = null;//to remove warning
        alert("Your request for access has been sent to the administrator.");
    });*/







//deepak writen function
    function submitDetailsX() {

        let name = document.getElementById('name').value.trim()
        let email = document.getElementById('email').value.trim()
        let phone = document.getElementById('phone_number').value.trim()
        let hear = document.getElementById('how_did_you_hear_about_me').value.trim()
        let achievement = document.getElementById('achievement_details').value.trim()
        /* add combo box boolean flag */
        let checkboxsms = document.getElementById('checkboxsms').checked;

        //alert(name + " - " + email + " - " + phone + " - " + hear + " - " + achievement)

        if (!name || name === '') {
            alert("Enter name")
        } else if (!email || email=== '') {
            alert("Enter email")
        } else if (!phone || phone=== '') {
            alert("Enter phone number")
        }
        /*else if(!hear || hear.isEmpty()){
            alert("Enter name")
        }
        else if(!name || name.isEmpty()){
            alert("Enter name")
        }
        else if(!name || name.isEmpty()){
            alert("Enter name")
        }*/
        else {

            let body = "Name:  "+name+"\nEmail:  "+email+"\nPhone:  "+phone+"\n"+"How did you hear about "+
                "me:  "+hear+"\n"+"What are you looking to"+
                " achieve:  "+achievement +
                "checkboxsms: "+checkboxsms.checked

            $.ajax({
                type: "POST",
                url: "/admin/SendMail",
                data: {'subject': 'New request on UC page', 'body': body,'page':'uc.jsp'},
                success: function () {
                    alert('Thank you for requesting access to our services. Please feel free to go ahead and sign-in with the button below and we will call you as soon as possible to provision access to whatever you might need.')
                }
            });
        }
    }


</script>

</body>
</html>
