package site_cours.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import site_cours.dao.UserDAO;
import site_cours.models.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		Cookie [] lesCookies = request.getCookies();
		if(lesCookies != null) {
			for (Cookie c : lesCookies) {
				if(c.getName().equals("cookPseudo")) {
					request.setAttribute("pseudo", c.getValue());
				}
			}
		}
			

		request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pseudo = request.getParameter("txtPseudo");
		String mdp = request.getParameter("txtMdp");
		String chk = request.getParameter("chkMemo");
		// --- destroy session ---
		//request.getSession().invalidate()
		//request.getSession().removeAttribute("sessInfo");
		
		boolean trouver = false;
		
		if(!pseudo.isEmpty() && !mdp.isEmpty()) {
			User usr = new UserDAO().authenticate(pseudo, mdp);		
			if(usr != null) {		
				HttpSession session = request.getSession();
				session.setAttribute("sessInfo", "User n� " + usr.getId() );
				session.setAttribute("sessMail", usr.getMail());
				
				if(chk != null && chk.equals("memo")) {
					Cookie cook = new Cookie("cookPseudo", pseudo);
					cook.setMaxAge(60*60*12);
					response.addCookie(cook);
				}
				trouver = true;
				response.sendRedirect("./accueil");
				
			} else {
				request.setAttribute("message", "<div class=\"alert alert-danger\" role=\"alert\">Login/Mot de passe ne correspondent pas. Retry.</div>");
			}
		} else {
			request.setAttribute("message", "<div class=\"alert alert-danger\" role=\"alert\">Erreurs : Veuillez renseigner tous les champs</div>");	
		}
		
		if(trouver == false)
			doGet(request, response);
	}

}
