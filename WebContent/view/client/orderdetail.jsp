<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/view/client/assets" var="url"/>
  <!-- Start header section -->
  <jsp:include page = "./header/mainHeader.jsp" flush = "true" />
  
<section id="cart-view">
<div class="container">
<div class="row">
<div class="col-md-12">
<div class="cart-view-area">
<div class="cart-view-table">
<div class="table-responsive">
<h4>Chi tiết đơn hàng</h4>
<table class="table">
	<thead>
	<tr>
		<th>ID đơn hàng</th>
		<th>Tên sản phẩm</th>
		<th>Số lượng</th>
		<th>Giá</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach items="${orderdetail}" var="oddetail">
			<tr>
				<td>${oddetail.transaction_id }</td>
				<td>${oddetail.name }</td>
				<td>${oddetail.qty }</td>
				<td>${oddetail.price}00Đ</td>
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
</section>
  
  <jsp:include page = "./footer/footer.jsp" flush = "true" />