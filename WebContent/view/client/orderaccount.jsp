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
<h4>Thông tin đơn hàng</h4>
<table class="table">
	<thead>
	<tr>
		<th>Họ tên</th>
		<th>Số điện thoại</th>
		<th>Địa chỉ</th>
		<th>Ngày đặt hàng</th>
		<th>Tổng tiền</th>
		<th>Chi tiết đơn hàng</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach items="${orderlist}" var="odlist">
			<tr>
				<td>${odlist.user_name }</td>
				<td>${odlist.user_phone }</td>
				<td>${odlist.address }</td>
				<td>${odlist.created }</td>
				<td>${odlist.amount }</td>
				<td><a href="${pageContext.request.contextPath}/view/client/account-detail?id=${odlist.id}"> Chi tiết</a></td>
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