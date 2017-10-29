<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file = "common/header.jspf" %>

<section>
	<div>
   			<c:forEach var="park" items="${allParks}" >
    			<div class="parkList">
    				<div class="parkImage">
      	 				<c:url var="imageName" value="/img/parks/${park.parkCode.toLowerCase()}.jpg"/>
      	 				<img src="${imageName}" alt="${park.parkName}">
      	 			</div>
      	 			<div class="parkInfo">
	      	 			<h2 class="parkName"><c:url var="parkDetail" value="/${park.parkCode}"/>
	      	 			<a href="${parkDetail}"><c:out value="${park.parkName}"/></a></h2>
	      	 			<p class="parkState"><c:out value="${park.state}"/></p>
	      	 			<p class="parkDescription"><c:out value="${park.description}"/></p>
    				</div>
    				<hr>
    			</div>
			</c:forEach>
    	</div>
</section>
<%@ include file="common/footer.jspf"%>