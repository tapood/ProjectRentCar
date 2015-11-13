package th.co.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import th.co.project.dao.CarDAO;
import th.co.project.dao.RentingDAO;
import th.co.project.model.Renting;

public class CarService {

	@Autowired
	RentingDAO rentDAO;
	@Autowired
	CarDAO carDAO;
	
	public void insertCarBooking(Renting r){
		rentDAO.insertRenting(r);
		carDAO.unvailableCar(r.getId_car());
	}
	
	public Renting getLastRentingDetail(){
		Renting renting = rentDAO.getLastRentingDetail();
		if(renting!=null){
			return renting;
		}
		return null;
	}
	
	public List<Renting> getRentingDetail(){
		return rentDAO.getRentingDetail();
	}
	
	public List<Renting> getRentingDetailByKey(String key){
		return rentDAO.getRentingDetailByKey(key);
	}
	
	public void changeStatus(int r_id,String status,int charge){
		if(status.equals("received")){
			rentDAO.changeStatusToReceived(r_id);
		}
		else if(status.equals("returned")){
			rentDAO.changeStatusToReturned(r_id,charge);
			Renting r = rentDAO.getCarIdByRentId(r_id);
			int cid = r.getId_car();
			carDAO.availableCar(cid);
		}
	}
	
	public void deleteRenting(int r_id){
		Renting r = rentDAO.getCarIdByRentId(r_id);
		int cid = r.getId_car();
		carDAO.availableCar(cid);	
		rentDAO.deleteRenting(r_id);
	}
}
