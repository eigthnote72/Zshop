<%@page import="Model.ImgProducts"%>
<%@page import="Model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>

    <head>
        <title>TODO supply a title</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <script src="./scrip.js"></script>
    </head>
    <% ArrayList<Product> listProducts = (ArrayList<Product>) request.getAttribute("listProducts");%>

    <body>

        <div class="">
            <div class="header  " style="position: fixed; width: 100% ; ">
                <nav class="navbar navbar-expand-lg navbar-light " style="background-color: rgb(248, 42, 42);">
                    <div class="container-fluid  " style="display: flex!important; justify-content: space-between!important ;">

                        <!-- logo của shop -->
                        <div class="navbar-collapse logo col-lg-3 col-sm-2 navbar-nav" >
                            <i class="bi bi-layout-text-sidebar-reverse" style="color: white ; font-size: 25px;"></i>


                            <a class="" href="#" style="padding-left: 2%;">
                                <a style="font-size: 30px; color:white ;">Zshop</a>
                                <!-- <img src="" width="500" height="600"> -->
                            </a>
                        </div>

                        <!-- tìm kiếm của -->
                        <div class="searchBar collapse navbar-collapse col-lg-6 col-sm-8 " id="navbarSupportedContent">
                            <form class="d-flex ">
                                <input class="form-control me-2" type="search" placeholder="Bạn muốn tìm kiếm sản phẩm gì ?"
                                       aria-label="Search" style="width: 400px;">
                                <button class="btn " type="submit"
                                        style="background-color: rgb(92, 91, 91); color: white;">Search</button>
                            </form>
                        </div>

                        <!-- Giỏ hành và account -->
                        <div class="account navbar-collapse collapse" >
                            <i class="bi bi-bag-plus" style="margin-right: 7%;  color: white; font-size: 27px; "   ></i>
                            <i class="bi bi-person-circle" style="color: white; font-size: 27px; "></i>

                        </div>

                    </div>


                </nav>



            </div>




        </div>
        <img src="" >
        <section class="main"  style="margin-top: 50px">
            <div class="container" style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr 1fr; ">

                <%for (int i = 0; i < listProducts.size(); i++) {%>

                <a href="#" style="text-decoration: none;">      
                    <div onmouseover="zoom(<%=i%>)" onmouseout="back(<%=i%>)" style="height: 347px; margin-right: 10px;">
                        <img src="<%=listProducts.get(i).getImage()%>" id="img<%=i%>" height="200" width="200" style="display: block;margin-left: auto;margin-right: auto; margin-top: 20px;">
                        <p style="margin-top: 20px; margin-left: 20px; font-weight: 500; margin-right: 20px;"><%=listProducts.get(i).getProductName()%></p>
                        <p style="margin-left: 20px; color: red; font-weight: 500;"><%=listProducts.get(i).getProductPrice()%>₫</p>
                        <input id="sizelist" value="<%=listProducts.size()%>" style="display: none" />
                    </div> 
                </a>

                <%}%>

            </div>
        </section>

    </body>



    <body>
        <footer class="site-footer background-black-2">

            <div class="container">
                <div class="row" >
                    <div style="margin-right: -100px;" class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
                        <div class="footer-widget footer-widget__about-widget">
                            <a href="index.html" class="footer-widget__logo">
                                <a style="font-size: 30px; color:white ; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;">Zshop</a>
                            </a>
                            <p class="thm-text-dark"></p>
                        </div><!-- /.footer-widget -->
                    </div><!-- /.col-sm-12 col-md-6  -->
                    <div style="margin-right: 50px;"class="col-sm-12 col-md-6 col-lg-6 col-xl-4" >
                        <div class="footer-widget footer-widget__contact-widget">
                            <h3 class="footer-widget__title" style="margin-bottom: 5%;">Contact</h3><!-- //.footer-widget__title -->
                            <ul class="list-unstyled footer-widget__contact">
                                <li style="margin-bottom: 2%;">
                                    <i class="bi bi-telephone-fill"></i>
                                    <a href="tel:+84 865 350 702" style="text-decoration: none; color: rgb(43, 40, 40);">+84 816 521 125</a>
                                </li>
                                <li style="margin-bottom: 2%;">
                                    <i class="bi bi-envelope-fill" ></i>
                                    <a href="mailto:truongnxhe150804@fpt.edu.vn" style="text-decoration: none; color: rgb(43, 40, 40);">truongnxhe150804@fpt.edu.vn</a>
                                </li>
                                <li style="margin-bottom: 2%;">
                                    <i class="bi bi-geo-alt-fill" style="text-decoration: none; color: rgb(43, 40, 40);"></i>
                                    <a >Đại học FPT Hòa Lạc - Thạch Thất - Hà Nội</a>
                                </li>
                            </ul><!-- /.list-unstyled footer-widget__contact-->
                        </div><!-- /.footer-widget -->
                    </div>
                    <div class="col-sm-12 col-md-5 col-lg-5 col-xl-4">
                        <div class="footer-widget">
                            <h3 class="footer-widget__title" style="margin-bottom: 5%;">Explore</h3><!-- /.footer-widget__title -->
                            <ul class="list-unstyled footer-widget__links">
                                <li style="margin-bottom: 2%;">
                                    <a href="products" style="text-decoration: none; color: rgb(43, 40, 40);">New Products</a>
                                </li>
                                <li style="margin-bottom: 2%;">
                                    <a href="checkout" style="text-decoration: none; color: rgb(43, 40, 40);">My Account</a>
                                </li>
                                <li style="margin-bottom: 2%;">
                                    <a href="contact" style="text-decoration: none; color: rgb(43, 40, 40);">Support</a>
                                </li>
                                <li style="margin-bottom: 2%;">
                                    <a href="contact" style="text-decoration: none; color: rgb(43, 40, 40);">FAQs</a>
                                </li>
                            </ul><!-- /.list-unstyled footer-widget__contact -->
                        </div><!-- /.footer-widget -->
                    </div><!-- /.col-sm-12 col-md-6 col-lg-2 -->
                    <div class="col-sm-12 col-md-12 col-lg-12 col-xl-3">
                        <div class="footer-widget">
                            <h3 class="footer-widget__title" style="margin-bottom: 7%;">Newsletter</h3><!-- /.footer-widget__title -->
                            <form action="#" data-url="YOUR_MAILCHIMP_URL" class="mc-form">
                                <input type="email" style="width: 200px; margin-bottom: 10px; font-size: 18px; border-radius: 3px; border: none;" name="EMAIL" id="mc-email" placeholder="Email Address">
                                <button type="submit" style="background-color: rgb(30, 116, 214); color: white; width: 200px; height: 33px; font-size: 18px; font-weight: bold; border-radius: 5px; border: none;" >Subscribe</button>
                            </form>
                            <div class="mc-form__response"></div><!-- /.mc-form__response -->
                        </div><!-- /.footer-widget -->
                    </div><!-- /.col-sm-12 col-md-6 col-lg-2 -->
                </div><!-- /.row -->
            </div><!-- /.container -->
            <div class="bottom-footer">
                <div class="container">
                    <hr>
                    <div class="inner-container text-center">

                        <p class="thm-text-dark">© Copyright <span class="dynamic-year"></span> by Nguyễn Xuân Trường</p>
                    </div><!-- /.inner-container -->
                </div><!-- /.container -->
            </div><!-- /.bottom-footer -->
        </footer><!-- /.site-footer -->
    </body>



</html>