<%@page import ="site_cours.dao.ServiceDAO" %>
<%@page import ="site_cours.models.Service" %>
<aside>
	<nav>
		<ul>
			<li class="bold">Cat�gories</li>
			<%
				ServiceDAO servDao = new ServiceDAO();
				for(Service service :servDao.getAllServices()){
					out.print("<li><a href='./accueil?idCat="+service.getCodeservice()+"'>"+ service.getLibelle()+"</a></li>");
				}
			%>
			<li>--------------------</li>
			<li class="bold">Menu</li>
			<li><a href="./accueil">Tous les services</a></li>
			<li><a href="./addService">Ajouter un service</a></li>
			<li><a href="./addEmploye">Ajouter un employ�</a></li>
			<li><a href="./login">Login</a></li>
		</ul>
	</nav>
</aside>

        
      
