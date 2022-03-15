<%-- 
    Document   : apple
    Created on : Mar 13, 2022, 2:35:37 AM
    Author     : Eighth_Note
--%>

<%@page import="Model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="stylecss">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

        <script src="./scrip.js"></script>
        <title>Apple</title>
        <style type="text/css">
            .dropdown:hover .dropdown-menu{
                display: block;
            }
            .dropdown-toggle::after {
                content: none;

            }

        </style>

    </head>
    <% ArrayList<Product> listProducts = (ArrayList<Product>) request.getAttribute("listP");%>

    <body>

        <div class="">
            <div class="header  " style="position: fixed; width: 100% ; ">
                <nav class="navbar navbar-expand-lg navbar-light " style="background-color: rgb(248, 42, 42);">
                    <div class="container  " style="display: flex!important; justify-content: space-between!important ;">

                        <!-- logo của shop -->
                        <div class="navbar-collapse logo col-lg-3 col-sm-2 navbar-nav" >

                            <div class="dropdown">

                                <i class="bi bi-layout-text-sidebar-reverse" style="color: white ; font-size: 25px;"></i>


                                <ul class="dropdown-menu" >
                                    <c:forEach var="o" items="${listC}">
                                        <li><a class="dropdown-item" href="..\home\brand?cid=${o.getcID()}">${o.getcName()}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>
                            <a href="..\home" style="font-size: 30px; color:white ;text-decoration: none; margin-left: 5px">Zshop</a>

                        </div>

                        <!-- tìm kiếm của -->
                        <div class="searchBar collapse navbar-collapse col-lg-6 col-sm-8 " id="navbarSupportedContent" style="padding-left: 0px">
                            <form class="d-flex ">
                                <input class="form-control me-2" type="search" placeholder="Bạn muốn tìm kiếm sản phẩm gì ?"
                                       aria-label="Search" style="width: 350px;">
                                <button class="btn " type="submit"
                                        style="background-color: rgb(92, 91, 91); color: white;">Search</button>
                            </form>
                        </div>

                        <!-- Giỏ hành và account -->
                        <div class="navbar-collapse collapse" onmouseover="displayLG1()" onmouseout="displayLG2()" style="margin-right: -120px">
                            <a href="shoppingCart" style="margin-right: 7%;"><i class="bi bi-handbag-fill" style="  color: white; font-size: 27px;" ></i></a>

                            <c:if test="${sessionScope.account == null}">
                                <div class="dropdown" >

                                    <i class="bi bi-person-circle"  style="color: white; font-size: 27px; " ></i>
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
                                            <p style="text-align: center;margin-bottom: 0px; font-size: 17px;">Hi Nguyen Van A</p></li>
                                        <p style="text-align: center;font-size: 13px; color: rgba(156, 161, 161, 0.932);">@admin1</p>
                                        </li>

                                        <li style="margin-bottom: 10px;margin-top: -10px;text-align: center;margin-left: 10px;">
                                            <c:if test="${account.getPosition() == 'admin'}">
                                            <a href="..\productManagement" style="font-size: 13px;margin-right: 10px;text-decoration: none;">Product Manager</a></br>
                                            </c:if>
                                            <a href="#" style="font-size: 13px;margin-right: 10px;text-decoration: none;">View Profile</a>
                                        </li>
                                        <li style="margin-left: 20px;margin-right: 20px;margin-top: 10px; margin-bottom: 10px">
                                            <a class="dropdown-item" href="..\logout" style="text-align: center;background-color: #f0c14b;border-radius: 3px">Sign Out</a>
                                        </li>
                                    </ul>
                                </div>
                            </c:if>
                        </div>
                </nav>

                
            </div>




        </div>
        <img src="" >
        <section class="main"  style="margin-top: 50px">
            <div class="container" style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr 1fr; ">

                <%for (int i = 0; i < listProducts.size(); i++) {%>

                <a href="#" style="text-decoration: none;">      
                    <div onmouseover="zoom(<%=i%>)" onmouseout="backZoom(<%=i%>)" style="height: 347px; margin-right: 10px;">
                        <img src="<%=listProducts.get(i).getImage()%>" id="img<%=i%>" height="200" width="200" style="display: block;margin-left: auto;margin-right: auto; margin-top: 20px;">
                        <p style="margin-top: 20px; margin-left: 20px; font-weight: 500; margin-right: 20px;"><%=listProducts.get(i).getProductName()%></p>
                        <p style="margin-left: 20px; color: red; font-weight: 500;"><%=listProducts.get(i).getProductPrice()%>₫</p>
                        <input id="sizelist" value="<%=listProducts.size()%>" style="display: none" />
                    </div> 
                </a>
                <%}%>
            </div>
        </section>

     <jsp:include page="footer.jsp" ></jsp:include>
    </body>
</html>
