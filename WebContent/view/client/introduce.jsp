<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/view/client/assets" var="url"/>
  <!-- Start header section -->
  <jsp:include page = "./header/mainHeader.jsp" flush = "true" />
  
  
  <section id="aa-catg-head-banner">
   <img src="${pageContext.request.contextPath}/view/client/assets/images/slide_1.jpg" alt="banner sản phẩm">
   <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>Giới thiệu</h2>
        <ol class="breadcrumb">
          <li><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>      
          <li style="color:#fff">Giới thiệu</li>   
        </ol>
      </div>
     </div>
   </div>
  </section>
  <section id="aa-product-category">
    <div class="container">
      <div class="row">
      	<div>
      		<h1 style ="text-align: center; color: red;">Company Name</h1>
      		<p>Chúng tôi hi vọng tất cả người tiêu dùng Việt nam sẽ được sử dụng những sản phẩm giày dép chất lượng tại cửa hàng <strong>Company Name</strong></p>
      		<p><strong>Company Name</strong> đảm bảo chất lượng cho tất cả sản phẩm bán tại website bằng chính sách bảo hành vĩnh viễn.</p>
      		<img src="${url}/images/slide_2.jpg" alt="jmg"/> <br/> <br>
      		<p><strong>Company Name</strong> cam kết chất lượng phục vụ tốt nhất, chuyên nghiệp nhất cho mọi khách hàng bằng chính sách hoàn tiền và tặng quà nếu nhân viên phục vụ quí khách không chu đáo.</p>
      		<img src="${url}/images/slide_3.jpg" alt="jmg"/> <br/> <br>
      		<p>Nếu bạn gặp rắc rối về sản phẩm hay chất lượng dịch vụ của <strong>Company Name</strong>, hãy gọi ngay đến số 0344.96.4466 để được hỗ trợ</p>
      	</div>
      </div>
     </div>
    </section>
    
<!--  footer-->
 <jsp:include page = "./footer/footer.jsp" flush = "true" />
<!-- end footer-->
      