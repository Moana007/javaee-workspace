package site_cours.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import site_cours.dao.EmployesDAO;
import site_cours.dao.ServiceDAO;
import site_cours.models.Service;


/**
 * Servlet implementation class AccueilServlet
 */
@WebServlet("/AccueilServlet")
public class AccueilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		if(request.getSession().getAttribute("sessMail") != null) {
			request.setAttribute("mailUser", request.getSession().getAttribute("sessMail").toString());
		}
		
		EmployesDAO empDao = new EmployesDAO(); // <= return ArrayList
		ServiceDAO servDao = new ServiceDAO();
		String idCat = request.getParameter("idCat");
		
		if( (idCat != null) && !(idCat.isEmpty()) ) {
			request.setAttribute("objEmp", empDao.getAllServices(Integer.parseInt(idCat)));
			for (Service serv : servDao.getAllServices()) {
				if(serv.getCodeservice() == Integer.parseInt(idCat)) {
					request.setAttribute("maCategorie", serv.getLibelle());
					System.out.println("i");
					break;
				}
			}
		} else {
			request.setAttribute("maCategorie", "Toutes");
			request.setAttribute("objEmp", empDao.getAllServices(null));
		}
		
		request.getRequestDispatcher("/WEB-INF/accueil.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
