<%-- 
    Document   : registerAccount
    Created on : Mar 13, 2022, 9:52:37 PM
    Author     : Eighth_Note
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">


        
        <style>
            .bg-image-vertical {
                position: relative;
                overflow: hidden;
                background-repeat: no-repeat;
                background-position: right center;
                background-size: auto 100%;
            }

            @media (min-width: 1025px) {
                .h-custom-2 {
                    height: 100%;
                }
            }
        </style>
        <title>register</title>
    </head>
    <body>
        <c:if test="${sessionScope.account== null}">
        <section class="vh-100">
        <div class="container-fluid">
          <div class="row">
            <div class="col-sm-6 text-black">
      
              <div class="px-5 ms-xl-4">
                <i class="fas fa-crow fa-2x me-3 pt-5 mt-xl-4" style="color: #709085;"></i>
                <span class="h1 fw-bold mb-0">Zshop</span>
              </div>
      
              <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">
      
                  <form  action="insertAccount" method="post" style="width: 23rem;">
       
                  <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Register</h3>
       
                  <div class="form-outline mb-4">
                    <input type="text" id="form2Example28" class="form-control form-control-lg"  placeholder="Name" name="name" />
                  </div>

                  <div class="form-outline mb-4">
                    <input type="text" id="form2Example18" class="form-control form-control-lg" placeholder="Username"  name="user" style="display: inline;"/>
                    
                  </div>
      
                  <div class="form-outline mb-4">
                    <input type="password" id="form2Example28" class="form-control form-control-lg" placeholder="Password" name="pass" style="display: inline;" />
                  </div>
                  <div class="form-outline mb-4">
                    <input type="password" id="form2Example28" class="form-control form-control-lg"  placeholder="Re-enter Password" name="rePass" />
                  </div>
                  <div class="form-outline mb-4">
                    <input type="text" id="form2Example28" class="form-control form-control-lg"  placeholder="Email" name="email" />
                  </div>
                  <div class="form-outline mb-4">
                    <input type="text" id="form2Example28" class="form-control form-control-lg"  placeholder="Phone Number" name="phone" />
                  </div>
                  <div class="form-outline mb-4">
                    <input type="text" id="form2Example28" class="form-control form-control-lg"  placeholder="Address" name="address" />
                  </div>

                  
                  
                 
                  
      
                  <div class="pt-1 mb-4">
                    <button class="btn btn-info btn-lg btn-block" type="submit">Create</button>
                  </div>
      
                  
      
                </form>
      
              </div>
      
            </div>
            <div class="col-sm-6 px-0 d-none d-sm-block">
              <img src="image\image_Login.jpg" alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: left;">
            </div>
          </div>
        </div>
      </section>
            </c:if>
        
        <c:if test="${sessionScope.account != null}">
            <c:redirect url="/home"/>
        
        </c:if>
    </body>
</html>
