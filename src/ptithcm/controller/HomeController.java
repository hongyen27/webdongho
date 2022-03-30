package ptithcm.controller;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import ptithcm.model.Boardnew;
import ptithcm.model.Product;
import ptithcm.service.BoardnewService;
import ptithcm.service.ProductService;
import ptithcm.service.impl.BoardnewServicesImpl;
import ptithcm.service.impl.ProductServiceImpl;



public class HomeController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	ProductService productService = new ProductServiceImpl();
	BoardnewService boardnewService = new BoardnewServicesImpl();
	DecimalFormat df = new DecimalFormat("#.000");
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Boardnew> boardnewList = boardnewService.getAll();
		req.setAttribute("boardnewlist", boardnewList);
		// Product nam
		List<Product> product_nam= productService.getProductById(1);
		req.setAttribute("product_nam", product_nam);	
		
		// Product nu
		List<Product> product_nu= productService.getProductById(2);
		req.setAttribute("product_nu", product_nu);	
		
		// Product capdoi
		List<Product> product_capdoi= productService.getProductById(3);
		req.setAttribute("product_capdoi", product_capdoi);	
		
		// Product phukien
		List<Product> product_phukien= productService.getProductById(4);
		req.setAttribute("product_phukien", product_phukien);	
		
		// Product mới
		List<Product> product_new= productService.getProductNew();
		req.setAttribute("product_new", product_new);	
				
		// Product bán chạy
		List<Product> product_banchay= productService.getBanChay();
		req.setAttribute("product_banchay", product_banchay);	
		
		List<Product> productList = productService.getAll();
		req.setAttribute("productlist", productList);	
		//Giảm giá
		List<Product> productsList1 = new ArrayList<Product>();
		for(Product product: productList)
		{
			Product product1 = productService.get(Integer.parseInt(product.getId()));
			product1.setPrice(String.valueOf(df.format(Double.parseDouble(product.getPrice()) * (1 - (Double.parseDouble(product.getDiscount())/100)))));
			productsList1.add(product1);
			
		}

		req.setAttribute("productlist1", productsList1);
		
		// Product giảm giá
		List<Product> product_sale= productService.getProductById(5);
		req.setAttribute("product_sale", product_sale);	
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/client/index.jsp");
		dispatcher.forward(req, resp);
	}
}
