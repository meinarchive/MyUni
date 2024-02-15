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

public class LoginStudente extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginStudente() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/login-studente.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;

		try {
			connection = DatabaseConnector.getConnection();
			if (connection == null) {
				throw new ServletException("Database connection could not be established.");
			}
			statement = connection.prepareStatement("SELECT * FROM Studenti WHERE email = ? AND password = ?");
			statement.setString(1, username);
			statement.setString(2, password);

			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				int studenteId = resultSet.getInt("studente_id");
				req.getSession().setAttribute("studenteId", studenteId);
				req.getSession().setAttribute("studenteLoggato", true);
				resp.sendRedirect("/unidev/dashboardStudente");
			} else {
				req.setAttribute("errorMessage", "Username o password non validi.");
				req.getRequestDispatcher("/login-studente.jsp").forward(req, resp); 
																				
			}
		} catch (SQLException e) {
			throw new ServletException("Database error occurred", e);
		} finally {
			if (resultSet != null) {
				try {
					resultSet.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
