package ptithcm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ptithcm.dao.OrderedDao;
import ptithcm.jdbc.connectDB;
import ptithcm.model.Ordered;
import ptithcm.model.Transactions;


public class OrderedDaoImpl implements OrderedDao{

	@Override
	public void insert(Ordered ordered) {
		String sql = "INSERT INTO ordered(product_id, transaction_id,qty) VALUES (?, ?, ?)";
		Connection con = connectDB.getConnect();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(ordered.getProduct_id()));
			ps.setInt(2, Integer.parseInt(ordered.getTransaction_id()));
			ps.setInt(3, ordered.getQty());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
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
		List<Ordered> ordereds = new ArrayList<Ordered>();
		String sql = "SELECT od.id, product_id, transaction_id, qty, name, price FROM ordered od left join product pd on product_id=pd.id";
		Connection con = connectDB.getConnect();
		try {
			PreparedStatement ps = con.prepareStatement(sql); 
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Ordered ordered = new Ordered();
				ordered.setId(rs.getString("id"));
				ordered.setProduct_id(rs.getString("product_id"));
				ordered.setTransacsion_id(rs.getString("transaction_id"));
				ordered.setQty(Integer.parseInt(rs.getString("qty")));
				ordered.setName(rs.getString("name"));
				ordered.setPrice(rs.getFloat("price"));
				ordereds.add(ordered);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ordereds;
	}

	@Override
	public List<Ordered> getOderdetail(String id) {
		List<Ordered> ordereds = new ArrayList<Ordered>();
		String sql="SELECT  transaction_id, qty, name, price FROM ordered od left join product pd on product_id=pd.id where transaction_id=?";
		new connectDB();
		Connection con = connectDB.getConnect();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {		
				Ordered order = new Ordered();
				order.setTransacsion_id(rs.getString("transaction_id"));
				order.setQty(rs.getInt("qty"));
				order.setName(rs.getString("name"));
				order.setPrice(rs.getFloat("price"));
				ordereds.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ordereds;
	}

}
