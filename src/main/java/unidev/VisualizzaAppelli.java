package unidev;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import unidev.db.DatabaseConnector;
import unidev.model.Registrazione;

public class VisualizzaAppelli extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public VisualizzaAppelli() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String appelloId = request.getParameter("appelloId");
		if (appelloId == null) {
			response.sendRedirect("dashboardProfessore");
			return;
		}

		List<Registrazione> registrazioni = getRegistrazioni(appelloId);
		request.setAttribute("registrazioni", registrazioni);

		request.getRequestDispatcher("/visualizza-appelli.jsp").forward(request, response);
	}

	private List<Registrazione> getRegistrazioni(String appelloId) {
		List<Registrazione> registrazioni = new ArrayList<>();
		String sql = "SELECT Registrazioni.*, Studenti.nome, Studenti.cognome FROM Registrazioni "
				+ "JOIN Studenti ON Registrazioni.studente_id = Studenti.studente_id " + "WHERE appello_id = ?";
		try (Connection conn = DatabaseConnector.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, Integer.parseInt(appelloId));
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				String fullName = rs.getString("nome") + " " + rs.getString("cognome");
				Registrazione registrazione = new Registrazione(rs.getInt("registrazione_id"), rs.getInt("studente_id"),
						rs.getInt("appello_id"), rs.getString("stato"), "", fullName); 
																					
				registrazioni.add(registrazione);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return registrazioni;
	}

}
