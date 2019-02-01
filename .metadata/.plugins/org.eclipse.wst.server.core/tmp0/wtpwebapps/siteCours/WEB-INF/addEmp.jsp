<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
	
		.err
		{
			color: red;
			font-style: italic;
		}
	</style>
</head>
<body>
		<c:if test="${ !empty sessionScope.sessMail }">
			<p>Bienvenue :  ${sessionScope.sessMail }</p>
		</c:if>
	<form method="post">
		<p>
			<label for="txtNom">Nom : </label>			
		</p>
		<p>
			<input type="text" name="txtNom" id="txtNom" placeholder="Votre Nom"/>		
		</p>
		<p>
			<label for="txtPren">Prénom : </label>			
		</p>
		<p>
			<input type="text" name="txtPren" id="txtPren" placeholder="Votre prénom"/>		
		</p>
		<p>
			<label for="txtSal">Salaire : </label>			
		</p>
		<p>
			<input type="number" min="0" step="0.01" value="1000" 
				name="txtSal" id="txtSal" placeholder="Votre Salaire" />		
		</p>
		<p>
			<label for="rbParis">Ville : </label>			
		</p>
		<p>
			<input type="radio" name="rbVille" id="rbParis" value="PARIS" checked/>
			<label for="rbParis">Paris </label>	
			<input type="radio" name="rbVille" id="rbCreteil" value="CRETEIL"/>
			<label for="rbCreteil">Créteil </label>				
			<input type="radio" name="rbVille" id="rbVersailles" value="VERSAILLES"/>	
			<label for="rbVersailles">Versailles </label>			
		</p>
		<p>
			<label for="selServ">Votre service : </label>			
		</p>
		<p>
			<select name="selServ" id="selServ">
				<c:forEach items="${servs}" var="unServ">
					<option value="${unServ.codeservice}">
						<c:out value="${unServ.libelle}"></c:out>
					</option>
				</c:forEach>
			
			</select>	
		</p>		
		<p>
			<input type="submit" name="btnAddEmp" id="btnAddEmp" value="Ajouter un Employé"/>		
		</p>
	</form>

	<c:if test="${! empty messageErr }">
		<p class="err">
			<c:out value="${messageErr}"></c:out>
		</p>
	</c:if>
	<c:if test="${! empty messageOk }">
		<p>
			<c:out value="${messageOk}"></c:out>
		</p>
		<a href="./accueil">Retour à la page d'Accueil</a>
	</c:if>



</body>
</html>