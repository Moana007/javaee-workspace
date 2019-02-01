package site_cours.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import site_cours.dao.ServiceDAO;
import site_cours.models.Service;

/**
 * Servlet implementation class AddServiceServlet
 */
@WebServlet("/AddServiceServlet")
public class AddServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getRequestDispatcher("/WEB-INF/addService.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String lib = request.getParameter("txtLib").toString();
		//System.out.println("doPost: txtLib = " + lib);
		
		if(lib.isEmpty()) {
			request.setAttribute("message", "Libelle Manquant");
		} else {
			Service objServ = new Service(0, lib);
			ServiceDAO servDao = new ServiceDAO();
			boolean insertOK = servDao.create(objServ);
			if(insertOK) {
				request.setAttribute("message", "Cat�gorie "+lib+" ajout� avec succ�s");
			} else {
				request.setAttribute("message", "/!\\ Echec lors de l'ajout /!\\");
			}
		}
		
		doGet(request, response);
	}

}
