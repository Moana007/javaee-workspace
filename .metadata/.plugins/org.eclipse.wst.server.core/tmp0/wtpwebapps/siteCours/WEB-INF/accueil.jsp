<%@page import="siteCours.dao.EmployeDAO"%>
<%@page import="siteCours.models.Employe"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8" />
        <title>TP5 - Partie 1 - Correction</title>
		<link rel="stylesheet" type="text/css" href="./assets/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="./assets/css/gabaritSemantique.css" />
    </head>
    <body>
    
	<!-- debut global -->
	<div id="global">
		
		<%@include file="includes/header.html" %>

		
		<section>
		<!-- debut centre <div id="centre">-->
	    
			<%@include file="includes/menu.jsp" %>
			
			
			<article id="contenu">
			<!-- debut contenu -->
			<div >
				<h1>Categorie : <% out.print(request.getAttribute("maCategorie")); %></h1>
				<h1>Categorie : <%=request.getAttribute("maCategorie")%></h1>
				<table>
					<tr>
						<th>Matricule</th>
						<th>Nom</th>
						<th>Prénom</th>
						<th>Salaire</th>
						<th>Ville</th>
						
					</tr>
				
			  <%
			  	EmployeDAO empDao = new EmployeDAO();
			    for(Employe emp : empDao.getAllEmployes(null))
			    {
			    	out.print("<tr>");
			    		out.print("<td>"+ emp.getIdEmp() +"</td>");
			    		out.print("<td>"+ emp.getNom() +"</td>");
			    		out.print("<td>"+ emp.getPrenom() +"</td>");
			    		out.print("<td>"+ emp.getSalaire() +"</td>");
			    		out.print("<td>"+ emp.getVille() +"</td>");
			    	out.print("</tr>");
			    }
			  
			  
			  %>
			</table>
			
			<h2>JSTL</h2>
			<c:if test="${emps.size() > 0 }">
			
			<c:set var="nbEmp" value="${emps.size()}" scope="page"/>
			<h2>Nb Employes : <c:out value="${ nbEmp }"/> </h2>
				<table>
					<tr>
						<th>Position</th>
						<th>Matricule</th>
						<th>Nom</th>
						<th>Prénom</th>
						<th>Salaire</th>
						<th>Ville</th>	
					</tr>
				<c:forEach items="${emps}" var="unEmp" varStatus="i">
					<tr>
						<td><c:out value="${ i.index }"/></td>
						<td><c:out value="${ unEmp.idEmp }"/></td>
						<td><c:out value="${ unEmp.nom }"/></td>
						<td><c:out value="${ unEmp.prenom }"/></td>
						<td><c:out value="${ unEmp.salaire }"/></td>
						<td><c:out value="${ unEmp.ville }"/></td>
					</tr>
				</c:forEach>
				</table>
			</c:if>
			
			<c:if test="${emps.size() == 0 }">
				<p>Aucun Employe !!!</p>
			</c:if>
			
			
			
			
			</div>
			</article>
			<!-- fin contenu -->
			
		</section>	
		<!-- fin centre  </div>-->	
	   
		<%@include file="includes/footer.html" %>

	    
	<!-- fin global -->
	</div>
	
	
    </body>
</html>