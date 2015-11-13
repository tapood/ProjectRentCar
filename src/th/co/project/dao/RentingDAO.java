package th.co.project.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.RowMapper;

import th.co.project.model.Renting;
import th.co.project.model.User;

public class RentingDAO {
	@Autowired
	DataSource dataSource;
	
	public Boolean insertRenting(Renting r) {
		String query = "INSERT INTO renting ("
				+ "id_user,"
				+ "id_car,"
				+ "start_date,"
				+ "end_date,"
				+ "total_cost,"
				+ "status) VALUES (?,?,?,?,?,'reserved')";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		return jdbcTemplate.execute(query,
				new PreparedStatementCallback<Boolean>(){

					@Override
					public Boolean doInPreparedStatement(PreparedStatement ps)
							throws SQLException, DataAccessException {
						ps.setInt(1,r.getId_user());
						ps.setInt(2,r.getId_car());
						ps.setString(3,r.getStart_date());
						ps.setString(4,r.getEnd_date());
						ps.setInt(5,r.getTotal_cost());
						return ps.execute();
					}
		});
	}
	

	public Renting getLastRentingDetail() {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT r.*,u.firstname,u.lastname,c.maker,c.model,c.color,c.engine,c.passenger,c.gear "
				+ "FROM renting r "
				+ "JOIN user u USING (id_user) "
				+ "JOIN car c USING (id_car) "
				+ "ORDER BY id_renting DESC limit 1";
		List<Renting> rentings =  jdbcTemplate.query(sql, new RowMapper<Renting>() {

			@Override
			public Renting mapRow(ResultSet rs, int row) throws SQLException {
					Renting r = new Renting();
					r.setId_renting(rs.getInt("id_renting"));
					r.setId_car(rs.getInt("id_car"));
					r.setId_user(rs.getInt("id_user"));
					r.setStart_date(rs.getString("start_date"));
					r.setEnd_date(rs.getString("end_date"));
					r.setReturn_date(rs.getString("return_date"));
					r.setTotal_cost(rs.getInt("total_cost"));
					r.setCharge(rs.getInt("charge"));
					r.setStatus(rs.getString("status"));
					r.setFirstname(rs.getString("firstname"));
					r.setLastname(rs.getString("lastname"));
					r.setMaker(rs.getString("maker"));
					r.setModel(rs.getString("model"));
					r.setColor(rs.getString("color"));
					r.setEngine(rs.getString("engine"));
					r.setGear(rs.getString("gear"));
					r.setPassenger(rs.getInt("passenger"));
					
				return r;				
			}
		});
		if(rentings.size()!=0){
			return rentings.get(0);
		}
		return null;		
	}
	
	public Renting getCarIdByRentId(int rid) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT * FROM renting WHERE id_renting = "+rid;
		List<Renting> rentings =  jdbcTemplate.query(sql, new RowMapper<Renting>() {

			@Override
			public Renting mapRow(ResultSet rs, int row) throws SQLException {
					Renting r = new Renting();
					r.setId_car(rs.getInt("id_car"));					
				return r;				
			}
		});
		if(rentings.size()!=0){
			return rentings.get(0);
		}
		return null;		
	}
	
	public List<Renting> getRentingDetail() {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT r.*,u.username,u.password,u.telephone,u.email,u.status as user_status,u.firstname,u.lastname,"
				+ "c.maker,c.model,c.color,c.engine,c.passenger,c.gear,c.cost,"
				+ "DATEDIFF(end_date,CAST(now() AS DATE)) as remaining "
				+ "FROM renting r "
				+ "JOIN user u USING (id_user) "
				+ "JOIN car c USING (id_car) WHERE r.status != 'returned' ORDER BY remaining";
		return  jdbcTemplate.query(sql, new RowMapper<Renting>() {

			@Override
			public Renting mapRow(ResultSet rs, int row) throws SQLException {
					Renting r = new Renting();
					r.setId_renting(rs.getInt("id_renting"));
					r.setId_car(rs.getInt("id_car"));
					r.setId_user(rs.getInt("id_user"));
					r.setStart_date(rs.getString("start_date"));
					r.setEnd_date(rs.getString("end_date"));
					r.setReturn_date(rs.getString("return_date"));
					r.setTotal_cost(rs.getInt("total_cost"));
					r.setCharge(rs.getInt("charge"));
					r.setStatus(rs.getString("status"));
					r.setFirstname(rs.getString("firstname"));
					r.setLastname(rs.getString("lastname"));
					r.setMaker(rs.getString("maker"));
					r.setModel(rs.getString("model"));
					r.setColor(rs.getString("color"));
					r.setEngine(rs.getString("engine"));
					r.setGear(rs.getString("gear"));
					r.setPassenger(rs.getInt("passenger"));
					r.setUsername(rs.getString("username"));
					r.setPassword(rs.getString("password"));
					r.setTelephone(rs.getString("telephone"));
					r.setEmail(rs.getString("email"));
					r.setUser_status(rs.getString("user_status"));	
					r.setCost(rs.getInt("cost"));
				return r;				
			}
		});	
	}
	
	public List<Renting> getRentingDetailByKey(String key) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT r.*,u.username,u.password,u.telephone,u.email,u.status as user_status,u.firstname,u.lastname,"
				+ "c.maker,c.model,c.color,c.engine,c.passenger,c.gear,c.cost"
				+ ",DATEDIFF(end_date,CAST(now() AS DATE)) as remaining "
				+ "FROM renting r "
				+ "JOIN user u USING (id_user) "
				+ "JOIN car c USING (id_car) WHERE r.status LIKE '%"+key+"%' ORDER BY remaining";
		return  jdbcTemplate.query(sql, new RowMapper<Renting>() {

			@Override
			public Renting mapRow(ResultSet rs, int row) throws SQLException {
					Renting r = new Renting();
					r.setId_renting(rs.getInt("id_renting"));
					r.setId_car(rs.getInt("id_car"));
					r.setId_user(rs.getInt("id_user"));
					r.setStart_date(rs.getString("start_date"));
					r.setEnd_date(rs.getString("end_date"));
					r.setReturn_date(rs.getString("return_date"));
					r.setTotal_cost(rs.getInt("total_cost"));
					r.setCharge(rs.getInt("charge"));
					r.setStatus(rs.getString("status"));
					r.setFirstname(rs.getString("firstname"));
					r.setLastname(rs.getString("lastname"));
					r.setMaker(rs.getString("maker"));
					r.setModel(rs.getString("model"));
					r.setColor(rs.getString("color"));
					r.setEngine(rs.getString("engine"));
					r.setGear(rs.getString("gear"));
					r.setPassenger(rs.getInt("passenger"));
					r.setUsername(rs.getString("username"));
					r.setPassword(rs.getString("password"));
					r.setTelephone(rs.getString("telephone"));
					r.setEmail(rs.getString("email"));
					r.setUser_status(rs.getString("user_status"));	
					r.setCost(rs.getInt("cost"));
				return r;				
			}
		});	
	}

	public Boolean changeStatusToReceived(int r_id) {
		String query = "UPDATE renting SET status = 'received' "
				+ "  WHERE id_renting = ? ";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		return jdbcTemplate.execute(query,
				new PreparedStatementCallback<Boolean>(){

					@Override
					public Boolean doInPreparedStatement(PreparedStatement ps)
							throws SQLException, DataAccessException {				
						ps.setInt(1,r_id);
						return ps.execute();
					}
		});
	}
	
	public Boolean changeStatusToReturned(int r_id,int charge) {
		String query = "UPDATE renting SET status = 'returned' "
				+ ", return_date = now() "
				+ ", charge = ? "
				+ "  WHERE id_renting = ? ";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		return jdbcTemplate.execute(query,
				new PreparedStatementCallback<Boolean>(){

					@Override
					public Boolean doInPreparedStatement(PreparedStatement ps)
							throws SQLException, DataAccessException {				
						ps.setInt(1,charge);
						ps.setInt(2,r_id);
						return ps.execute();
					}
		});
	}
	
	public void deleteRenting(int rid){
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String query = "DELETE FROM renting WHERE id_renting = "+rid;
		jdbcTemplate.update(query);	
	}
	
}