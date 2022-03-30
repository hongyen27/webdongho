package ptithcm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ptithcm.dao.SumaryDao;
import ptithcm.jdbc.connectDB;
import ptithcm.model.Sumary;

public class SumaryDaoImpl implements SumaryDao {

	@Override
	public List<Sumary> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Sumary> getSumary() {
		List<Sumary> sumary = new ArrayList<Sumary>();
		String sql = "declare @tong float set @tong=(select sum(qty) from ordered) select top(5) id, name, price, sl,@tong as tong, round((sl*100/@tong),2) as phantram from (select product_id, sum(qty) as sl from ordered group by product_id) as a left join product as pd on a.product_id = pd.id order by sl desc";
		Connection conn = connectDB.getConnect();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) { 
				Sumary sum = new Sumary();
				sum.setId(rs.getInt("id"));
				sum.setName(rs.getString("name"));
				sum.setSl(rs.getInt("sl"));
				sum.setPrice(rs.getDouble("price"));
				sum.setPhantram(rs.getFloat("phantram"));
				sum.setTong(rs.getInt("tong"));
				sumary.add(sum);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sumary;
	}

}
