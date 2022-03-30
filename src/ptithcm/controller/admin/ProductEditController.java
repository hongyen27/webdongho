package ptithcm.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import ptithcm.model.Catalog;
import ptithcm.model.Product;
import ptithcm.service.CategoryService;
import ptithcm.service.ProductService;
import ptithcm.service.impl.CategoryServicesImpl;
import ptithcm.service.impl.ProductServiceImpl;

/**
 * Servlet implementation class ProductEditController
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 50, // 50MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ProductEditController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ProductService productService = new ProductServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CategoryService cateService = new CategoryServicesImpl();
		List<Catalog> cateList = cateService.getAll();
		req.setAttribute("catelist", cateList);
		
		String id = req.getParameter("id");
		Product product = productService.get(Integer.parseInt(id));
		req.setAttribute("product", product);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/editproduct.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fileName = null;
		try {
	           // Đường dẫn tuyệt đối tới thư mục gốc của web app.
	           String appPath = req.getServletContext().getRealPath("");
	           appPath = appPath.replace('\\', '/');
	 
	           // Danh mục các phần đã upload lên (Có thể là nhiều file).
	           for (Part part : req.getParts()) {
	               fileName = extractFileName(part);
	               if (fileName != null && fileName.length() > 0) {
	                   String filePath = "C:/Users/Admin/eclipse-workspace/WEBDONGHO/WebContent/view/client/assets/images/products/img-test/" + fileName;
	                   System.out.println("Write attachment to file: " + filePath);
	 
	                   // Ghi vào file.
	                   part.write(filePath);
	               }
	           }
	 
	           // Upload thành công.
	        //   resp.sendRedirect(req.getContextPath() + "/uploadFileResults");
	       } catch (Exception e) {
	           e.printStackTrace();
	           req.setAttribute("errorMessage", "Error: " + e.getMessage());
	           RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/view/admin/addproduct.jsp");
	           dispatcher.forward(req, resp);
	       }
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=UTF-8");
		Product product = new Product();
		product.setId(req.getParameter("product-sku"));
		product.setCatalog_id(req.getParameter("product-cate"));
		product.setName(req.getParameter("product-name"));
		product.setPrice(req.getParameter("product-price"));
		product.setStatus(req.getParameter("product-status"));
		product.setDescription(req.getParameter("product-desc"));
		product.setContent(req.getParameter("product-content"));
		product.setDiscount(req.getParameter("product-discount"));
		product.setImage_link(fileName);
		product.setCreated(req.getParameter("product-day"));
		productService.edit(product);
		
		resp.sendRedirect(req.getContextPath()+"/admin/product/list");

	}
	
	private String extractFileName(Part part) {
	       // form-data; name="file"; filename="C:\file1.zip"
	       // form-data; name="file"; filename="C:\Note\file2.zip"
	       String contentDisp = part.getHeader("content-disposition");
	       String[] items = contentDisp.split(";");
	       for (String s : items) {
	           if (s.trim().startsWith("filename")) {
	               // C:\file1.zip
	               // C:\Note\file2.zip
	               String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
	               clientFileName = clientFileName.replace("\\", "/");
	               int i = clientFileName.lastIndexOf('/');
	               // file1.zip
	               // file2.zip
	               return clientFileName.substring(i + 1);
	           }
	       }
	       return null;
	   }
}