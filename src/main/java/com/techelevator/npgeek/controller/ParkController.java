package com.techelevator.npgeek.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDao;
import com.techelevator.npgeek.model.Weather;
import com.techelevator.npgeek.model.WeatherDao;

@Controller
public class ParkController {

	@Autowired //tell Spring give me the object here (dependency injection)
	ParkDao parkDao;
	
	@Autowired
	WeatherDao weatherDao;

	@RequestMapping(path="/", method=RequestMethod.GET)
		public String showAllParks(ModelMap modelHolder, @ModelAttribute Park nationalPark){
			List<Park> parks= parkDao.getAllParks();
			modelHolder.put("allParks", parks);
			return"nationalParkHomepage";
		}
	
	@RequestMapping(path="/{parkCode}", method=RequestMethod.GET)
		public String showParkDetail(ModelMap modelHolder,
				@PathVariable String parkCode){
		for(Park p : parkDao.getAllParks()) {
			if(p.getParkCode().equals(parkCode)) {
				modelHolder.put("park", p);
			}
		
		}
		List<Weather> weatherList= weatherDao.getParkWeatherForecast(parkCode);
		modelHolder.put("weatherList", weatherList);
		return"parkDetail";
	}
	
	@RequestMapping(path="/convertTemp", method=RequestMethod.POST)
	public String addProductToCart(@RequestParam Boolean tempUnit, @RequestParam String parkCode,  HttpSession session) {
			session.setAttribute("tempUnit",tempUnit);
		
		return "redirect:/"+parkCode;
	}
			
}
