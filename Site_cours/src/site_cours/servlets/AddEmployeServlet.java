package site_cours.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import site_cours.dao.EmployesDAO;
import site_cours.dao.ServiceDAO;
import site_cours.models.Employes;

/**
 * Servlet implementation class AddEmploye
 */
@WebServlet("/AddEmploye")
public class AddEmployeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		ServiceDAO servDao = new ServiceDAO();
		request.setAttribute("allServices", servDao.getAllServices());
		request.getRequestDispatcher("/WEB-INF/addEmploye.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String nom = request.getParameter("txtNom").toString();
		String prenom = request.getParameter("txtPre").toString();
		String salaire = request.getParameter("txtSal").toString();
		String ville = request.getParameter("radVille").toString();
		String codeService = request.getParameter("selectService").toString();
	
		Pattern pat = Pattern.compile("^[0-9]{1,4}(\\.[0-9]{0,2})?$"); // 3000
		Matcher mat = pat.matcher(salaire);
		
		if( nom.isEmpty() || prenom.isEmpty() || salaire.isEmpty()) {
			request.setAttribute("message", "<div class=\"alert alert-danger\" role=\"alert\">Erreurs : Veuillez renseigner tous les champs</div>");
		} else if(!mat.matches()){
			request.setAttribute("message", "<div class=\"alert alert-danger\" role=\"alert\">Erreurs : Salaire non conforme</div>");
		} else {
			Employes emp = new Employes(Integer.parseInt(codeService), nom, prenom, Integer.parseInt(salaire), ville);
			EmployesDAO empDao = new EmployesDAO();
			boolean insertOK = empDao.create(emp);
			if(insertOK) {
				request.setAttribute("message", "<div class=\"alert alert-success\" role=\"alert\">Employ� "+nom+" "+prenom+" ajout� avec succ�s</div><br><a href=\"./accueil\">Retour � l'acceuil</a>");
			} else {
				request.setAttribute("message", "<div class=\"alert alert-danger\" role=\"alert\">Erreurs : Echec lors de l'ajout </div>");
			}
		}
		doGet(request, response);
	}

}
