package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcWeatherDao implements WeatherDao{

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcWeatherDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Weather> getParkWeatherForecast(String parkCode) {
		List<Weather> allWeatherForPark = new ArrayList<>();
		String sqlSelectAllWeather = "SELECT * FROM weather WHERE parkcode=?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllWeather, parkCode);
		while(results.next()) {
			Weather weather = new Weather();
			weather.setFiveDayForecastValue(results.getInt("fivedayforecastvalue"));
			weather.setForecast(results.getString("forecast"));
			weather.setHigh(results.getInt("high"));
			weather.setLow(results.getInt("low"));
			weather.setParkCode(results.getString("parkcode"));
			allWeatherForPark.add(weather);
		}
		return allWeatherForPark;
	}

}