package ptithcm.service.impl;

import java.util.List;

import ptithcm.dao.SumaryDao;
import ptithcm.dao.impl.SumaryDaoImpl;
import ptithcm.model.Sumary;
import ptithcm.service.SumaryService;

public class SumaryServicesImpl implements SumaryService {
	SumaryDao sumaryDao = new SumaryDaoImpl();

	@Override
	public List<Sumary> getAll() {
		return sumaryDao.getAll();
	}

	@Override
	public List<Sumary> getSumary() {
		return sumaryDao.getSumary();
	}

}
