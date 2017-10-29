<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="common/header.jspf"%>


<section class="parkList">

	<div class="parkImage">
		<c:url var="imageName"
			value="/img/parks/${park.parkCode.toLowerCase()}.jpg" />
		<img src="${imageName}" alt="${park.parkName}">
	</div>

	<section id="park" class="parkInfo">
		<div>
			<h1>
				<c:out value="${park.parkName}" />
			</h1>
			<h4>
				<i> <c:out value="${park.quote }" /></i>
			</h4>
			<h5>
				~
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
				<td><br></td>
			</tr>
			<tr>
				<td id="Fee"><strong>Entry Fee: $<c:out
							value="${park.entryFee }" /></strong></td>
			</tr>
		</table>

		<p id="description">
			<c:out value="${park.description }" />
		</p>
	</section>
</section>
<section id="weather">
	<c:forEach items="${weatherList}" var="weather">
		<c:choose>
			<c:when test="${weather.fiveDayForecastValue == 1}">
				<div class="today">
					<c:url var="weatherImageName"
						value="/img/weather/${weather.forecast}.png" />
					<img class="todayImg" src="${weatherImageName}"
						alt="${weather.forecast } image">
					<c:choose>
						<c:when test="${tempUnit == true}">
							<!-- if tempUnit is true, provide Celsius Temp -->
							<span>High: <c:out value="${weather.highC}C" /></span>
							<br>
							<span>Low: <c:out value="${weather.lowC}C" /></span>
						</c:when>
						<c:otherwise>
							<span>High: <c:out value="${weather.high}F" /></span>
							<br>
							<span>Low: <c:out value="${weather.low}F" /></span>
						</c:otherwise>
					</c:choose>

					<p class="temps">
						<c:set var="forecast" value="${weather.forecast }" />
						<c:set var="high" value="${weather.high }" />
						<c:set var="low" value="${weather.low }" />
					</p>
					<div id="converter">

						<c:url var="convertTempUrl" value="/convertTemp" />
						<form method="POST" action="${convertTempUrl}">
							<input type="hidden" name="tempUnit" value="${!tempUnit}" /> <input
								type="hidden" name="parkCode" value="${park.parkCode}" /> <input
								type="submit" value="F/C" />
						</form>
					</div>

					<p>
						<c:out value="${weather.allAdvisory(forecast, high, low)}" />
					</p>
				</div>
			</c:when>
			<c:otherwise>
				<div class="day">
					<c:url var="weatherImageName"
						value="/img/weather/${weather.forecast}.png" />
					<img class="dayImage" src="${weatherImageName}"
						alt="${weather.forecast } image" height="200" width="200">
					<c:choose>
						<c:when test="${tempUnit == true}">
							<!-- if tempUnit is true, provide Celsius Temp -->
							<span>High: <c:out value="${weather.highC}C" /></span>
							<br>
							<span>Low: <c:out value="${weather.lowC}C" /></span>
						</c:when>
						<c:otherwise>
							<span>High: <c:out value="${weather.high}F" /></span>
							<br>
							<span>Low: <c:out value="${weather.low}F" /></span>
						</c:otherwise>
					</c:choose>

					<p class="temps">
						<c:set var="forecast" value="${weather.forecast }" />
						<c:set var="high" value="${weather.high }" />
						<c:set var="low" value="${weather.low }" />
					</p>
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</section>


<%@ include file="common/footer.jspf"%>
