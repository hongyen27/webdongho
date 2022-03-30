package ptithcm.service.impl;

import java.util.List;

import ptithcm.dao.OrderedDao;
import ptithcm.dao.impl.OrderedDaoImpl;
import ptithcm.model.Ordered;
import ptithcm.service.OrderedService;


public class OrderedServiceImpl implements OrderedService{
	OrderedDao orderDao = new OrderedDaoImpl();
	@Override
	public void insert(Ordered ordered) {
		orderDao.insert(ordered);
	}

	@Override
	public void edit(Ordered ordered) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Ordered get(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Ordered get(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Ordered> getAll() {
		return orderDao.getAll();
	}

	@Override
	public List<Ordered> getOderdetail(String id) {
		return orderDao.getOderdetail(id);
	}

}
