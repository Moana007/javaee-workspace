<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<%@include file = "includes/header.jsp" %>

<section>
	<%@include file = "includes/menu.jsp" %>
	
	<article id="contenu">
		<div>
			<h1>Login in/out</h1>
			<form method="POST">
			  <div class="form-group">
			    <label for="txtPseudo">Pseudo</label>
			    <input type="text" class="form-control" id="txtPseudo" name="txtPseudo"
			     value="${!empty pseudo ? pseudo : '' }" placeholder="Votre pseudo">
			  </div>
			  <div class="form-group">
			    <label for="txtMdp">Mot de passe</label>
			    <input type=password class="form-control" name="txtMdp" id="txtMdp" placeholder="Votre mot de passe">
			  	<small class="form-text text-muted">Ne partagez pas votre mot de passe !</small>
			  </div>
			  <div class="form-check">
			    <input type="checkbox" class="form-check-input" id="chkMemo" name="chkMemo" value="memo">
			    <label class="form-check-label" for="chkMemo">Mémorises les infos de connection</label>
			  </div>
			  <br>
			  <button type="submit" class="btn btn-primary" name="btnConnect" id="btnConnect">Se connecter</button>
			</form>
			
			<p>${message}</p>
			
		</div>
	</article>
</section>

<%@include file = "includes/footer.jsp" %>