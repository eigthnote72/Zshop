<%@page import="Model.Category_Group"%>
<%@page import="Model.Category"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Home</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">


        <script src="./scrip.js"></script>
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
    <% ArrayList<Product> listProducts = (ArrayList<Product>) request.getAttribute("listProducts");%>
    <% ArrayList<Category> listC = (ArrayList<Category>) request.getAttribute("listC");%>
    <% ArrayList<Category_Group> listCG = (ArrayList<Category_Group>) request.getAttribute("listCG");%>
    
    <script>

    </script>
    <body>

        <div class="" >
            <div class="header  " style="position: fixed; width: 100% ;z-index:5; ">
                <nav class="navbar navbar-expand-lg navbar-light " style="background-color: rgb(248, 42, 42);">
                    <div class="container  " style="display: flex!important; justify-content: space-between!important ;">

                        <!-- logo c???a shop -->
                        <div class="navbar-collapse logo col-lg-3 col-sm-2 navbar-nav" >

                            <div class="dropdown">

                                <i class="bi bi-layout-text-sidebar-reverse" style="color: white ; font-size: 25px;"></i>


                                <ul class="dropdown-menu ac" >
                                    <%int a =10;%>
                                    <% for(int i = 0 ; i<listC.size();i++){
                                       
                                    
                                    %>
                                        <li>
                                            <div class="dropend">
                                                <a class="dropdown-item" href="home/brand?cid=<%=listC.get(i).getcID()%>"><%=listC.get(i).getcName()%><i class="bi bi-chevron-right" style="float: right;font-size: 13px"></i></a>
                                                
                                                <ul class="dropdown-menu abc" style="margin-top: -<%=a%>px;min-height: 175px"> 
                                                    <%for(int j = 0 ;j<listCG.size();j++){%>
                                                        <% if(listC.get(i).getcID().equals(listCG.get(j).getCID())) {%>
                                                        <li><a class="dropdown-item" href="home/brand?cid=<%=listC.get(i).getcID()%>&cgid=<%=listCG.get(j).getCGID()%>"><%=listCG.get(j).getCGName()%></a></li>
                                                        <%}%>
                                                    <%}
                                                    a=a+30+1;
                                                    %>
                                                </ul>

                                            </div>
                                        </li>


                                    <%}%>
                                </ul>
                            </div>
                                <a href="home" style="font-size: 30px; color:white ;text-decoration: none; margin-left: 5px" title="Home">Zshop</a>

                        </div>

                        <!-- t??m ki???m c???a -->
                        <div class="searchBar collapse navbar-collapse col-lg-6 col-sm-8 " id="navbarSupportedContent" style="padding-left: 0px">
                            <form class="d-flex " action="home/searchProduct" method="get">
                                <input class="form-control me-2" type="search" name="name" placeholder="B???n mu???n t??m ki???m s???n ph???m g?? ?"
                                       aria-label="Search" style="width: 350px;">
                                <button class="btn " type="submit"
                                        style="background-color: rgb(92, 91, 91); color: white;">Search</button>
                            </form>
                        </div>

                        <!-- Gi??? h??nh v?? account -->
                        <div class="navbar-collapse collapse" onmouseover="displayLG1()" onmouseout="displayLG2()" style="margin-right: -120px">
                            <a href="shoppingCart" style="margin-right: 7%;"><i class="bi bi-handbag-fill" style="  color: white; font-size: 27px;" data-toggle="tooltip" title="Gi??? h??ng"></i></a>

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
                                            <a class="dropdown-item" href="login?url=home" style="text-align: center;background-color: #f0c14b;border-radius: 3px">Sign Out</a>
                                        </li>
                                    </ul>
                                </div>
                            </c:if>
                        </div>
                </nav>
            </div>




        </div>

        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel"  >
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>

            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">

                    <img  src="image\home_samsung.jpg" width="100%" height="587px" style="margin-top: 60px">
                    <div style="color:white;top:0;margin-left:10%;padding-top:400px;position:absolute;">
                        <div style="font-size: 35px;margin-bottom: 16px;">Galaxy Z Fold3</div>
                        <a href="home/brand?cid=SS&cgid=SSZFOLD3" style="background-color: #0071e3; color: white; text-decoration: none; padding-left: 5px; padding-right: 7px; padding-top: 2px; padding-bottom: 3px; border-radius: 10px;margin-left: 145px">Buy Now</a>
                    </div>


                </div>
                <div class="carousel-item">
                    <img src="image\home_iphone.jpeg" width="100%" height="587px" style="margin-top: 60px">
                    <div style="color:white;top:0;margin-left:10%;padding-top:400px;position:absolute">
                        <div style="font-size: 35px;margin-bottom: 16px;">Iphone 13 Series</div>
                        <%String a1 = "AP"; String a2 = "APIP13";%>
                        <a href="home/brand?cid=<%=a1%>&cgid=<%=a2%>" style="background-color: #0071e3; color: white; text-decoration: none; padding-left: 5px; padding-right: 7px; padding-top: 2px; padding-bottom: 3px; border-radius: 10px;margin-left: 180px">Buy Now</a>
                    </div>
                </div>

            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>


        <section class="main"  style="margin-top: 50px">
            <div class="container" style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr 1fr; ">

                <%for (int i = 0; i < listProducts.size(); i++) {%>


                <div onmouseover="zoom(<%=i%>)" onmouseout="backZoom(<%=i%>)" style="height: 347px; margin-right: 10px;margin-bottom: 30px">
                    <a href="productDetail?pid=<%=listProducts.get(i).getProductID()%>" style="text-decoration: none;">
                        <img src="<%=listProducts.get(i).getImage()%>" id="img<%=i%>" height="200" width="200" style="display: block;margin-left: auto;margin-right: auto; margin-top: 20px;">
                        <p style="margin-top: 20px; margin-left: 20px; font-weight: 500; margin-right: 20px;"><%=listProducts.get(i).getProductName()%></p>
                    </a>

                    <div style="display: flex;">
                        <p style="margin-left: 20px; color: red; font-weight: 500; display: inline;margin-top: 5px;"><%=listProducts.get(i).getProductPrice()%> ???</p>
                        <div style="float: right;">
                            <a href="shoppingCartControl?idP=<%=listProducts.get(i).getProductID()%>" style="background-color: white;border: white;margin-left: 95%;" onmouseover="document.getElementById('<%=listProducts.get(i).getProductID()%>').style.display = 'block';" onmouseout="document.getElementById('<%=listProducts.get(i).getProductID()%>').style.display = 'none';"><i class="bi bi-cart-plus" style="font-size: 20px;margin-right: 45px;"></i></a> 
                        </div>
                    </div>
                    <div  id="<%=listProducts.get(i).getProductID()%>" 
                          style="display: none;float: right; margin-top: -13px;margin-right: 14px; font-size: 15px;border: 1px solid rgba(0, 0, 0, 0.219); border-radius: 5px; padding-left: 3px;padding-right: 3px;">
                        Add To Cart</div>

                    <input id="sizelist" value="<%=listProducts.size()%>" style="display: none" />
                </div> 
                <%}%>
            </div>
        </section>




        <jsp:include page="footer.jsp" ></jsp:include>
    </body>



</html>