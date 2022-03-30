package ptithcm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ptithcm.model.Transactions;
import ptithcm.service.TransactionService;
import ptithcm.service.impl.TransactionServicesImpl;

public class OrderListAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TransactionService transactionService = new TransactionServicesImpl();
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username =null;
		username=req.getParameter("username");
		
		List<Transactions> orderaccount = transactionService.getUser(username); 
		req.setAttribute("orderlist", orderaccount);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/client/orderaccount.jsp");
		dispatcher.forward(req, resp);
	}
}
