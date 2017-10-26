package com.techelevator.npgeek.controller;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDao;
import com.techelevator.npgeek.model.Survey;
import com.techelevator.npgeek.model.SurveyDao;


@Controller
public class SurveyController {

	@Autowired //tell Spring give me the object here (dependency injection)
	SurveyDao surveyDao;
	
	@Autowired //tell Spring give me the object here (dependency injection)
	ParkDao parkDao;
	
	//Show survey form
	@RequestMapping(path="/survey", method=RequestMethod.GET)
	public String showSurvey(ModelMap modelHolder){
		if(! modelHolder.containsAttribute("surveyPost")){ 
			modelHolder.put("surveyPost", new Survey());
		}if(! modelHolder.containsAttribute("allParks")){
		List<Park> parks= parkDao.getAllParks();
		modelHolder.put("allParks", parks);
		}
		return "survey";
	}
	
	//Save the result in database
	@RequestMapping(path="/survey", method=RequestMethod.POST)
	public String showSurvey(@Valid @ModelAttribute Survey survey, BindingResult results,
			RedirectAttributes flash){
		
		
		flash.addFlashAttribute("surveyPost", survey);
	
		if(results.hasErrors()){
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "surveyPost", results);
			return "redirect:/survey"; //If result has error then go back to register (flashscope)
		}
		surveyDao.save(survey);
		
		return "redirect:/surveyResult"; //If user inputs are valid, go find loginSuccess page
	}
		
	
	
	
	//Show survey results page
	@RequestMapping(path="/surveyResult", method=RequestMethod.GET)
	public String showSurveyResults(ModelMap modelHolder, @ModelAttribute Survey survey){
		Map<String, Integer> surveyResults= surveyDao.getTop5Results();
		modelHolder.put("allResults", surveyResults);
		return"surveyResults";
	}
}
