<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Test Servlet</h1>
	
	<p>Résultat : ${6 * 3}</p>
	<p>Chaine : ${chaine}</p>
	
	<p>Chaine : ${empty chaine2?"Vide" : chaine2}</p>
	
	<p>
		${ints[0]} <br> ${ints[2]} <br> ${ints[4]}
	</p>
	
	<p>
		${ emp.nom }
		${ emp.salaire }
		${ emp.getVille() }
		${ emp.ville }
	</p>
	<p>
		${ emp.affiche() }
	</p>
	<p>
		${ emp }
		
	</p>
	
	<c:out value="<script>alert('Coucou');</script>"/>
	<c:out value="${chaine}"/>
	
	<c:if test="${emp.salaire > 2000}">
		<p>${emp.nom} gagne plus que 2000 </p>
	</c:if>
	<c:if test="${emp.salaire <= 2000 }">
		<p><c:out value="${emp.nom}"/> gagne 2000  ou moins</p>
	</c:if>	
	<c:set var="pseudo" value="monPseudo" scope="page"/>
	<c:out value="${pseudo}"/>
	
	<c:choose>
		<c:when test="${emp.ville =='Marseille' }">
			<p>Allez l'OM</p>
		</c:when>
		<c:when test="${emp.ville == 'Paris' }">
			<p>Allez PSG</p>
		</c:when>
		<c:otherwise>
			<p>Allez la France</p>
		</c:otherwise>
	</c:choose>
	<c:set var="nbEmp" value="${mesEmps.size()}" scope="page"/>
	
	<c:forEach items="${mesEmps}" var="unEmp" varStatus="i">
		<p><c:out value="${unEmp.nom}"/></p>
		<p><c:out value="${i.index}"/> sur <c:out value="${nbEmp}"/></p>
		<a href="/azert/${i.index}"><c:out value="${unEmp.nom}"></c:out></a>
	</c:forEach>
	
	
	<c:forEach begin="0" end="10" step="1" var="i">
		<p><c:out value="${i}"/></p>
	</c:forEach>
	
	
	
	
	
	
	
	
	
	
</body>
</html>