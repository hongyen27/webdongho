package ptithcm.dao;

import java.util.List;

import ptithcm.model.Ordered;


public interface OrderedDao {
	void insert(Ordered ordered); 
	 
	void edit(Ordered ordered); 
	
	void delete(String id); 
 
	Ordered get(int id); 
	 
	Ordered get(String name); 
 
	List<Ordered> getAll();

	List<Ordered> getOderdetail(String id);
}
