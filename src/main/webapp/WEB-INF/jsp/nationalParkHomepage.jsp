<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file = "common/header.jspf" %>

<section>
	<div>
   			<c:forEach var="park" items="${allParks}" >
    			<div>
    				<div>
      	 				<c:url var="imageName" value="/img/parks/${park.parkCode.toLowerCase()}.jpg"/>
      	 				<img src="${imageName}" alt="${park.parkName}">
      	 			</div>
      	 			<div>
	      	 			<h2><c:url var="parkDetail" value="/${park.parkCode}"/>
	      	 			<a href="${parkDetail}"><c:out value="${park.parkName}"/></a></h2>
	      	 			<p><c:out value="${park.state}"/></p>
	      	 			<p><c:out value="${park.description}"/></p>
    				</div>
    			<div>
    				<hr>
    			</div>
    			</div>
			</c:forEach>
    	</div>
</section>