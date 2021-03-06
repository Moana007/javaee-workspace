<%@page language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page test.jsp</title>
</head>
<body>

<h1>page test.jsp</h1>
<p>Resultat : ${4*3}</p>
<p>Chaine : ${ chaine }</p>
<p>Chaine : ${ empty chaine2 ? "Vide" : chaine2 }</p>
<p>Qqlles valeurs : ${ ints[0]} <br> ${ ints[3]} <br> ${ ints[4]}</p>
<p> ${ emp.nom }
	${ emp.salaire }
	${ emp.getVille() }
</p>
<p>${ emp.affiche() }</p>
<p>${ emp }</p> <!-- Appel a toString -->

<!-- JSTL : (Java Standard Tag Library) -->
	<c:out value="<script>alert('coucou')</script>" />
	<br>
	<c:out value="${ chaine }" />
	
	<c:out value="${ emp.salaire }" />
	<c:if test="${ emp.salaire > 2000 }">
		<p><c:out value="${emp.nom}"/> gagne plus de 2000</p>
	</c:if>
	<c:if test="${ emp.salaire <= 2000 }">
		<p><c:out value="${emp.nom}"/> gagne 2000 ou moins</p>
	</c:if>
	<c:set var="pseudo" value="monPseudo" scope="page" />
	<c:out value="${pseudo }" />
	
	
	<c:choose>
		<c:when test="${ emp.ville == 'Marseille'}">
			<p>Allez l'OM</p>
		</c:when>
		<c:when test="${ emp.ville == 'Paris'}">
			<p>Allez PSG</p>
		</c:when>
		<c:otherwise>
			<p>Allez la France</p>
		</c:otherwise>
	</c:choose>
	
	<c:forEach items="${ mesEmps }" var="unEmp">
		<p><c:out value="${ unEmp.nom }" /></p>
	</c:forEach>
	
	<c:forEach begin="0" end="10" step="1" var="i">
		<p><c:out value="${i}"/></p>
	</c:forEach>
	
	
	
	
</body>
</html>