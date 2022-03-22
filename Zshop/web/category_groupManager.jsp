<%-- 
    Document   : category_groupManager
    Created on : Mar 21, 2022, 9:15:56 PM
    Author     : Eighth_Note
--%>

<%@page import="Model.Category_Group"%>
<%@page import="Model.Category"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
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
        <title>Category Group Manager</title>
    </head>

    <script type="text/javascript">

        function alertName() {

            alert("<%=request.getAttribute("messCG")%>");


        }





    </script>






    <c:if test="${not empty messCG}">
        <script type="text/javascript"> window.onload = alertName;</script> 
    </c:if>

    <% ArrayList<Category_Group> listCG = (ArrayList<Category_Group>) request.getAttribute("listCG"); %>
    <% ArrayList<Category> listC = (ArrayList<Category>) request.getAttribute("listC"); %>
    <body>
        <c:if test="${sessionScope.account != null && sessionScope.account.getPosition() eq 'admin'}">
            <%if (listCG == null) {%> 
            <c:redirect url="/category_groupManager"/>
            <%}%>
            <div class="">
                <div class="table-wrapper">
                    <div class="table-title" style="position: fixed;width: 100%;top: 0px">
                        <div class="row" style="background-color: #0062cc">
                            <div class="col-sm-6">
                                <h2 style="color: white;margin-left: 40px"><b style="color: white"> Model đang bán</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <a href="home"  class="btn btn-danger" style="float: right;margin-top: 15px;margin-right: 30px"><i class="bi bi-arrow-90deg-right" ></i> <span>Trở về trang chính</span></a>
                                <a href="#addCateGory_Group"  class="btn btn-success" data-toggle="modal" style="float: right;margin-top: 15px;margin-right: 10px"><i class="bi bi-plus-lg" ></i> <span>Thêm CateGory_Group</span></a>
                                <a href="productManagement"  class="btn btn-warning"  style="float: right;margin-top: 15px;margin-right: 10px"><i class="bi bi-arrow-down-left-square"></i></i> <span>View Manager Product</span></a>

                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover" style="margin-top: 110px" >
                        <thead >
                            <tr style="position: fixed;width: 100%;top: 63px;background-color: grey">
                                <th style="width: 125px">STT</th>
                                <th style="width: 375px">Mã Model</th>
                                <th style="width: 830px">Tên Model</th>
                                <th style="width: 482px">Nhãn hiệu</th>
                                <th style=""></th>
                            </tr>
                        </thead>
                        <tbody>

                            <% int sst = 1;%>
                            <%for (int i = listCG.size() - 1; i > 0; i--) {%>
                            <tr>

                                <td><%=sst%></td>
                                <td><%=listCG.get(i).getCGID()%></td>
                                <td><%=listCG.get(i).getCGName()%></td>
                                <td>

                                    <%  String brand = "";

                                        for (int j = 0; j < listC.size(); j++) {
                                            if (listC.get(j).getcID().equals(listCG.get(i).getCID())) {
                                                brand = listC.get(j).getcName();
                                            }
                                        }
                                    %>

                                    <%=brand%>
                                </td>


                                <td>
                                    <a href="updateCategory_Group?cgid=<%=listCG.get(i).getCGID()%>"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Sửa">&#xE254;</i></a>
                                    <a href="deleteCategory_Group?cgid=<%=listCG.get(i).getCGID()%>" class="delete" data-toggle="modal" onclick="return confirm('Bạn có muốn xóa model này không ? \nNote : Xóa hết các sản phẩm tương ứng');"><i class="material-icons" data-toggle="tooltip" title="Xóa">&#xE872;</i></a>
                                </td>
                            </tr>
                            <% sst++; %>
                            <%}%>
                        </tbody>
                    </table>


                </div>
                <!--            
                
                        </div>
                <!-- Edit Modal HTML -->
                <div id="addCateGory_Group" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="insertCategoryGroup" method="post">
                                <div class="modal-header">						
                                    <h4 class="modal-title">Thêm Category_Group</h4>

                                </div>
                                <div class="modal-body">					
                                    <div class="form-group" >
                                        <label>New Model ID</label>
                                        <input  oninput="getID(this);" onfocusout="exit()" name="id" id="newID" type="text" class="form-control" required >
                                        <div class="autocom-box" id="oldID">

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>New Model Name</label>
                                        <input name="name" type="text" class="form-control" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Nhãn hiệu</label>
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
                <c:if test="${not empty edit}">
                    <!-- Edit Modal HTML -->
                    <div id="upateCateGory_Group" class="modal" style=" display: block ;  background: rgba(156, 153, 153, 0.589);" >
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="updateCategory_Group" method="post">
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Update Category_Group</h4>

                                    </div>
                                    <div class="modal-body">					
                                        <div class="form-group" >
                                            <label>Model ID</label>
                                            <div    id="newID" >${cg.getCGID()}</div>
                                            <input name="pid" type="hidden" class="form-control" value="${cg.getCGID()}" >
                                            
                                            <div class="autocom-box" id="oldID">

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Model Name</label>
                                            <input name="nameCG" type="text" class="form-control" value="${cg.getCGName()}" required>
                                        </div>

                                        <div class="form-group">
                                            <label>Nhãn hiệu</label>
                                            <select name="category" class="form-select" aria-label="Default select example" style="height: 20px">
                                                <c:forEach items="${listC}" var="o">
                                                    <option value="${o.getcID()}" style="font-size: 15px" <c:if test="${o.getcID() eq cg.getCID()}">selected</c:if> >${o.getcName()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-secondary" type="button" style="border-color: grey"><a href="category_groupManager" style="color: black;text-decoration: none">Cancel</a></button>
                                        <input type="submit" class="btn btn-success" value="Update">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:if>



                <jsp:include page="footer.jsp"></jsp:include>
            </c:if>
            <c:if test="${sessionScope.account == null}">
                <c:redirect url="/home"/>

            </c:if>
            <c:if test="${sessionScope.account.getPosition() ne 'admin'}">
                <c:redirect url="/home"/>

            </c:if>

    </body>
    <script src="js/manager.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</html>
