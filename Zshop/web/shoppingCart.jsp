<%-- 
    Document   : shopingCart
    Created on : Mar 14, 2022, 9:37:07 PM
    Author     : Eighth_Note
--%>

<%@page import="Model.Category_Group"%>
<%@page import="Model.Category_Group"%>
<%@page import="Model.Category"%>
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

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <style>  
            .dropdown:hover .ac{
                display: block;
            }
            .dropend:hover .abc{
                display: block;
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
    <% ArrayList<Category> listC = (ArrayList<Category>) request.getAttribute("listC");%>
    <% ArrayList<Category_Group> listCG = (ArrayList<Category_Group>) request.getAttribute("listCG");%>


    <body>
        <!-- Header  -->
        <div class="" >
            <div class="header  " style="position: fixed; width: 100% ;z-index:5; ">
                <nav class="navbar navbar-expand-lg navbar-light " style="background-color: rgb(248, 42, 42);">
                    <div class="container  " style="display: flex!important; justify-content: space-between!important ;">

                        <!-- logo của shop -->
                        <div class="navbar-collapse logo col-lg-3 col-sm-2 navbar-nav" >

                            <div class="dropdown">

                                <i class="bi bi-layout-text-sidebar-reverse" style="color: white ; font-size: 25px;"></i>


                                <ul class="dropdown-menu ac" >
                                    <%int a = 10;%>
                                    <% for (int i = 0; i < listC.size(); i++) {


                                    %>
                                    <li>
                                        <div class="dropend">
                                            <a class="dropdown-item" href="home/brand?cid=<%=listC.get(i).getcID()%>"><%=listC.get(i).getcName()%><i class="bi bi-chevron-right" style="float: right;font-size: 13px"></i></a>

                                            <ul class="dropdown-menu abc" style="margin-top: -<%=a%>px;min-height: 175px"> 
                                                <%for (int j = 0; j < listCG.size(); j++) {%>
                                                <% if (listC.get(i).getcID().equals(listCG.get(j).getCID())) {%>
                                                <li><a class="dropdown-item" href="home/brand?cid=<%=listC.get(i).getcID()%>&cgid=<%=listCG.get(j).getCGID()%>"><%=listCG.get(j).getCGName()%></a></li>
                                                    <%}%>
                                                    <%}
                                                        a = a + 30 + 1;
                                                    %>
                                            </ul>

                                        </div>
                                    </li>


                                    <%}%>
                                </ul>
                            </div>
                            <a href="home" style="font-size: 30px; color:white ;text-decoration: none; margin-left: 5px" title="Home">Zshop</a>

                        </div>

                        <!-- tìm kiếm của -->
                        <div class="searchBar collapse navbar-collapse col-lg-6 col-sm-8 " id="navbarSupportedContent" style="padding-left: 0px">
                            <form class="d-flex " action="home/searchProduct" method="get">
                                <input class="form-control me-2" type="search" name="name" placeholder="Bạn muốn tìm kiếm sản phẩm gì ?"
                                       aria-label="Search" style="width: 350px;">
                                <button class="btn " type="submit"
                                        style="background-color: rgb(92, 91, 91); color: white;">Search</button>
                            </form>
                        </div>

                        <!-- Giỏ hành và account -->
                        <div class="navbar-collapse collapse" onmouseover="displayLG1()" onmouseout="displayLG2()" style="margin-right: -120px">
                            <a href="shoppingCart" style="margin-right: 7%;"><i class="bi bi-handbag-fill" style="  color: white; font-size: 27px;" data-toggle="tooltip" title="Giỏ hàng"></i></a>

                            <c:if test="${sessionScope.account == null}">
                                <div class="dropdown" >
                                    <i class="bi bi-person-circle"  style="color: white; font-size: 27px; "></i>
                                    <ul class="dropdown-menu ac" style="margin-left: -60px;">

                                        <li style="margin-left: 20px;margin-right: 20px;margin-top: 10px"><a class="dropdown-item" href="login.jsp" style="text-align: center;background-color: #f0c14b;border-radius: 3px">Login</a></li>
                                        <li style="margin-bottom: 10px;margin-top: 10px"><p style="display: inline;font-size: 12px;margin-left: 10px">New customer?</p><a href="registerAccount.jsp" style="font-size: 12px;margin-right: 10px">Start Here</a></li>
                                    </ul>
                                </div>
                            </c:if>


                            <c:if test="${sessionScope.account != null}">
                                <div class="dropdown" >

                                    <i class="bi bi-person-circle"  style="color: white; font-size: 27px; " ></i>
                                    <ul class="dropdown-menu ac" style="margin-left: -70px; ">
                                        <li style="margin-left: 20px;margin-right: 20px;margin-top: 10px;width: 130px;">
                                            <p style="text-align: center;margin-bottom: 0px; font-size: 17px;">${account.getName()}</p></li>
                                        <p style="text-align: center;font-size: 13px; color: rgba(156, 161, 161, 0.932);">@${account.getUsername()}</p>
                                        </li>

                                        <li style="margin-bottom: 10px;margin-top: -10px;text-align: center;margin-left: 10px;">
                                            <c:if test="${account.getPosition() == 'admin'}">
                                                <a href="productManagement" style="font-size: 13px;margin-right: 10px;text-decoration: none;">Product Manager</a></br>
                                            </c:if>
                                            <a href="setProfileAccount" style="font-size: 13px;margin-right: 10px;text-decoration: none;">View Profile</a>
                                        </li>
                                        <li style="margin-left: 20px;margin-right: 20px;margin-top: 10px; margin-bottom: 10px">
                                            <a class="dropdown-item" href="login?url=shoppingCart" style="text-align: center;background-color: #f0c14b;border-radius: 3px">Sign Out</a>
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
                    <div class="col-lg-12 text-center" style="margin-top: 50px">
                        <div class="breadcrumb__text" >
                            <h2 style="color: black;margin-top: 70px;font-weight: 700" >Shopping Cart</h2>
                            <div class="breadcrumb__option">



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
                            <table style="margin-top: 100px">
                                <thead style="">
                                    <tr style="border-bottom: 1px;border-bottom-color: grey">
                                        <th class="shoping__product" style="width: 630px;padding-bottom: 50px">Tên Sản Phẩm</th>
                                        <th style="width: 200px;text-align: center;padding-bottom: 50px">Giá</th>
                                        <th style="width: 190px;text-align: center;padding-bottom: 50px">Số Lượng</th>
                                        <th style="width: 200px;text-align: center;padding-bottom: 50px">Tổng</th>
                                        <th style="width: 75px;padding-bottom: 50px"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${sessionScope.order != null}">
                                        <% for (int i = 0; i < listItem.size(); i++) {
                                                BigInteger temp1 = new BigInteger(String.valueOf(listItem.get(i).getQuantity()));
                                                BigInteger temp2 = new BigInteger(listItem.get(i).getPrice());
                                                BigInteger totalI = new BigInteger("0");
                                        %>

                                        <tr>

                                            <td style="width: 600px;padding-bottom: 50px">
                                                <img src="<%=listItem.get(i).getP().getImage()%>" width="150px" height="150px" alt="">
                                                <h5 style="display: inline"><%=listItem.get(i).getP().getProductName()%></h5>
                                            </td>
                                            <td style="width: 200px;text-align: center;font-weight: 500;color: red;font-size:  18px;padding-bottom: 50px">
                                                <%=listItem.get(i).getP().getProductPrice()%>₫
                                            </td>
                                    <form action="shoppingCart" method="post">
                                        <td style="width: 190px;text-align: center;padding-bottom: 50px">
                                            <div class="quantity">
                                                <div style="border: 1px solid rgba(238, 235, 235, 0.801);background: rgba(238, 235, 235, 0.801);margin-left: 20%;margin-right: 20%;padding-bottom: 5px;padding-top: 5px" >

                                                    <button value="-" name="button" type="submit" style="border: rgba(238, 235, 235, 0.801);background: rgba(238, 235, 235, 0.801)"><i class="bi bi-dash" ><input style="display: none" name="idP" value="<%=listItem.get(i).getP().getProductID()%>" /></i></button>
                                                    <div  style="font-size: 18px;display: inline;margin-left: 7px;margin-right: 7px"><%=listItem.get(i).getQuantity()%></div>
                                                    <button value="+" name="button" type="submitmit" style="border: rgba(238, 235, 235, 0.801);background: rgba(238, 235, 235, 0.801)"><i class="bi bi-plus-lg"><input style="display: none" name="idP" value="<%=listItem.get(i).getP().getProductID()%>" /></i></button>

                                                </div>
                                            </div>
                                        </td>
                                        <% totalI = temp1.multiply(temp2);%>
                                        <%      String total = totalI.toString();
                                                int count = 0;
                                                int count1 = 0;
                                                String price = "";
                                                String temp = "";
                                                String arr[] = total.split("");
                                                for (int j = total.length() - 1; j >= 0; j--) {
                                                    count++;
                                                    count1++;
                                                    temp = temp + arr[j];
                                                    if (count == 3) {
                                                        count = 0;
                                                        price = price + temp + ".";
                                                        temp = "";
                                                    }
                                                }
                                                if (!temp.isEmpty()) {
                                                    price = price + temp;
                                                }
                                                String result = "";
                                                for (int j = price.length() - 1; j >= 0; j--) {
                                                    result = result + price.charAt(j);
                                                }
                                                if (count % 3 == 0) {
                                                    result = result.substring(1);
                                                }
                                            

                                        %>

                                        
                                        <td style="width: 200px;text-align: center;font-weight: 500;color: red;font-size:  18px;padding-bottom: 50px">
                                            <%=result%> ₫
                                        </td>
                                        <td style="width: 75px;text-align: center;padding-bottom: 50px">
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
                <div class="row" style="margin-top: 50px">
                    <div class="col-lg-6" style="display: inline">
                        <div style="border: 1px solid #c5c5c5;display: inline; padding:  12px 30px 15px 30px;border-radius: 5px;background-color: #c5c5c5">
                            <a href="home" class="primary-btn cart-btn" style="font-size: 17px;text-decoration: none;color: white;font-weight: 500"> Tiếp tục SHOPPING</a>

                        </div>
                    </div>

                    <c:if test="${sessionScope.order != null}">
                        <div class="col-lg-6" style="border: 1px solid black;border-radius: 7px">
                            <div class="shoping__checkout" style="margin-left: 30px;margin-right: 30px">
                                <h5 style="margin-top: 30px;margin-bottom: 40px">Cart Total</h5>
                                <ul style="list-style: none;margin-top: 20px">
                                    <c:if test="${sessionScope.order != null}">
                                        <li ><span style="font-weight: 500;color: black;font-size:  18px">Tổng tiền </span><span style="float: right;font-weight: 500;color: red;font-size:  18px">${total} ₫</span></li>
                                        </c:if>
                                        <c:if test="${sessionScope.order == null}">
                                        <li> <span style="font-weight: 500;color: black;font-size:  18px">Tổng tiền </span><span style="float: right;;font-weight: 500;color: red;font-size:  18px"></span></li>
                                        </c:if>

                                </ul>
                                <c:if test="${sessionScope.account != null}">
                                    <form action="shoppingCartControl" method="post">
                                        <button class="primary-btn" style="border: rgba(77, 70, 70, 0.397);width: 100%;margin-bottom: 30px;margin-top: 30px;background-color: #7fad39;padding-top: 7px;padding-bottom:  7px;border-radius: 7px" type="submit">
                                            <span style="color: white;font-weight: 600;font-size: 21px;">Thanh Toán</span>
                                        </button>
                                    </form>
                                </c:if>
                                <c:if test="${sessionScope.account == null}">
                                    <form action="shoppingCartControl" method="post">
                                        <div class="primary-btn" onclick="displayOff()" id="checkout"
                                             style="border: rgba(77, 70, 70, 0.397);width: 100%;margin-bottom: 30px;margin-top: 30px;background-color: #7fad39;padding-top: 7px;padding-bottom:  7px;border-radius: 7px;color: white;font-weight: 600;font-size: 19px;text-align: center" >
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
                                                    style="margin-left: 15px;margin-top: 20px;width: 45%; display: inline; border: rgba(77, 70, 70, 0.397);margin-bottom: 30px;margin-top: 30px;background-color: #7fad39;padding-top: 7px;padding-bottom:  7px;border-radius: 7px"> <span style="color: white;font-weight: 600;font-size: 19px;">Thanh Toán</span></button>
                                            <button type="button" class="primary-btn"
                                                    style="margin-left: 20px; display: inline;margin-top: 20px;width: 45%; background-color: #f0c14b;border: rgba(77, 70, 70, 0.397);margin-bottom: 30px;margin-top: 30px;padding-top: 7px;padding-bottom:  7px;border-radius: 7px">
                                                <a
                                                    href="login.jsp" style="color: white;font-weight: 600;font-size: 19px;text-decoration: none">Tạo tài khoản</a></button>

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



        <div style="margin-top: 120px;color: white">
            a
        </div>
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
