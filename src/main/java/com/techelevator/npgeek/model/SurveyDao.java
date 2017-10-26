package com.techelevator.npgeek.model;

import java.util.Map;

public interface SurveyDao {
	
	public Map<String, Integer> getTop5Results();
	public void save(Survey survey);
	
	

}
