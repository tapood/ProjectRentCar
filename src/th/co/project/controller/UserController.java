package th.co.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import th.co.project.dao.UserDAO;
import th.co.project.model.Car;
import th.co.project.model.User;
import th.co.project.services.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;
	@Autowired
	UserDAO userDAO;
	
	@RequestMapping("/checkvalid")
	public String checkUser(@ModelAttribute User user,Model data,HttpServletRequest request){
		String msg = userService.isValidUser(user.getUsername(), user.getPassword());
		HttpSession session = request.getSession();
		if(msg.equals("")){
			User u = userService.getUser(user.getUsername(), user.getPassword());
			session.setAttribute("user_login",u);
			
		}
		session.setAttribute("msg",msg);
		return "redirect:/rentcar/maker";
	}
	
	@RequestMapping("/logout")
	public String userLogOut(HttpServletRequest request){
		HttpSession session = request.getSession();	
		session.removeAttribute("user_login");
		session.removeAttribute("errorMsg");
		return "redirect:/rentcar/maker";
	}
	
	@RequestMapping(value = "/register",method = RequestMethod.GET)
	public ModelAndView newUser(ModelMap data){
		data.addAttribute("newuser",new User());
		return new ModelAndView("register",data);
	}
	
	@RequestMapping(value = "/addnewuser",method = RequestMethod.GET)
	public ModelAndView newUserByAdmin(ModelMap data){
		data.addAttribute("newuser",new User());
		return new ModelAndView("adduserbyadmin",data);
	}
	
	@RequestMapping(value = "/edit",method = RequestMethod.GET)
	public ModelAndView editProfile(@RequestParam int id,ModelMap data){
		User user = userService.getUser(id);
		data.addAttribute("user",user);
		return new ModelAndView("editProfile",data);
	}
	
	
	@RequestMapping(value = "/saveEditProfile", method = RequestMethod.POST)
	public String saveEditProfile(@ModelAttribute("user") User user,HttpServletRequest request){
		HttpSession session = request.getSession();
		session.setAttribute("user_login",userService.updateUser(user));
		return "redirect:/rentcar/maker";
	}
	
	@RequestMapping(value = "/newuser",method = RequestMethod.POST)
	public String regisNewUser(@ModelAttribute("user") User user,HttpServletRequest request){
		userService.newUser(user);
		HttpSession session = request.getSession();
		User u = userService.getUser(user.getUsername(), user.getPassword());
		session.setAttribute("user_login",u);
		session.removeAttribute("errorMsg");		
		return "redirect:/rentcar/maker";
	}
	
	@RequestMapping("/manageUser")
	public String manageUser(@ModelAttribute User user,Model data) {
		List<User> userList = userService.getAllUser();
		data.addAttribute("userList",userList);
		data.addAttribute("keyword","keyword");
		return "manageuser";
	}
	
	@RequestMapping("/search")
	public String searchUser(@ModelAttribute User user,@RequestParam String key,Model data) {
		List<User> userList = userDAO.getUserByKey(key);
		data.addAttribute("userList",userList);
		data.addAttribute("keyword",key);
		return "manageuser";
	}
	
	@RequestMapping("/delete")
	public String deleteCar(@ModelAttribute User user,@RequestParam int id,Model data) {
		userService.deleteUser(id);
		List<User> userList = userService.getAllUser();
		data.addAttribute("userList",userList);
		data.addAttribute("keyword","keyword");
		return "manageuser";
	}
	
	@RequestMapping(value = "/editadmin",method = RequestMethod.GET)
	public ModelAndView editProfileAdmin(@RequestParam int id,ModelMap data){
		User user = userService.getUser(id);
		data.addAttribute("user",user);
		return new ModelAndView("editProfileAdmin",data);
	}
	
	@RequestMapping(value = "/saveEditProfileAdmin", method = RequestMethod.POST)
	public String saveEditProfileAdmin(@ModelAttribute("user") User user,HttpServletRequest request){
		HttpSession session = request.getSession();
		if(session.getAttribute("user_login")!=null){
			User luser = (User)session.getAttribute("user_login");
			if(luser.getId()==user.getId())
				session.setAttribute("user_login",userService.updateUser(user));
			else{
				userService.updateUser(user);
			}
		}
		return "redirect:/user/manageUser";
	}
	
	@RequestMapping(value = "/newuserbyadmin",method = RequestMethod.POST)
	public String regisNewUserByAdmin(@ModelAttribute("user") User user,HttpServletRequest request){
		userService.newUser(user);	
		return "redirect:/user/manageUser";
	}
	
}
