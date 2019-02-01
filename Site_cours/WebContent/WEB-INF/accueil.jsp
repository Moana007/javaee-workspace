<%@page import ="site_cours.dao.EmployesDAO" %>
<%@page import ="site_cours.models.Employes" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<%@include file = "includes/header.jsp" %>

<section>
	<%@include file = "includes/menu.jsp" %>
	
	<article id="contenu">
		<div>
			<h1>Catégorie : <% out.print(request.getAttribute("maCategorie")); %></h1>
			
			<c:set var="nbEmp" value="${objEmp.size()}" scope="page" />
			<h2>Nombre employes : <c:out value="${ nbEmp }"/></h2>
			
			<table id="table_accueil" class="table table-striped">
				<thead>	
					<tr>
						<th scope="col">Ordre</th>
						<th scope="col">Mat.</th>
						<th scope="col">Nom</th>
						<th scope="col">Prenom</th>
						<th scope="col">Salaire</th>
						<th scope="col">Ville</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ objEmp }" var="emp" varStatus="i">
						<tr>
							<th scope='row'><c:out value="${i.index + 1}" /></th>
							<td><c:out value="${ emp.matricule }" /></td>
							<td><c:out value="${ emp.nom }" /></td>
							<td><c:out value="${ emp.prenom }" /></td>
							<td><c:out value="${ emp.salaire }" /></td>
							<td><c:out value="${ emp.ville }" /></td>
						</tr>
					</c:forEach>	
					<%-- <% EmployesDAO empDao = new EmployesDAO();
					for(Employes emp : empDao.getAllServices(null)){
						out.print("<tr><th scope='row'>"+emp.getMatricule()+"</td>"
								+"<td>"+emp.getNom()+"</td>"
								+"<td>"+emp.getPrenom()+"</td>"
								+"<td>"+emp.getSalaire()+"</td>"
								+"<td>"+emp.getVille()+"</td></tr>"
						); } %> --%>
			 	</tbody>
			</table>
			
		</div>
	</article>
</section>

<%@include file = "includes/footer.jsp" %>