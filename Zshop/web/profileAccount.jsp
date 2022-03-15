<%-- 
    Document   : profileAccount
    Created on : Mar 15, 2022, 9:23:39 PM
    Author     : Eighth_Note
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <title>Profile</title>
        <style>
            body {
                background: rgb(99, 39, 120)
            }

            .form-control:focus {
                box-shadow: none;
                border-color: #BA68C8
            }

            .profile-button {
                background: rgb(99, 39, 120);
                box-shadow: none;
                border: none
            }

            .profile-button:hover {
                background: #682773
            }

            .profile-button:focus {
                background: #682773;
                box-shadow: none
            }

            .profile-button:active {
                background: #682773;
                box-shadow: none
            }

            .back:hover {
                color: #682773;
                cursor: pointer
            }

            .labels {
                font-size: 11px
            }

            .add-experience:hover {
                background: #BA68C8;
                color: #fff;
                cursor: pointer;
                border: solid 1px #BA68C8
            }
        </style>
    </head>

    <body>
    <c:if test="${sessionScope.account!= null}">
        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-3 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold">${account.getUsername()}</span><span class="text-black-50">${account.getEmail()}</span><span> </span></div>
                </div>
                <div class="col-md-5 border-right">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">Profile Settings</h4>
                            <div class="mt-5 text-center" style="margin-bottom: 50px;border-radius: 5px"><button class="btn btn-primary profile-button" type="button" style="background-color: rgb(177, 169, 182)"> <a href="home" style="color: white;text-decoration: none"> Tiếp tục mua hàng</a> </button></div>
                        </div>



                        <div class="row mt-3">
                            <div class="col-md-12"><label class="labels">Name</label><input type="text" class="form-control" placeholder="name" value="${account.getName()}" readonly></div>
                            <div class="col-md-12"><label class="labels">Phone</label><input type="text" class="form-control" placeholder="enter phone number" value="${account.getPhone()}" readonly></div>
                            <div class="col-md-12"><label class="labels">Địa Chỉ </label><input type="text" class="form-control" placeholder="enter address line 1" value="${account.getAddress()}" readonly></div>
                            <div class="col-md-12"><label class="labels">Email</label><input type="text" class="form-control" placeholder="enter email id" value="${account.getEmail()}" readonly></div>
                        </div>
                        <div class="row mt-3">

                        </div>
                        <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="button">Lưu Thông Tin</button></div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</c:if>
<c:if test="${sessionScope.account == null}">
            <c:redirect url="/home"/>
        
</c:if>
</body>
</html>
