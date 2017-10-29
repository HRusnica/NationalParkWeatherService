<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ include file="common/header.jspf" %>

<section>
	<h1 id="favorites">Top 5 Favorite National Parks</h1>
	
	
		<c:forEach var="entry" items="${allResults}">
			<h2><c:out value="${entry.key}"/> (<c:out value="${entry.value}"/> votes)</h2><br>
		</c:forEach>	
	


</section>	
<%@ include file="common/footer.jspf"%>