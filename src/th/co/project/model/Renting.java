package th.co.project.model;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Renting {
	private int id_renting;
	private String start_date;
	private String end_date;
	private String return_date;
	private int total_cost;
	private int charge;
	private String status;

	private int id_user;
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private String telephone;
	private String email;
	private String user_status;

	private int id_car;
	private String maker;
	private String model;
	private String color;
	private String engine;
	private String picture;
	private String gear;
	private int passenger;
	private int cost;

	public Renting(int id_user, int id_car, String start_date, String end_date, int total_cost) {
		super();
		this.id_user = id_user;
		this.id_car = id_car;
		this.start_date = start_date;
		this.end_date = end_date;
		this.total_cost = total_cost;
	}

	public Renting() {
	}

	public int getId_renting() {
		return id_renting;
	}

	public void setId_renting(int id_renting) {
		this.id_renting = id_renting;
	}

	public int getId_user() {
		return id_user;
	}

	public void setId_user(int id_user) {
		this.id_user = id_user;
	}

	public int getId_car() {
		return id_car;
	}

	public void setId_car(int id_car) {
		this.id_car = id_car;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getReturn_date() {
		return return_date;
	}

	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}

	public int getTotal_cost() {
		return total_cost;
	}

	public void setTotal_cost(int total_cost) {
		this.total_cost = total_cost;
	}

	public int getCharge() {
		return charge;
	}

	public void setCharge(int charge) {
		this.charge = charge;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getEngine() {
		return engine;
	}

	public void setEngine(String engine) {
		this.engine = engine;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getGear() {
		return gear;
	}

	public void setGear(String gear) {
		this.gear = gear;
	}

	public int getPassenger() {
		return passenger;
	}

	public void setPassenger(int passenger) {
		this.passenger = passenger;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUser_status() {
		return user_status;
	}

	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	//Another Function
	public int remainingDate() throws ParseException {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date eDate = df.parse(end_date);
		Date td = new Date();
		String temp = df.format(td);
		Date today = df.parse(temp);
		double num = (eDate.getTime() - today.getTime()) / (1000 * 3600 * 24);
		int remain = (int) Math.ceil(num);
		return remain;
	}

	public String showRemainingDate() throws ParseException {
		int remain = remainingDate();
		if (remain == 0)
			return "Payment due!";
		else if (remain < 0) {
			return "<font color='red'>" + Math.abs(remain) + " day(s) overdue</font>";
		} else
			return "<font color='green'>" + remain + " day(s) remaining</font>";
	}

	public int calculateCharge() throws ParseException {
		int remain = remainingDate();
		if (remain >= 0)
			return 0;
		else
			return Math.abs((remain * cost) + ((cost * 10) / 100));
	}

	public String showCharge() throws ParseException {
		int charge = calculateCharge();
		if (charge > 0) {
			return "<font color='red'>+" + charge + " THB</font>";
		} else
			return "-";
	}

	public String printButton() throws ParseException {
		if (status.equals("reserved"))
			return "<button style='width:130px;' onclick='changeStatus(\""+username+"\",\""+maker+"\",\""+model+"\","+total_cost+","+id_renting+",\"received\","+calculateCharge()+")'>Receive Car</button>";
		else if (status.equals("received"))
			return "<button style='width:130px;' onclick='changeStatus(\""+username+"\",\""+maker+"\",\""+model+"\","+total_cost+","+id_renting+",\"returned\","+calculateCharge()+")'>Return Car</button>";
		
		else 
			return "<font color='green'>Transaction Done</font>";
		
	}
	
	public String printButtonDelete(){
		if (status.equals("received"))
			return "";
		else if (status.equals("reserved"))
			return "<button onclick='deleteRenting("+id_renting+")'>Cancel</button>";
		else
			return "<button onclick='deleteRenting("+id_renting+")'>Delete</button>";
		
	}

}
