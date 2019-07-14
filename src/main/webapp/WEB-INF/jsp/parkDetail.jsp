<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div id="park-detail" style="background-color: white">
	
	<c:url value="/parkDetail" var="parkDetailUrl" ></c:url>
	
	
	
	
	<c:url var="parkImgSrc" value="/img/parks/${fn:toLowerCase(park.parkCode)}.jpg"/>
	<img src="${parkImgSrc}" alt="parkPicture" class="bg"/>
	
	<table align="center" cellspacing="0" cellpadding="0">
		<tr bgcolor="#409049">
		    <th width="350px">Acreage</th>
		    <th width="350px">Elevation in Feet</th>
		    <th width="350px">Miles of Trail</th>
 		 </tr>
 		<tr bgcolor="#8F9290">
		    <td align="center">${park.acreage}</td>
		    <td align="center">${park.elevationInFeet}</td> 
		    <td align="center">${park.milesOfTrail}</td>
  		</tr>
	</table><br>
	
	<table align="center" cellspacing="0" cellpadding="0">
		<tr bgcolor="#409049">
		    <th width="350px">Number of Campsites</th>
		    <th width="350px">Climate</th>
		    <th width="350px">Year Founded</th>
 		 </tr>
 		<tr bgcolor="#8F9290">
		    <td align="center">${park.numberOfCampsites}</td>
		    <td align="center">${park.climate}</td> 
		    <td align="center">${park.yearFounded}</td>
  		</tr>
	</table><br>
	
	<table align="center" cellspacing="0" cellpadding="0">
		<tr bgcolor="#409049">
		    <th width="350px">Annual Visitors</th>
		    <th width="350px">Entry Fee</th>
		    <th width="350px">Number of Animal Speicies</th>
 		 </tr>
 		<tr bgcolor="#8F9290">
		    <td align="center">${park.annualVisitorCount}</td>
		    <td align="center">$${park.entryFee}</td> 
		    <td align="center">${park.numberOfAnimalSpecies}</td>
  		</tr>
	</table><br>
	
	
	
	<div class="Park-Element" style="text-align: center;">Inspirational Quote: ${park.inspirationalQuote} ~ ${park.inspirationalQuoteSource}</div><br>
	<div class="Park-Element" style="padding-left: 40px;padding-right: 40px;">Description: ${park.parkDescription}</div>
	
	<br>
	<br>
	
	<h1 align="center">Five-Day Forecast</h1>
	
	<table align="center" cellspacing="0" cellpadding="0">
		<tr>
			<th width="350px"></th>
		    <th width="350px"></th>
		</tr>
		<tr>
			<th width="350px" height="100">
				<form method="POST" action="${parkDetailUrl}">
					  <button name="temperature" type="submit" value="fahrenheit" style="width:150px;height:50px;color: black;background-color:green;border-radius: 12px;font-weight:bold;font-size:12pt">CONVERT TO FAHRENHEIT</button>
				</form>
			</th>
			<th width="350px" height="100">
				<form method="POST" action="${parkDetailUrl}" >
  					<button name="temperature" type="submit" value="celsius" style="width:150px;height:50px;color: black;background-color:green;border-radius: 12px;font-weight:bold;font-size:12pt;">CONVERT TO CELSIUS</button>
				</form>
			</th>
		</tr>
	</table>
	
	
	
	
	<h3 style="padding-left:15px">Today</h3>
	<div class="row" style="padding-left:30px;">
	
		<c:forEach var="day" items="${weather}" varStatus="status">
		
			
			<div class="column" style="padding-right:15px;padding-left:8px;">
				<c:url var="weatherImgSrc" value="/img/weather/${day.forecast}.png"/>
				<img class="todayImg" src="${weatherImgSrc}" alt="weatherPicture" style="width:60%"/>
				<div>High: <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${day.high}"/> <%= session.getAttribute("temperature") %></div>
		        <div>Low: <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${day.low}"/> <%= session.getAttribute("temperature") %></div>
		        
		        	<br><div>${day.message}. ${day.newMessage}.</div>
		        	<div></div>
		        
		        </div>
			
		
		</c:forEach>
	</div>
	





</div><br><br>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />