<%-- 
    Document   : productDetail
    Created on : Mar 16, 2022, 10:44:11 AM
    Author     : Eighth_Note
--%>

<%@page import="Model.Category_Group"%>
<%@page import="Model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
        <style type="text/css">
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

    <% ArrayList<Category> listC = (ArrayList<Category>) request.getAttribute("listC");%>
    <% ArrayList<Category_Group> listCG = (ArrayList<Category_Group>) request.getAttribute("listCG");%>
    <script>
        function change_image(image) {

            var container = document.getElementById("main-image");

            container.src = image.src;
        }



        document.addEventListener("DOMContentLoaded", function (event) {







        });

        function up() {
            var quantity = document.getElementById("quantity").value;
            document.getElementById("quantity").value = ++quantity;
        }
        function down() {

            var quantity = document.getElementById("quantity").value;
            if (quantity > 1) {
                document.getElementById("quantity").value = --quantity;
            } else {
                document.getElementById("quantity").value = quantity;
            }


        }
    </script>
    <body>
        <!-- header -->
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
                                            <a class="dropdown-item" href="login" style="text-align: center;background-color: #f0c14b;border-radius: 3px">Sign Out</a>
                                        </li>
                                    </ul>
                                </div>
                            </c:if>
                        </div>
                </nav>
            </div>




        </div>
        <!-- Main -->
        <div >
            <div class="row d-flex justify-content-center" >
                <div class="col-md-10" style="margin-top: 150px">
                    <div class="card">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="images p-3 text-center ">
                                    <c:if test="${not empty listImg}">
                                        <div class="text-center p-4"> <img id="main-image" src="${listImg.get(1)}" width="250" height="250" /> </div>
                                            <c:forEach var="o" items="${listImg}" >
                                            <div class="thumbnail text-center" style="display: inline"> <img onclick="change_image(this)" src="${o}" width="70" height="70"></div> 
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${empty listImg}">
                                            <div class="text-center p-4"> <img id="main-image" src="${p.getImage()}" width="250" height="250" /> </div>
                                    </c:if>

                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="product p-4">
                                    <div class="mt-4 mb-3"> 
                                        <h5 class="text-uppercase">${p.getProductName()}</h5>
                                        <div class="price d-flex flex-row align-items-center"> 
                                            <p class="act-price" style="color: red;font-size: 17px">${p.getProductPrice()} ₫</p>

                                        </div>
                                    </div>
                                    <div class="sizes mt-5">
                                        <h9 class="text-uppercase" >Dung lượng</h9> 
                                        <div>${p.getStorage()}</div>
                                    </div>
                                    <form action="shoppingCartControl" method="get">
                                        <div class="sizes mt-5">
                                            <h6 class="text-uppercase">Số lượng</h6> 
                                            <div class="quantity">
                                                <div style="border: 1px solid rgba(238, 235, 235, 0.801);padding-bottom: 5px;padding-top: 5px;width: 100px" >

                                                    <i class="bi bi-dash" onclick="down()" style="cursor: pointer"></i>
                                                    <div  style="font-size: 18px;display: inline;margin-left: 7px;margin-right: 7px;text-align: center"><input type="number" name="quantity" value="1" id="quantity" readonly style="width: 40px;border: #f3ebeb;border-radius: 5px;text-align: center"/></div>
                                                    <i class="bi bi-plus-lg" onclick="up()" style="cursor: pointer"></i>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="cart mt-4 align-items-center"> 
                                            <button class="btn btn-danger text-uppercase mr-2 px-4"> Add to cart</button>  
                                            <input type="text" style="display: none" name="idP" value="${p.getProductID()}" />
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div style="margin-bottom: 50px"></div>
            <jsp:include page="footer.jsp"></jsp:include>
    </body>

</html>
