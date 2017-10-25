package com.techelevator.npgeek.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDao;
import com.techelevator.npgeek.model.WeatherDao;


public class ParkController {

	@Autowired //tell Spring give me the object here (dependency injection)
	ParkDao parkDao;
	WeatherDao weatherDao;

	@RequestMapping(path="/", method=RequestMethod.GET)
		public String showAllParks(ModelMap modelHolder){
			List<Park> parks= parkDao.getAllParks();
			modelHolder.put("allParks", parks);
			return"nationalParkHomepage";
		}
		
	
	
}
