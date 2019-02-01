<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				
				<form action="" name="" method="post">
					<p>
						<label for="txtLib">Libellé : </label>
					</p>
					<p>
						<input type="text" id="txtLib" 
						name="txtLib" placeholder="Votre libellé"/>
					</p>
					<p>
						<input type="submit" name="btnAjouter" 
						id="btnAjouter" value="Ajouter une Catégorie"/>
					</p>
				</form>
				
				<p>
					${message}
				</p>
				
				
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