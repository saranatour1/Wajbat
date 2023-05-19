  <%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" %>
  <!-- c:out ; c:forEach etc. -->
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!-- Formatting (dates) -->
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

  <!-- form:form -->
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <!-- for rendering errors on PUT routes -->
  <h3%@ page isErrorPage="true" %>
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="UTF-8" />
      <title>all Resturant dashboards</title>
      <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
      <style>
        .btn.btn-light.position-relative:hover{
          animation: tilt-shaking 0.5s infinite;
        } 
  
        @keyframes tilt-shaking {
          0% { transform: rotate(0deg); }
          25% { transform: rotate(5deg); }
          50% { transform: rotate(0eg); }
          75% { transform: rotate(-5deg); }
          100% { transform: rotate(0deg); }
        }
      </style>
          <link rel="stylesheet" type="text/css" href="/css/stars.css" />
    </head>
  <body>
    <div class="container-fluid w-100 ">

      <nav class="container mx-auto d-flex my-4 justify-content-between">
        <h3>Logo</h3>
        <div>
          <button type="button" class="btn btn-light position-relative ">
            <a href="cart"><i class="bi bi-cart"></i></a>
            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
              ${pendingCartCount}+
              <span class="visually-hidden">Cart </span>
            </span>
          </button>
  
      
          <a href="/resturants">Back to main page </a>
          <a href="/logout" class="btn btn-link"> Logout</a> 

        </div>


      </nav>

    </div>
    <div class="container mx-auto">

       <h3>${rest.restName}</h3>
       <p>${rest.descreption}</p>
       <p>Opens at ${fn:substring(rest.openingTime, 11, 16)} and closes at ${fn:substring(rest.closingTime, 11, 16)}</p>
       <a href="tel:${rest.restNumber}">Call us at ${rest.restNumber}</a>

       <p>this resturant has gained this amount of likes ${Math.floor(avg)} </p>
        <div class="progress w-25" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="5">
          <div class="progress-bar" style="width: ${avg*20}%"></div>
        </div>

        ${rest.menu.menuItems}




        <div class="mx-auto">
          <h1 class="my-3">Menu Items</h1>
          <table>
              <thead>
                  <tr>
                      <th>Id</th>
                      <th>Food Name</th>
                      <th>Description</th>
                      <th>Food Price</th>
                      <th>Category Name</th>
                      <th>Quantity</th>
                  </tr>
              </thead>
              <tbody>

                <form action="/addItemsToCart/${rest.id}" method="post">
                  <c:forEach var="menuItem" items="${x}">
                    <tr>
                        <td> <input type="hidden" value="${menuItem[0]}" name="ItemId"> ${menuItem[0]}</td>
                        <td> ${menuItem[1]}</td>
                        <td> ${menuItem[2]}</td>
                        <td class="item-price">${menuItem[3]}</td>
                        <td>${menuItem[4]}</td>
                        <td>${menuItem[5]}</td>
                        <td><button type="button" class="btn btn-light reset-btn">reset</button></td>
                        <td><button type="button" class="btn btn-light add-items"> add item</button></td>
                        <td><input type="number" name="quantity" value="0" class="quantity"> </td>
                    </tr>
                  </c:forEach>
                  <tr>
                    <td>
                      <p>Total <input type="text" value="0" id="total" name="total"> </p>
                    </td>
                    <td>
                      <input type="submit" class="btn btn-light">
                    </td>
                  
                  </tr>
                </form>
                  


        

              </tbody>
          </table>
        </div>



       
    </div>


<!-- tbd -->
<!-- <c:set var="ratingValue" value="${avg}" />
          <c:set var="maxRating" value="5" />
          <div class="rating-stars">
            <c:forEach begin="1" end="${maxRating}" var="i">
              <span class="star${ratingValue >= i ? ' filled' : ''}"
                >&#9734;</span>
                </c:forEach>
                </div> -->

<!-- ${x} -->


<script src="/js/quantity.js"></script>

  </body>
</html>