<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="post">
	
		<label for="txtPseudo">Pseudo : </label>
		<br/>
		<input type="text" name="txtPseudo" id="txtPseudo" 
			placeholder="Votre pseudo" value="${!empty pseudo?pseudo:''}"/>
		<br/>
		<label for="txtMdp">Mot de passe : </label>
		<br/>
		<input type="text" name="txtMdp" id="txtMdp" 
					placeholder="Votre Mot de Passe"/>
		<br/>
		<input type="checkbox" name="chkMemo" id="chkMemo" value="memo"/>
		<label for="chkMemo">Mémoriser les infos de Connection</label>
		<br/>
		<input type="submit" name="btnConnect" 
				id="btnConnect" value="Se Connecter"/>
	</form>
	
	<p>${!empty err ? err : "" }</p>
	
</body>
</html>