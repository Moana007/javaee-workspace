<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
	<head>
		<meta charset="UTF-8">
		<title>Site cours</title>
		<link rel="stylesheet" type="text/css" href="./assets/css/reset.css">
		<link  rel="stylesheet" type="text/css" href="./assets/css/bootstrap-4.2.1/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="./assets/css/gabaritSemantique.css">
		<script type="text/javascript" src="./assets/boostrap-4.2.1/js/boostrap.min.js"></script>
	</head>
		<body>
		
		
			<div id="global">
				
				<header>
					<h1>Gabarit 02</h1>
					<p class="sous-titre">en-tête, corps et pied de page séparés, menu vertical à gauche, largeur fixe 960px</p>
					<%-- <p>Bienvenue ${!empty mailUser ? mailUser : "Visiteur" }</p> --%>
					<c:if test="${!empty sessionScope.sessInfo }">
						<p>Bienvenue : ${sessionScope.sessInfo }</p>
					</c:if>
					<c:if test="${!empty sessionScope.sessMail }">
						<p>Type : ${sessionScope.sessMail }</p>
					</c:if>
				</header>