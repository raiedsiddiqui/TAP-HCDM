<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">

</style>
<%@include file="../volunteer/volunteer_head.jsp" %>
<title>Client Surveys</title>
</head>
<body>
<%@include file="navclient.jsp" %>

<div class="container">
<h3 class="pagetitle" style="font-size:23px"> Welcome ${patient.firstName} ${patient.lastName}!</h3>
<p>Below you will see sections related to your health. In each section, you will complete some brief questions about your health goal and current health practices as well as get some tailored information sheets, suggestions and helpful links. You will receive a report within a week. The information you fill in will be shared with your family health team. You can start with any section you like; please compete all four (4) sections. If at any time you run into difficulty, please see our help resources or contact 905-525-9140 ext. 20305 for over-the-phone assistance.</p>

<h3 class="pagetitle" style="float:none">Surveys <span class="pagedesc"></span></h3>

 <c:forEach items="${inProgressSurveys}" var="ips">
	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
	<c:choose>
		<c:when test="${ips.surveyTitle=='Goals'}">
			<a href="<c:url value="/open_survey/${ips.resultID}"/>" Onclick="return goalsPrompt()" class="surveybtn btn">
				${ips.surveyTitle}<br/>
				<span class="surveydesc">${ips.description}</span>
			</a>	
		</c:when>
		<c:otherwise>					      
			<a href="<c:url value="/open_survey/${ips.resultID}"/>" class="surveybtn btn">
				${ips.surveyTitle}<br/>
				<span class="surveydesc">${ips.description}</span>
			</a>
		</c:otherwise>
	</c:choose>
	</div>
</c:forEach>
<h3 class="pagetitle" style="float:none">Completed Surveys <span class="pagedesc"></span></h3>

<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
	<c:forEach items="${completedSurveys}" var="csr">
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="headingOne">
      			<h4 class="panel-title">
      				<a class="surveybtnc btn accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse${csr.surveyID}">
      					${csr.surveyTitle}
      				</a>
      			</h4>
      		</div>

			<div id="collapse${csr.surveyID}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
				<div class="panel-body">
					<table class="table">
						<tr>
							<th>Question</th>
							<th>Answer</th>																	
						</tr>	
						<c:forEach items="${displayResults}" var="dr">	
							<c:if test="${dr.surveyId == csr.surveyID}">														      			
			      				<tr>										      			
					      			<td width="50%" height="40">${dr.questionText }</td>					      					
					      			<td width="50%">${dr.questionAnswer}</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</div>

		</div>
	</c:forEach>
</div>
</div>
</body>
</html>