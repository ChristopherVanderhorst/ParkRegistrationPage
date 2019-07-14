<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<c:import url="/WEB-INF/jsp/common/header.jsp" />

<h1 style="text-align: center;">Survey Results</h1>

<c:forEach var="park" items="${popularParks}">

		<div id="park-image">
			<c:url var="parkPostHref" value="/parkDetail">
				<c:param name="id">${park.parkCode}</c:param>
			</c:url>
			<a href="${parkPostHref}"><img src="<c:url value="/img/parks/${fn:toLowerCase(park.parkCode)}.jpg" />" /></a>
			${park.parkName} ${park.totalVotes}
		</div>

		<div>
			 
		</div> 
	
</c:forEach>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />