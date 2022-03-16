<%-- 
    Document   : shopingCart
    Created on : Mar 14, 2022, 9:37:07 PM
    Author     : Eighth_Note
--%>

<%@page import="java.math.BigInteger"%>
<%@page import="Model.ItemAddToCart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Shopping Cart</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <style type="text/css">
            .dropdown:hover .dropdown-menu{
                display: block;
            }
            .dropdown-toggle::after {
                content: none;

            }
            @media screen and (max-width: 1199px) {
                div.searchBar{
                    padding-left: 0%;
                }

            }

        </style>
    </head>
    <script>
        function displayOff() {
            document.getElementById('checkout').style.display = 'none';
            document.getElementById('input').style.display = 'block';
        }
    </script>
    <% ArrayList<ItemAddToCart> listItem = (ArrayList<ItemAddToCart>) request.getAttribute("listItem"); %>
    <body>
        <!-- Header  -->
        <div class="" >
            <div class="header  " style="position: fixed; width: 100% ;z-index:5; ">
                <nav class="navbar navbar-expand-lg navbar-light " style="background-color: rgb(248, 42, 42);">
                    <div class="container-fluid" style="display: flex!important; justify-content: space-between!important ;">

                        <!-- logo của shop -->
                        <div class="navbar-collapse logo col-lg-3 col-sm-2 navbar-nav" style="margin-left: 14%">

                            <div class="dropdown">

                                <i class="bi bi-layout-text-sidebar-reverse" style="color: white ; font-size: 25px;"></i>


                                <ul class="dropdown-menu" >
                                    <c:forEach var="o" items="${listC}">
                                        <li><a class="dropdown-item" href="home/brand?cid=${o.getcID()}">${o.getcName()}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>
                            <a href="home" style="font-size: 30px; color:white ;text-decoration: none; margin-left: 5px">Zshop</a>

                        </div>

                        <!-- tìm kiếm của -->
                        <div class="searchBar collapse navbar-collapse col-lg-6 col-sm-8 " id="navbarSupportedContent" style="padding-left: 0px;margin-left:   -2%,padding-right: 150px">
                            <form class="d-flex ">
                                <input class="form-control me-2" type="search" placeholder="Bạn muốn tìm kiếm sản phẩm gì ?"
                                       aria-label="Search" style="width: 350px;">
                                <button class="btn " type="submit"
                                        style="background-color: rgb(92, 91, 91); color: white;">Search</button>
                            </form>
                        </div>

                        <!-- Giỏ hành và account -->
                        <div class="navbar-collapse collapse" onmouseover="displayLG1()" onmouseout="displayLG2()" style="margin-left:   -140px" >
                            <a href="shoppingCart" style="margin-right: 5%;"><i class="bi bi-handbag-fill" style="  color: white; font-size: 27px;position: sticky" ></i></a>
                                <c:if test="${sessionScope.account == null}">
                                <div class="dropdown" >
                                    <i class="bi bi-person-circle"  style="color: white; font-size: 27px; margin-left: -10px;"></i>
                                    <ul class="dropdown-menu" style="margin-left: -60px;">

                                        <li style="margin-left: 20px;margin-right: 20px;margin-top: 10px"><a class="dropdown-item" href="login.jsp" style="text-align: center;background-color: #f0c14b;border-radius: 3px">Login</a></li>
                                        <li style="margin-bottom: 10px;margin-top: 10px"><p style="display: inline;font-size: 12px;margin-left: 10px">New customer?</p><a href="registerAccount.jsp" style="font-size: 12px;margin-right: 10px">Start Here</a></li>
                                    </ul>
                                </div>
                            </c:if>


                            <c:if test="${sessionScope.account != null}">
                                <div class="dropdown" >

                                    <i class="bi bi-person-circle"  style="color: white; font-size: 27px; " ></i>
                                    <ul class="dropdown-menu" style="margin-left: -70px; ">
                                        <li style="margin-left: 20px;margin-right: 20px;margin-top: 10px;width: 130px;">
                                            <p style="text-align: center;margin-bottom: 0px; font-size: 17px;">${account.getName()}</p></li>
                                        <p style="text-align: center;font-size: 13px; color: rgba(156, 161, 161, 0.932);">@${account.getUsername()}</p>
                                        </li>

                                        <li style="margin-bottom: 10px;margin-top: -10px;text-align: center;margin-left: 10px;">
                                            <c:if test="${account.getPosition() == 'admin'}">
                                                <a href="productManagement" style="font-size: 13px;margin-right: 10px;text-decoration: none;">Product Manager</a></br>
                                            </c:if>
                                            <a href="#" style="font-size: 13px;margin-right: 10px;text-decoration: none;">View Profile</a>
                                        </li>
                                        <li style="margin-left: 20px;margin-right: 20px;margin-top: 10px; margin-bottom: 10px">
                                            <a class="dropdown-item" href="login" style="text-align: center;background-color: #f0c14b;border-radius: 3px">Sign Out</a>
                                        </li>
                                    </ul>
                                </div>
                            </c:if>
                        </div>
                </nav>
            </div>




        </div>
        <!-- Header End -->

        <!-- Hero Section End -->

        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-section set-bg" data-setbg="image\ShoppingCard.jpg" >
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2 style="color: black;margin-top: 70px" >Shopping Cart</h2>
                            <div class="breadcrumb__option">

                                <span style="color: black;">Shopping Cart</span></br>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Shoping Cart Section Begin -->
        <section class="shoping-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__table">
                            <table>
                                <thead>
                                    <tr>
                                        <th class="shoping__product">Tên Sản Phẩm</th>
                                        <th>Giá</th>
                                        <th>Số Lượng</th>
                                        <th>Tổng</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${sessionScope.order != null}">
                                        <% for (int i = 0; i < listItem.size(); i++) {
                                                BigInteger a = new BigInteger(String.valueOf(listItem.get(i).getQuantity()));
                                                BigInteger b = new BigInteger(listItem.get(i).getPrice());
                                                BigInteger totalI = new BigInteger("0");
                                        %>

                                        <tr>

                                            <td class="shoping__cart__item">
                                                <img src="<%=listItem.get(i).getP().getImage()%>" width="150px" height="150px" alt="">
                                                <h5><%=listItem.get(i).getP().getProductName()%></h5>
                                            </td>
                                            <td class="shoping__cart__price">
                                                <%=listItem.get(i).getP().getProductPrice()%>₫
                                            </td>
                                            <form action="shoppingCart" method="post">
                                            <td class="shoping__cart__quantity">
                                                <div class="quantity">
                                                    <div style="border: 1px solid rgba(238, 235, 235, 0.801);background: rgba(238, 235, 235, 0.801);margin-left: 25%;margin-right: 25%;padding-bottom: 5px;padding-top: 5px" >
                                                        
                                                            <button value="-" name="button" type="submit" style="border: rgba(238, 235, 235, 0.801);background: rgba(238, 235, 235, 0.801)"><i class="bi bi-dash" ><input style="display: none" name="idP" value="<%=listItem.get(i).getP().getProductID()%>" /></i></button>
                                                            <div  style="font-size: 18px;display: inline;margin-left: 7px;margin-right: 7px"><%=listItem.get(i).getQuantity()%></div>
                                                            <button value="+" name="button" type="submitmit" style="border: rgba(238, 235, 235, 0.801);background: rgba(238, 235, 235, 0.801)"><i class="bi bi-plus-lg"><input style="display: none" name="idP" value="<%=listItem.get(i).getP().getProductID()%>" /></i></button>
                                                        
                                                    </div>
                                                </div>
                                            </td>

                                            <% totalI = a.multiply(b);%>
                                            <td class="shoping__cart__total">
                                                <%=totalI.toString()%> ₫
                                            </td>
                                            <td class="shoping__cart__item__close">
                                                <button name="button" type="submit" value="x" onclick="return confirm('Bạn có muốn xóa sản phẩm không ?');" style="background-color: white;border: white" ><i class="bi bi-x-lg" style="color: red" title="Xóa sản phẩm"><input style="display: none" name="idP" value="<%=listItem.get(i).getP().getProductID()%>" /></i></button>
                                            </td>
                                            </form>
                                        </tr>
                                        <%}%>
                                    </c:if>

                                </tbody>
                            </table>
                            <c:if test="${sessionScope.order == null}">
                                <div style="text-align: center;margin-top: 30px;font-size: 20px">Danh sách trống</div>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__btns">
                            <a href="home" class="primary-btn cart-btn">Tiếp tục SHOPPING</a>

                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="shoping__continue">

                        </div>
                    </div>
                    <c:if test="${sessionScope.order != null}">
                    <div class="col-lg-6">
                        <div class="shoping__checkout">
                            <h5>Cart Total</h5>
                            <ul>
                                <c:if test="${sessionScope.order != null}">
                                    <li>Tổng tiền <span>${total} ₫</span></li>
                                    </c:if>
                                    <c:if test="${sessionScope.order == null}">
                                    <li>Tổng tiền <span></span></li>
                                    </c:if>

                            </ul>
                            <c:if test="${sessionScope.account != null}">
                                <form action="shoppingCartControl" method="post">
                                    <button class="primary-btn" style="border: rgba(77, 70, 70, 0.397);width: 100%" type="submit">
                                        Thanh Toán
                                    </button>
                                </form>
                            </c:if>
                            <c:if test="${sessionScope.account == null}">
                                <form action="shoppingCartControl" method="post">
                                    <div class="primary-btn" onclick="displayOff()" id="checkout"
                                            style=" border: rgba(77, 70, 70, 0.397);width: 100%;cursor: pointer;" >
                                        Tiến hành thanh toán
                                    </div>
                                    <div id="input" style="display: none;">
                                        <input type="text" name="name" placeholder="Enter Name Customer" class="form-control form-control-lg;"
                                               style="width: 100%; border:1px solid rgba(29, 15, 15, 0.342);border-radius: 5px; padding-top: 4px; padding-bottom: 4px;" />
                                        <input type="text" name="email" placeholder="Enter Email Customer" class="form-control form-control-lg;"
                                               style="width: 100%; border:1px solid rgba(29, 15, 15, 0.342);border-radius: 5px; padding-top: 4px; padding-bottom: 4px;margin-top: 20px;" />
                                        <input type="text" name="phone" placeholder="Enter Phone Customer" class="form-control form-control-lg;"
                                               style="width: 100%; border:1px solid rgba(29, 15, 15, 0.342);border-radius: 5px; padding-top: 4px; padding-bottom: 4px;margin-top: 20px;" />
                                        <input type="text" name="address" placeholder="Enter Address Customer" class="form-control form-control-lg;"
                                               style="width: 100%; border:1px solid rgba(29, 15, 15, 0.342);border-radius: 5px; padding-top: 4px; padding-bottom: 4px;margin-top: 20px;" />
                                        <button type="submit" class="primary-btn"
                                                style="margin-left: 15px;margin-top: 20px;width: 45%; display: inline; ">Thanh Toán</button>
                                        <button type="button" class="primary-btn"
                                                style="margin-left: 20px; display: inline;margin-top: 20px;width: 45%; background-color: #f0c14b;"><a
                                                href="login.jsp" style="color: white;">Tạo tài khoản</a></button>

                                    </div>
                                </c:if>

                            </form>
                        </div>
                    </div>
                    </c:if>
                </div>
            </div>
        </section>
        <!-- Shoping Cart Section End -->




        <!-- Footer Section End -->
        <jsp:include page="footer.jsp"></jsp:include>

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>


    </body>

</html>
