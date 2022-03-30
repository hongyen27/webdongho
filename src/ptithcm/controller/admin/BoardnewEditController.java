package ptithcm.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import ptithcm.model.Boardnew;
import ptithcm.service.BoardnewService;
import ptithcm.service.impl.BoardnewServicesImpl;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 50, // 50MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class BoardnewEditController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	BoardnewService boardnewService = new BoardnewServicesImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		Boardnew boardnew = boardnewService.get(Integer.parseInt(id));
		req.setAttribute("boardnew", boardnew);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/editboardnew.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fileName = null;
		String link_image=null;
		try {
	           // Đường dẫn tuyệt đối tới thư mục gốc của web app.
	           String appPath = req.getServletContext().getRealPath("");
	           appPath = appPath.replace('\\', '/');
	 
	           // Danh mục các phần đã upload lên (Có thể là nhiều file).
	           for (Part part : req.getParts()) {
	               fileName = extractFileName(part);
	               if (fileName != null && fileName.length() > 0) {
	                   String filePath = "C:/Users/Admin/eclipse-workspace/WEBDONGHO/WebContent/view/client/assets/images/news/" + fileName;
	                   System.out.println("Write attachment to file: " + filePath);
	                   link_image=fileName;
	 
	                   // Ghi vào file.
	                   part.write(filePath);
	               }
	           }
	 
	           // Upload thành công.
	        //   resp.sendRedirect(req.getContextPath() + "/uploadFileResults");
	       } catch (Exception e) {
	           e.printStackTrace();
	           req.setAttribute("errorMessage", "Error: " + e.getMessage());
	           RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/view/admin/editboardnew.jsp");
	           dispatcher.forward(req, resp);
	       }
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=UTF-8");
		Boardnew boardnew = new Boardnew();
		boardnew.setId(req.getParameter("new-id"));
		boardnew.setTitle(req.getParameter("new-title"));
		boardnew.setContent(req.getParameter("new-content"));
		boardnew.setImage_link(link_image);
		boardnew.setAuthor(req.getParameter("new-author"));
		boardnew.setCreated(req.getParameter("new-created"));
		boardnewService.edit(boardnew);
		
		resp.sendRedirect(req.getContextPath()+"/admin/new/list");

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
