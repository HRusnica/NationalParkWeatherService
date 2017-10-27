package com.techelevator.npgeek.model;

public class Weather {

	private String parkCode;
	private int fiveDayForecastValue;
	private int low;
	private int high;
	private int lowC ;
	private int highC;
	private String forecast;
	
	
	
	public String allAdvisory(String forecast, int high, int low){
		
		String advise = advisory(forecast);
		if(high > 75){
			advise += "  Bring an extra gallon of water.";
		}
		if(high - low > 20){
			advise += "  Wear breathable layers.";
		}
		if(low < 20){
			advise += "  Frigid temperatures are expected. Be sure to dress warmly.";
		}
		return advise;
	}
	
	public String advisory(String forecast){
		String advise= "";
		
		if(forecast.equals("snow")){
			advise ="Remember to pack snowshoes.";
		}else if(forecast.equals("rain")){
			advise = "Be sure to pack rain gear and wear waterproof shoes.";
		}else if(forecast.equals("thunderstorms")){
			advise = "Seek shelter and avoid hiking on exposed ridges.";
		}else if(forecast.equals("sunny")){
			advise = "Pack sunblock.";
		}
		return advise;
	}
		
	public  static int FConverterToC(int tempF){
		int tempC = (tempF - 32) * 5 / 9;
		return tempC;
	}
	
	
	public String getParkCode() {
		return parkCode;
	}
	public void setParkCode(String parkCode) {
		this.parkCode = parkCode;
	}
	public int getFiveDayForecastValue() {
		return fiveDayForecastValue;
	}
	public void setFiveDayForecastValue(int fiveDayForecastValue) {
		this.fiveDayForecastValue = fiveDayForecastValue;
	}
	public int getLow() {
		return low;
	}
	public void setLow(int low) {
		this.low = low;
	}
	public int getHigh() {
		return high;
	}
	public void setHigh(int high) {
		this.high = high;
	}
	public String getForecast() {
		return forecast;
	}
	public void setForecast(String forecast) {
		this.forecast = forecast;
	}

	public int getLowC() {
		return FConverterToC(low);
	}

	public int getHighC() {
		return FConverterToC(high);
	}

	
}
