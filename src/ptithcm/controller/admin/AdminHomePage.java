package ptithcm.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ptithcm.model.Sumary;
import ptithcm.service.SumaryService;
import ptithcm.service.impl.SumaryServicesImpl;


public class AdminHomePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SumaryService sumService = new SumaryServicesImpl();
       
    public AdminHomePage() {
        super();
    }	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Sumary> sumary = sumService.getSumary();
		request.setAttribute("sumary", sumary);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/admin/index.jsp");
		dispatcher.forward(request,response);
	}

}
