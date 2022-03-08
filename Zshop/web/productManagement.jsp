<%-- 
    Document   : productManagement
    Created on : Mar 7, 2022, 10:05:17 PM
    Author     : Eighth_Note
--%>

<%@page import="Model.Category"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <script src="./scrip.js"></script>
        <style>
            img{
                width: 200px;
                height: 200px;
            }

            .autocom-box{
                position: fixed;
                padding: 0;
                opacity: 0;
                pointer-events: none;
                max-height: 280px;
                overflow-y: auto;
                opacity: 1;
                pointer-events: auto;
                background-color: #c7ecee;
                width: 95%;
                border-radius: 0px 10px 10px 10px;
                max-height: 150px;
                
            }

            .autocom-box li{
                list-style: none;
                padding: 8px 12px;
                display: block;
                width: 100%;
                background-color: #c7ecee;
                cursor: default;
                border-radius: 3px;
            }
            .autocom-box li:hover{
                background: #efefef;
            }
        </style>
    </head>
    <script>
        function getID(para) {
            var text = para.value;
//            var id = document.getElementById("newID").value;
            $.ajax({
                url: '/Zshop/addProduct',
                type: 'get',
                data: {
                    data: text
                },
                success: function (value) {
                    var oldID = document.getElementById('oldID');
                    oldID.innerHTML = value;

                },
                error: function (e) {
                    alert(e);
                }
            });
        }
        
        function exit(){
           
            document.getElementById('oldID').innerHTML ="";
        }
    </script>
    <% ArrayList<Product> listP = (ArrayList<Product>) request.getAttribute("listProducts"); %>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                            <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="selectAll">
                                    <label for="selectAll"></label>
                                </span>
                            </th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (int i = listP.size()-1; i >0;  i--) {%>
                        <tr>
                            <td>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                    <label for="checkbox1"></label>
                                </span>
                            </td>
                            <td><%=listP.get(i).getProductID()%></td>
                            <td><%=listP.get(i).getProductName()%></td>
                            <td>
                                <img src="<%=listP.get(i).getImage()%>">
                            </td>
                            <td><%=listP.get(i).getProductPrice()%>₫</td>
                            <td>
                                <a href="loadProduct?pid=<%=listP.get(i).getProductID()%>"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                <a href="delete?pid=<%=listP.get(i).getProductID()%>" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>

            </div>
            <a href="#"><button type="button" class="btn btn-primary">Back to home</button>

        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addProduct" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>

                        </div>
                        <div class="modal-body">					
                            <div class="form-group" >
                                <label>ID</label>
                                <input  oninput="getID(this);" onfocusout="exit()" name="id" id="newID" type="text" class="form-control" required >
                                <div class="autocom-box" id="oldID">

                                </div>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label style="display: block">Storage</label>
                                <input name="storage" type="text" class="form-control" style="width: 90%;display: inline" required> <select name="unit" class="form-select" style="display: inline; height: 30px"><option value="GB" selected>GB</option> <option value="MB">MB</option><option value="T">T</option> </select>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>
                            
                            
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example" style="height: 20px">
                                    <c:forEach items="${listC}" var="o">
                                        <option value="${o.getcID()}" style="font-size: 15px">${o.getcName()}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <script src="js/manager.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </body>
</html>