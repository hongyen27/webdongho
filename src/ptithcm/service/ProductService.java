package ptithcm.service;

import java.util.List;

import ptithcm.model.Product;
public interface ProductService {
	void insert(Product product);

	void edit(Product product);

	void delete(String id);

	Product get(int id);
	
	Product get(String name);

	List<Product> getAll();
	
	List<Product> getProductNew();
	
	List<Product> getProductById(int id);

	List<Product> searchByName(String productName);

	List<Product> getProductByIdCate(int idCate);

	List<Product> getBanChay();

}

