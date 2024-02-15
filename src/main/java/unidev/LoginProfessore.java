package unidev;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import unidev.db.DatabaseConnector;

public class LoginProfessore extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginProfessore() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/login-professore.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		try (Connection connection = DatabaseConnector.getConnection();
				PreparedStatement statement = connection
						.prepareStatement("SELECT * FROM Insegnanti WHERE email = ? AND password = ?")) {
			statement.setString(1, username);
			statement.setString(2, password);

			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) {
				request.getSession().setAttribute("professoreId", resultSet.getInt("insegnante_id"));
				response.sendRedirect("dashboardProfessore");
			} else {
				request.setAttribute("errorMessage", "Username o password non validi.");
				request.getRequestDispatcher("/login-professore.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServletException("Errore nella connessione al database");
		}
	}

}
