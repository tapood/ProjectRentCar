package th.co.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import th.co.project.dao.UserDAO;
import th.co.project.model.User;

public class UserService {

	@Autowired
	UserDAO userDAO;
	
	public void newUser(User u){
		userDAO.insertUser(u);
	}
	
	public String isValidUser(String username,String password){
		if(username.equals("")||password.equals(""))
			return "<font color='red'>Please fill in your username and password</font>";
		User user = userDAO.getUserByUsernameAndPassword(username, password);
		if(user!=null){
			if(user.getStatus().equals("member"))
				return "";
			else if(user.getStatus().equals("admin"))
				return "";
			else if(user.getStatus().equals("banned"))
				return "<font color='red'>Your account has been banned!</font>";
			else return "";
				
		}
		else{
			return "<font color='red'>Username or Password are invalid!</font>";
		}
	}
	
	public User getUser(String username,String password){
		User user = userDAO.getUserByUsernameAndPassword(username, password);
		if(user!=null){
			return user;
		}
		else return null;
	}
	
	public User getUser(int id){
		User user = userDAO.getUserByUserId(id);
		if(user!=null){
			return user;
		}
		else return null;
	}
	
	public List<User> getAllUser(){
		return userDAO.getAllUser();
	}
	
	public User updateUser(User u){
		userDAO.updateUserProfile(u);
		User user = userDAO.getUserByUserId(u.getId());
		if(user!=null){
			return user;
		}
		else return null;
	}
	
	public void deleteUser(int id){
		userDAO.deleteUser(id);
	}
	
}
