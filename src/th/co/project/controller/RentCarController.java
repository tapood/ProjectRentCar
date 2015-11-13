package th.co.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import th.co.project.dao.CarDAO;
import th.co.project.dao.RentingDAO;
import th.co.project.model.Car;
import th.co.project.model.Logo;
import th.co.project.model.Renting;
import th.co.project.model.User;
import th.co.project.services.CarService;
import th.co.project.services.UserService;

@Controller
@RequestMapping("/rentcar")
public class RentCarController {
	
	@Autowired
	CarDAO carDAO;
	@Autowired
	CarService carService;
	@Autowired
	UserService userService;
	
	@RequestMapping("/maker")
	public String showMaker(Model data,HttpServletRequest request){
		List<Logo> logoList = carDAO.getAllLogo();
		data.addAttribute("logoList",logoList);
		data.addAttribute("user",new User());
		String msg = (String)request.getSession().getAttribute("msg");
		request.getSession().removeAttribute("msg");
		data.addAttribute("msg",msg);
		data.addAttribute("keyword","keyword");
		return "index";
	}
	
	@RequestMapping("/searchmaker")
	public String searchMaker(@ModelAttribute User user,@RequestParam String key,Model data,HttpServletRequest request){
		List<Logo> logoList = carDAO.getLogoByKey(key);
		data.addAttribute("logoList",logoList);
		data.addAttribute("user",new User());
		String msg = (String)request.getSession().getAttribute("msg");
		request.getSession().removeAttribute("msg");
		data.addAttribute("msg",msg);
		data.addAttribute("keyword",key);
		return "index";
	}
	

	@RequestMapping("/cars")
	public String showModel(@ModelAttribute User user,@RequestParam String key,Model data) {
		List<Car> carList = carDAO.getCarByMakerName(key);
		data.addAttribute("carList",carList);
		data.addAttribute("keyword",key);
		return "showcar";
	}
	
	@RequestMapping("/searchcars")
	public String searachModel(@ModelAttribute User user,@RequestParam String key,Model data) {
		List<Car> carList = carDAO.getCarByKey(key);
		data.addAttribute("carList",carList);
		data.addAttribute("keyword",key);
		return "showcar";
	}
	
	@RequestMapping("/detail")
	public String showDetail(@ModelAttribute User user,@RequestParam String id,Model data) {
		Car car = carDAO.getCarByCarId(Integer.parseInt(id));
		data.addAttribute("car",car);
		return "showdetail";
	}
	
	@RequestMapping("/manageCar")
	public String manageCar(@ModelAttribute User user,Model data) {
		List<Car> carList = carDAO.getAllCar();
		data.addAttribute("manage_carList",carList);
		data.addAttribute("keyword","keyword");
		return "managecar";
	}
		
	@RequestMapping("/search")
	public String searchCar(@ModelAttribute User user,@RequestParam String key,Model data) {
		List<Car> carList = carDAO.getCarByKey(key);
		data.addAttribute("manage_carList",carList);
		data.addAttribute("keyword",key);
		return "managecar";
	}
	
	@RequestMapping("/delete")
	public String deleteCar(@ModelAttribute User user,@RequestParam String key,@RequestParam int id,Model data) {
		carDAO.deleteCar(id);
		List<Car> carList = carDAO.getCarByKey(key);
		data.addAttribute("manage_carList",carList);
		data.addAttribute("keyword","keyword");
		return "managecar";
	}
	
	@RequestMapping("/edit")
	public ModelAndView editCar(@ModelAttribute User user,@RequestParam int id,ModelMap data) {
		Car car = carDAO.getCarByCarId(id);		
		data.addAttribute("car",car);
		return new ModelAndView("editCar",data);
	}

	@RequestMapping(value = "/saveEditCar", method = RequestMethod.POST)
	public String saveEditProfile(@ModelAttribute("car") Car car){
			boolean updated = carDAO.updateCarInformation(car);
		return "redirect:/rentcar/manageCar";
	}
	
	
	@RequestMapping("/booking")
	public String bookingCar(@ModelAttribute User user,Model data,@RequestParam int uid,@RequestParam int cid,
			@RequestParam int tc,@RequestParam String sd,@RequestParam String ed) {
		Renting r = new Renting(uid,cid,sd,ed,tc);
		carService.insertCarBooking(r);
		Renting renting = carService.getLastRentingDetail();
		data.addAttribute("detail",renting);
		return "doneBooking";
	}
	
	@RequestMapping("/manageBooking")
	public String manageBooking(@ModelAttribute User user,Model data) {
		List<Renting> rentList = carService.getRentingDetail();
		data.addAttribute("rentList",rentList);
		return "managebooking";
	}
	
	@RequestMapping("/searchbooking")
	public String searchBooking(@ModelAttribute User user,@RequestParam String key,Model data) {
		List<Renting> rentList = carService.getRentingDetailByKey(key);
		data.addAttribute("rentList",rentList);
		return "managebooking";
	}
	
	@RequestMapping("/changeRentStatus")
	public String changeRentStatus(@ModelAttribute User user,@RequestParam int charge,@RequestParam int rid,@RequestParam String status,Model data) {
		carService.changeStatus(rid, status, charge);
		return "redirect:/rentcar/manageBooking";
	}
	
	@RequestMapping("/deleteRenting")
	public String deleteRenting(@ModelAttribute User user,@RequestParam int rid,Model data) {
		carService.deleteRenting(rid);
		return "redirect:/rentcar/manageBooking";
	}
	
	@RequestMapping(value = "/addnewcar",method = RequestMethod.GET)
	public ModelAndView newCarByAdmid(ModelMap data){
		List<Logo> logoList = carDAO.getAllLogo();
		data.addAttribute("newcar",new Car());
		data.addAttribute("logoList",logoList);
		return new ModelAndView("addcarbyadmin",data);
	}
	
	@RequestMapping(value = "/newcarbyadmin")
	public String regisNewCarByAdmin(@ModelAttribute("newcar") Car car){
		carDAO.insertCar(car);		
		return "redirect:/rentcar/manageCar";
	}
	
	@RequestMapping(value = "/addmaker")
	public ModelAndView newMaker(ModelMap data){
		data.addAttribute("newlogo",new Logo());
		return new ModelAndView("addmaker",data);
	}
	
	@RequestMapping(value = "/newmaker",method = RequestMethod.POST)
	public String newMaker(ModelMap data,@ModelAttribute("newlogo") Logo logo){
		carDAO.insertLogo(logo);
		return "redirect:/rentcar/addnewcar";
	}
	
	
}
