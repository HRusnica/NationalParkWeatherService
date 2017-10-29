<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ include file="common/header.jspf" %>

<section>
	<h1>National Park Survey</h1>
	<p>Thank you for taking our survey. We value your feedback.</p>
	
	<c:url var="formAction" value="/survey" />
	<form:form method="POST" action="${formAction}" modelAttribute="surveyPost">
	
		<div id="park radio button">
				<form:label path="parkcode">Select your favorite national park:  <form:errors path="parkcode" Class="error"/>
				<span class="required">*</span></form:label><br>
				<c:forEach var="park" items="${allParks}" >
					<form:radiobutton path="parkcode" value="${park.parkCode}"/><c:out value="${park.parkName}"/><br>
				</c:forEach>
				
			</div>
			<div id="email">
				<form:label path="emailAddress">E-mail: </form:label>
				<form:input path="emailAddress" type="text" />
				<form:errors path="emailAddress" Class="error"/> <span class="required">*</span>	
			</div>
			<div id="state">
			<form:label path="state">State of Residence: </form:label>
			<form:select path="state">
						<form:option value="" placeholder="select">  </form:option>
						<form:option value="AL">Alabama</form:option>
						<form:option value="AK">Alaska</form:option>
						<form:option value="AZ">Arizona</form:option>
						<form:option value="AR">Arkansas</form:option>
						<form:option value="CA">California</form:option>
						<form:option value="CO">Colorado</form:option>
						<form:option value="CT">Connecticut</form:option>
						<form:option value="DE">Delaware</form:option>
						<form:option value="DC">District Of Columbia</form:option>
						<form:option value="FL">Florida</form:option>
						<form:option value="GA">Georgia</form:option>
						<form:option value="HI">Hawaii</form:option>
						<form:option value="ID">Idaho</form:option>
						<form:option value="IL">Illinois</form:option>
						<form:option value="IN">Indiana</form:option>
						<form:option value="IA">Iowa</form:option>
						<form:option value="KS">Kansas</form:option>
						<form:option value="KY">Kentucky</form:option>
						<form:option value="LA">Louisiana</form:option>
						<form:option value="ME">Maine</form:option>
						<form:option value="MD">Maryland</form:option>
						<form:option value="MA">Massachusetts</form:option>
						<form:option value="MI">Michigan</form:option>
						<form:option value="MN">Minnesota</form:option>
						<form:option value="MS">Mississippi</form:option>
						<form:option value="MO">Missouri</form:option>
						<form:option value="MT">Montana</form:option>
						<form:option value="NE">Nebraska</form:option>
						<form:option value="NV">Nevada</form:option>
						<form:option value="NH">New Hampshire</form:option>
						<form:option value="NJ">New Jersey</form:option>
						<form:option value="NM">New Mexico</form:option>
						<form:option value="NY">New York</form:option>
						<form:option value="NC">North Carolina</form:option>
						<form:option value="ND">North Dakota</form:option>
						<form:option value="OH">Ohio</form:option>
						<form:option value="OK">Oklahoma</form:option>
						<form:option value="OR">Oregon</form:option>
						<form:option value="PA">Pennsylvania</form:option>
						<form:option value="RI">Rhode Island</form:option>
						<form:option value="SC">South Carolina</form:option>
						<form:option value="SD">South Dakota</form:option>
						<form:option value="TN">Tennessee</form:option>
						<form:option value="TX">Texas</form:option>
						<form:option value="UT">Utah</form:option>
						<form:option value="VT">Vermont</form:option>
						<form:option value="VA">Virginia</form:option>
						<form:option value="WA">Washington</form:option>
						<form:option value="WV">West Virginia</form:option>
						<form:option value="WI">Wisconsin</form:option>
						<form:option value="WY">Wyoming</form:option>
			</form:select>
			<form:errors path="state" Class="error"/> <span class="required">*</span>
			</div>
			<div id="activity level">
			<form:label path="activityLevel">Activity Level: </form:label>
			<form:select path="activityLevel">
						<form:option value="" placeholder="select">   </form:option>
						<form:option value="inactive">inactive</form:option>
						<form:option value="sedentary">sedentary</form:option>
						<form:option value="active">active</form:option>
						<form:option value="extremely_active">extremely active</form:option>
						</form:select>
				<form:errors path="activityLevel" Class="error"/> <span class="required">*</span>	
			</div>
			
			<div>
			<br>
				<input type="submit" value="Submit"/>
			</div>
		</form:form>
	
</section>
<%@ include file="common/footer.jspf"%>