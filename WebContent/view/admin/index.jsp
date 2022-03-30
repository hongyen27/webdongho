<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma" , "no-cache");
  response.setHeader("Expires" , "0");
  
  
  if (session.getAttribute("admin-username") == null){
	  response.sendRedirect(request.getContextPath() + "/admin/login"); 
  }
  %>
  <!-- Start header section -->
  <jsp:include page = "./header/header.jsp" flush = "true" />
    <div class="content-wrapper">
      <div class="container-fluid">


        <div class="row">
          <div class="col-12 col-lg-4 col-xl-5">
            <div class="card">
              <div class="card-header">Sản phẩm bán chạy
              </div>
              <div class="card-body">
                <div class="chart-container-2">
                <canvas id="chart2"></canvas>
                </div>
              </div>
              <div class="table-responsive">
                <table class="table align-items-center">
                  <tbody>
                  	<c:forEach items="${sumary}" var="sum">
                  		<tr>
                      		<td><i class="fa fa-circle text-light-1 mr-2"></i>${sum.name}</td>
                      		<td>${sum.price*sum.sl}00 VNĐ</td>
                      		<td>${sum.phantram}%</td>
                    	</tr>
                  	</c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  
    <jsp:include page = "./footer/footer.jsp" flush = "true" />