<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="common/header.jspf"%>

<section>

		<div>
			<c:url var="imageName"
				value="/img/parks/${park.parkCode.toLowerCase()}.jpg" />
			<img src="${imageName}" alt="${park.parkName}">
		</div>
	
		<section id="park">
			<div>
				<h1>
					<c:out value="${park.parkName}" />
				</h1>
				<h4>
					<c:out value="${park.quote }" />
				</h4>
				<h5>
					<c:out value="${park.quoteSource }" />
				</h5>
			</div>
			<table>
				<tr>
					<td><strong>State: </strong> <c:out value="${park.state }" /></td>
					<td><strong>Acreage: </strong> <c:out value="${park.acreage }" />
						acres</td>
					<td><strong>Elevation: </strong> <c:out
							value="${park.elevation }" /> ft</td>
					<td><strong>Trail Length: </strong> <c:out
							value="${park.milesOfTrail }" /> miles</td>
					<td><strong>Animal Species: </strong> <c:out
							value="${park.numOfAnimals }" /></td>
				</tr>
				<tr>
					<td><strong>Campsites: </strong> <c:out
							value="${park.numOfCampsites }" /></td>
					<td><strong>Climate: </strong> <c:out value="${park.climate }" /></td>
					<td><strong>Founded: </strong> <c:out
							value="${park.yearFounded }" /></td>
					<td><strong>Annual Visitors: </strong> <c:out
							value="${park.annualVisitorCount }" /></td>
				</tr>
				<tr>
					<td> <br> </td>
				</tr>
				<tr>
					<td id="Fee"><strong>Entry Fee: <c:out
								value="${park.entryFee }" /></strong></td>
				</tr>
			</table>

			<p id="description">
				<c:out value="${park.description }" />
			</p>
		</section>
		<section id="weather">
			<c:forEach items="${weatherList}" var="weather">
				<c:choose>
					<c:when test="${weather.fiveDayForecastValue} == 1">
						<div>
							<c:url var="weatherImageName"
								value="/img/weather/${weather.forecast}.png" />
							<img src="${weatherImageName}" alt="${weather.forecast } image">
							<span>High: <c:out value="${weather.high }" /></span> 
							<span>Low: <c:out value="${weather.low }" /></span>
							<p>
								<c:out value="${weather.allAdvisory(weather.forecast, weather.high, weather.low)}" /> 
							</p>
						</div>
					</c:when>
					<c:otherwise>
						<div id="futureWeather">
							<c:url var="weatherImageName"
								value="/img/weather/${weather.forecast}.png" />
							<img src="${weatherImageName}" alt="${weather.forecast } image">
							<span>High: <c:out value="${weather.high }" /></span> 
							<span>Low: <c:out value="${weather.low }" /></span>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</section>
	</section>

