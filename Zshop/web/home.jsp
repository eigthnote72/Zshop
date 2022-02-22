<%-- 
    Document   : home
    Created on : Feb 23, 2022, 1:53:58 AM
    Author     : Eighth_Note
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <div class="header  container">
            <nav class="navbar navbar-expand-lg navbar-light " style="background-color: rgb(248, 42, 42);"> 
                <div class="container-fluid">
                  <a class="dropdownAndLogo">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="white" class="bi bi-layout-text-sidebar" viewBox="0 0 16 16">
                            <path d="M3.5 3a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5zm0 3a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5zM3 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5z"/>
                            <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm12-1v14h2a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1h-2zm-1 0H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h9V1z"/>
                          </svg>
                  </a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#">Action</a></li>
                    <li><a class="dropdown-item" href="#">Another action</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                  </ul>
                  <!-- logo của shop -->
                  <a class="navbar-brand logo" href="#" style="" >
                    <a style="font-size: 30px; color:white ;">Zshop</a>
                  </a>
                  
                </a>
                    
                  
                  <!-- tìm kiếm của -->
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <form class="d-flex search">
                      <input class="form-control me-2" type="search" placeholder="Bạn muốn tìm kiếm sản phẩm gì ?" aria-label="Search" style="width: 400px;">
                      <button class="btn " type="submit" style="background-color: rgb(92, 91, 91); color: white;">Search</button>
                    </form>
                  </div>
                </div>
              </nav>
              
        </div>
        </div>
    </body>
</html>
