package unidev;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Logout() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String redirectURL = "index.jsp";

		if (session != null) {
			String userType = (String) session.getAttribute("userType");

			session.invalidate();

			System.out.println(userType);
			if ("professore".equals(userType)) {
				redirectURL = "loginProfessore";
			} else if("studente".equals(userType)) {
				redirectURL = "loginStudente";
			}
		}
		response.sendRedirect(redirectURL);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);

		// // Effettua le operazioni di logout, ad esempio invalidando la sessione
//
//        // Imposta gli header per evitare la memorizzazione nella cache
//        response.setHeader("Cache-Control", "private, no-cache, no-store, must-revalidate");
//        response.setHeader("Pragma", "no-cache");
//        response.setHeader("Expires", "0");
//
//        // Reindirizza l'utente a una pagina di login o ad altre operazioni post-logout
//        response.sendRedirect("index.jsp");
	}
}
