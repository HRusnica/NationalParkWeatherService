package com.techelevator.npgeek.model;

import java.util.List;

public interface WeatherDao {

	public List<Weather> getParkWeatherForecast(String parkCode);
	
}
