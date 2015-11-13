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

import th.co.project.model.User;

public class UserDAO {
public static String TABLE_NAME = "user";
	
	@Autowired
	DataSource dataSource;
	
	public Boolean insertUser(User u) {
		String query = "INSERT INTO user ("
				+ "username,"
				+ "password,"
				+ "firstname,"
				+ "lastname,"
				+ "telephone,"
				+ "email,"
				+ "status) VALUES (?,?,?,?,?,?,'member')";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		return jdbcTemplate.execute(query,
				new PreparedStatementCallback<Boolean>(){

					@Override
					public Boolean doInPreparedStatement(PreparedStatement ps)
							throws SQLException, DataAccessException {
						ps.setString(1,u.getUsername());
						ps.setString(2,u.getPassword());
						ps.setString(3,u.getFirstname());
						ps.setString(4,u.getLastname());
						ps.setString(5,u.getTelephone());
						ps.setString(6,u.getEmail());
						return ps.execute();
					}
		});
	}

	public List<User> getAllUser() {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT * FROM user";
		return  jdbcTemplate.query(sql, new RowMapper<User>() {

			@Override
			public User mapRow(ResultSet rs, int row) throws SQLException {
					User user = new User();
					user.setId(rs.getInt("id_user"));
					user.setFirstname(rs.getString("firstname"));
					user.setLastname(rs.getString("lastname"));
					user.setUsername(rs.getString("username"));
					user.setPassword(rs.getString("password"));
					user.setTelephone(rs.getString("telephone"));
					user.setEmail(rs.getString("email"));
					user.setStatus(rs.getString("status"));	
				return user;				
			}
		});		
	}
	
	public List<User> getUserByKey(String key) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT * FROM user WHERE username LIKE '%"+key+"%' "
				+ "OR password LIKE '%"+key+"%'"
				+ "OR firstname LIKE '%"+key+"%'"
				+ "OR lastname LIKE '%"+key+"%'"
				+ "OR telephone LIKE '%"+key+"%'"
				+ "OR email LIKE '%"+key+"%'"
				+ "OR status LIKE '%"+key+"%'";
		return  jdbcTemplate.query(sql, new RowMapper<User>() {

			@Override
			public User mapRow(ResultSet rs, int row) throws SQLException {
					User user = new User();
					user.setId(rs.getInt("id_user"));
					user.setFirstname(rs.getString("firstname"));
					user.setLastname(rs.getString("lastname"));
					user.setUsername(rs.getString("username"));
					user.setPassword(rs.getString("password"));
					user.setTelephone(rs.getString("telephone"));
					user.setEmail(rs.getString("email"));
					user.setStatus(rs.getString("status"));	
				return user;				
			}
		});		
	}
	
	public User getUserByUsernameAndPassword(String username,String password) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT * FROM user WHERE username = '"+username+"' AND password ='"+password+"'";
		List<User> users =  jdbcTemplate.query(sql, new RowMapper<User>() {

			@Override
			public User mapRow(ResultSet rs, int row) throws SQLException {
					User user = new User();
					user.setId(rs.getInt("id_user"));
					user.setFirstname(rs.getString("firstname"));
					user.setLastname(rs.getString("lastname"));
					user.setUsername(rs.getString("username"));
					user.setPassword(rs.getString("password"));
					user.setTelephone(rs.getString("telephone"));
					user.setEmail(rs.getString("email"));
					user.setStatus(rs.getString("status"));	
				return user;				
			}
		});
		if(users.size()!=0){
			return users.get(0);
		}
		return null;		
	}
	
	public User getUserByUserId(int id) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT * FROM user WHERE id_user = "+id;
		List<User> users =  jdbcTemplate.query(sql, new RowMapper<User>() {

			@Override
			public User mapRow(ResultSet rs, int row) throws SQLException {
					User user = new User();
					user.setId(rs.getInt("id_user"));
					user.setFirstname(rs.getString("firstname"));
					user.setLastname(rs.getString("lastname"));
					user.setUsername(rs.getString("username"));
					user.setPassword(rs.getString("password"));
					user.setTelephone(rs.getString("telephone"));
					user.setEmail(rs.getString("email"));
					user.setStatus(rs.getString("status"));	
				return user;				
			}
		});
		if(users.size()!=0){
			return users.get(0);
		}
		return null;		
	}
	
	public Boolean updateUserProfile(User u) {
		String query = "UPDATE user SET id_user = ? "
				+ ", username = ? "
				+ ", password = ? "
				+ ", firstname = ? "
				+ ", lastname = ? "
				+ ", telephone = ? "
				+ ", email = ? "
				+ ", status = ? "
				+ "  WHERE id_user = ? ";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		return jdbcTemplate.execute(query,
				new PreparedStatementCallback<Boolean>(){

					@Override
					public Boolean doInPreparedStatement(PreparedStatement ps)
							throws SQLException, DataAccessException {
						ps.setInt(1,u.getId());
						ps.setString(2,u.getUsername());
						ps.setString(3,u.getPassword());
						ps.setString(4,u.getFirstname());
						ps.setString(5,u.getLastname());
						ps.setString(6,u.getTelephone());
						ps.setString(7,u.getEmail());
						ps.setString(8,u.getStatus());
						ps.setInt(9,u.getId());
						return ps.execute();
					}
		});
	}
	
	public void deleteUser(int id){
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String query = "DELETE FROM user WHERE id_user = "+id;
		jdbcTemplate.update(query);	
	}
}
