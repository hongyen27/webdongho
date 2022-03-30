package ptithcm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ptithcm.model.Ordered;
import ptithcm.service.OrderedService;
import ptithcm.service.impl.OrderedServiceImpl;

public class OrderDetailController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	OrderedService orderedService = new OrderedServiceImpl();
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id =null;
		id=req.getParameter("id");
		
		List<Ordered> orderdetail = orderedService.getOderdetail(id); 
		req.setAttribute("orderdetail", orderdetail);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/client/orderdetail.jsp");
		dispatcher.forward(req, resp);
	}
}
