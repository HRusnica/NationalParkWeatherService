<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ include file="common/header.jspf" %>

<section>
	<h1>Top 5 Favorite National Parks</h1>
	
	<div>
	
		<c:forEach var="entry" items="${allResults}">
			<c:out value="${entry.key}"/>
		</c:forEach>	
	


</section>	