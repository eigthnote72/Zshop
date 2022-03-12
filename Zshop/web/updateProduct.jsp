<%-- 
    Document   : updateProduct
    Created on : Mar 12, 2022, 5:40:32 PM
    Author     : Eighth_Note
--%>

<%@page import="Model.Product"%>
<%@page import="Model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Update Product</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>

    </head>



    <body>

        <form action="updateProduct" method="post">
            <label>ID : ${pUpdate.getProductID()}</label>
            <input type="hidden" value="${pUpdate.getProductID()}" name="id"/>



            <label style="display: block;">Name</label>
            <input name="name" type="text" class="form-control" value="${pUpdate.getProductName()}" required>


            <label>Price</label>
            <input name="price" type="text" class="form-control" value="${pUpdate.getProductPrice()}" required>

            <label >Storage : ${pUpdate.getStorage()}</label>
            <input type="hidden" value="${pUpdate.getStorage()}" name="storage"/>


                <label style="display: block;">Image</label>
                <input name="image" type="text" class="form-control" value="${pUpdate.getImage()}" required>




            <label>Category</label>
            <select name="category" class="form-select" aria-label="Default select example" style="height: 20px">
                <c:forEach items="${listC}" var="o">
                    <option value="${o.getcID()}" style="font-size: 15px" <c:if test="${categoryID == o.getcID()}">selected</c:if> >${o.getcName()}</option>
                </c:forEach>
            </select></br>
            <a href="productManagement" ><input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel"></a>
            <input type="submit" class="btn btn-success" value="Upadate">
        </form>

    </body>

</html>
