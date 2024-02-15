package unidev;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import unidev.db.DatabaseConnector;

public class RegistraAppelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegistraAppelloServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Integer studenteId = (Integer) session.getAttribute("studenteId");
		if (studenteId == null) {
			response.sendRedirect("loginStudente");
			return;
		}

		int appelloId = Integer.parseInt(request.getParameter("appello_id"));
		String stato = "Prenotato";

		try (Connection conn = DatabaseConnector.getConnection();
				PreparedStatement stmt = conn.prepareStatement(
						"INSERT INTO Registrazioni (studente_id, appello_id, stato) VALUES (?, ?, ?)")) {
			stmt.setInt(1, studenteId);
			stmt.setInt(2, appelloId);
			stmt.setString(3, stato);

			stmt.executeUpdate();

			response.sendRedirect("dashboardStudente");
		} catch (SQLException e) {
			e.printStackTrace();

			request.setAttribute("errorMessage",
					"Si è verificato un errore durante la registrazione. Potresti essere già registrato a questo appello.");
			request.getRequestDispatcher("/erroreRegistrazione.jsp").forward(request, response);
		}
	}

}
