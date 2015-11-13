package th.co.project.dao;
import java.sql.Connection;
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

import th.co.project.model.Car;
import th.co.project.model.Logo;
import th.co.project.model.User;

public class CarDAO {
	
	@Autowired
	DataSource dataSource;
	
	public List<Logo> getAllLogo() {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		return jdbcTemplate.query("SELECT * FROM logo ORDER BY name", new RowMapper<Logo>() {

			@Override
			public Logo mapRow(ResultSet rs, int row) throws SQLException {
				Logo logo = new Logo();
				logo.setId(rs.getInt("id_logo"));
				logo.setName(rs.getString("name"));
				logo.setPicture(rs.getString("picture"));
				return logo;
			}
		});
	}
	
	public List<Logo> getLogoByKey(String key) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		return jdbcTemplate.query("SELECT * FROM logo WHERE name LIKE '%"+key+"%' ORDER BY name", new RowMapper<Logo>() {

			@Override
			public Logo mapRow(ResultSet rs, int row) throws SQLException {
				Logo logo = new Logo();
				logo.setId(rs.getInt("id_logo"));
				logo.setName(rs.getString("name"));
				logo.setPicture(rs.getString("picture"));
				return logo;
			}
		});
	}
	
	public List<Car> getCarByKey(String key) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String query = "SELECT * FROM car WHERE maker LIKE '%"+key+"%' "
				+ "OR model LIKE '%"+key+"%'"
				+ "OR color LIKE '%"+key+"%'"
				+ "OR engine LIKE '%"+key+"%'"
				+ "OR cost LIKE '%"+key+"%'"
				+ "OR passenger LIKE '%"+key+"%'"
				+ "OR gear LIKE '%"+key+"%'";
		return jdbcTemplate.query(query, new RowMapper<Car>() {

			@Override
			public Car mapRow(ResultSet rs, int row) throws SQLException {
				Car car = new Car();
				car.setId(rs.getInt("id_car"));
				car.setMaker(rs.getString("maker"));
				car.setModel(rs.getString("model"));
				car.setColor(rs.getString("color"));
				car.setEngine(rs.getString("engine"));
				car.setCost(rs.getInt("cost"));
				car.setPicture(rs.getString("picture"));
				car.setGear(rs.getString("gear"));
				car.setPassenger(rs.getInt("passenger"));
				car.setStatus(rs.getString("status"));
				return car;				
			}
		});
	}
	
	public List<Car> getAllCar() {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		return jdbcTemplate.query("SELECT * FROM car", new RowMapper<Car>() {

			@Override
			public Car mapRow(ResultSet rs, int row) throws SQLException {
				Car car = new Car();
				car.setId(rs.getInt("id_car"));
				car.setMaker(rs.getString("maker"));
				car.setModel(rs.getString("model"));
				car.setColor(rs.getString("color"));
				car.setEngine(rs.getString("engine"));
				car.setCost(rs.getInt("cost"));
				car.setPicture(rs.getString("picture"));
				car.setGear(rs.getString("gear"));
				car.setPassenger(rs.getInt("passenger"));
				car.setStatus(rs.getString("status"));
				return car;				
			}
		});
	}
	
	public List<Car> getCarByMakerName(String key) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		return jdbcTemplate.query("SELECT * FROM car WHERE maker = '" + key +"'", new RowMapper<Car>() {

			@Override
			public Car mapRow(ResultSet rs, int row) throws SQLException {
				Car car = new Car();
				car.setId(rs.getInt("id_car"));
				car.setMaker(rs.getString("maker"));
				car.setModel(rs.getString("model"));
				car.setColor(rs.getString("color"));
				car.setEngine(rs.getString("engine"));
				car.setCost(rs.getInt("cost"));
				car.setPicture(rs.getString("picture"));
				car.setGear(rs.getString("gear"));
				car.setPassenger(rs.getInt("passenger"));
				car.setStatus(rs.getString("status"));
				return car;				
			}
		});
	}
	
	public Car getCarByCarId(int id) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		List<Car> cars =  jdbcTemplate.query("SELECT * FROM car WHERE id_car = '" + id +"'", new RowMapper<Car>() {

			@Override
			public Car mapRow(ResultSet rs, int row) throws SQLException {
				Car car = new Car();
				car.setId(rs.getInt("id_car"));
				car.setMaker(rs.getString("maker"));
				car.setModel(rs.getString("model"));
				car.setColor(rs.getString("color"));
				car.setEngine(rs.getString("engine"));
				car.setCost(rs.getInt("cost"));
				car.setPicture(rs.getString("picture"));
				car.setGear(rs.getString("gear"));
				car.setPassenger(rs.getInt("passenger"));
				car.setStatus(rs.getString("status"));
				return car;				
			}
		});
		if(cars.size()!=0l){
			return cars.get(0);
		}
		return null;		
	}
	
	public int unvailableCar(int cid) {
		Car car = getCarByCarId(cid);
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String query = "UPDATE car SET status = 'unvailable'"
				+ " WHERE id_car = " + car.getId();
		return jdbcTemplate.update(query);
	}
	
	public int availableCar(int cid) {
		Car car = getCarByCarId(cid);
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String query = "UPDATE car SET status = 'available'"
				+ " WHERE id_car = " + car.getId();
		return jdbcTemplate.update(query);
	}
	
	public void deleteCar(int id){
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String query = "DELETE FROM car WHERE id_car = "+id;
		jdbcTemplate.update(query);	
	}
	
	public Boolean updateCarInformation(Car c) {
		String query = "UPDATE car SET maker = ? "
				+ ", model = ? "
				+ ", color = ? "
				+ ", engine = ? "
				+ ", cost = ? "
				+ ", passenger = ? "
				+ ", gear = ? "
				+ ", picture = ? "
				+ "  WHERE id_car = ? ";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		return jdbcTemplate.execute(query,
				new PreparedStatementCallback<Boolean>(){

					@Override
					public Boolean doInPreparedStatement(PreparedStatement ps)
							throws SQLException, DataAccessException {
						ps.setString(1,c.getMaker());
						ps.setString(2,c.getModel());
						ps.setString(3,c.getColor());
						ps.setString(4,c.getEngine());
						ps.setInt(5,c.getCost());
						ps.setInt(6,c.getPassenger());
						ps.setString(7,c.getGear());
						ps.setString(8,c.getPicture());
						ps.setInt(9,c.getId());
						return ps.execute();
					}
		});
	}
	
	public Boolean insertCar(Car c) {
		String query = "INSERT INTO car ("
				+ "maker,"
				+ "model,"
				+ "color,"
				+ "engine,"
				+ "cost,"
				+ "passenger,"
				+ "gear,"
				+ "picture,"
				+ "status) VALUES (?,?,?,?,?,?,?,?,'available')";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		return jdbcTemplate.execute(query,
				new PreparedStatementCallback<Boolean>(){

					@Override
					public Boolean doInPreparedStatement(PreparedStatement ps)
							throws SQLException, DataAccessException {
						ps.setString(1,c.getMaker());
						ps.setString(2,c.getModel());
						ps.setString(3,c.getColor());
						ps.setString(4,c.getEngine());
						ps.setInt(5,c.getCost());
						ps.setInt(6,c.getPassenger());
						ps.setString(7,c.getGear());
						ps.setString(8,c.getPicture());
					return ps.execute();
					}
		});
	}
	
	public Boolean insertLogo(Logo logo) {
		String query = "INSERT INTO logo ("
				+ "name,"
				+ "picture) VALUES (?,?)";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		return jdbcTemplate.execute(query,
				new PreparedStatementCallback<Boolean>(){

					@Override
					public Boolean doInPreparedStatement(PreparedStatement ps)
							throws SQLException, DataAccessException {
						ps.setString(1,logo.getName());
						ps.setString(2,logo.getPicture());
					return ps.execute();
					}
		});
	}
}
