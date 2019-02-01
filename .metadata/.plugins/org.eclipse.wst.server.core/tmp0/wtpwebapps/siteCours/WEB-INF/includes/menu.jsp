<%@page import="siteCours.dao.ServiceDAO"%>
<%@page import="siteCours.models.Service"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" %>

    <!-- debut navigation <div id="navigation">-->
<aside>
	<nav>
		<ul>
			
			<%
				ServiceDAO servDao = new ServiceDAO();
				for(Service service : servDao.getAllServices())
				{
					out.print("<li><a href='./accueil?idCat="+ service.getCodeservice() +"'>"+ service.getLibelle() 
									+"</a></li>");
					
				}
			
			%>
			<li><a href="./accueil">Tous les Services</a></li>
			
		</ul>
	</nav>
	<p>
		${ !empty mailUser ? mailUser :"" }
		
		<c:if test="${ !empty sessionScope.sessMail }">
			<p>Bienvenue :  ${sessionScope.sessMail }</p>
			<p>Type :  ${sessionScope.sessInfo }</p>
		</c:if>
		<c:if test="${ !empty sessionScope.sessInfo }">
			<p>Type :  ${sessionScope.sessInfo }</p>
		</c:if>
		
	
	</p>
	
</aside>
<!-- fin navigation </div>-->