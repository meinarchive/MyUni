package unidev;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import unidev.db.DatabaseConnector;
import unidev.model.Corso;
import unidev.model.Registrazione;

public class DashboardStudente extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DashboardStudente() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Integer studenteId = (Integer) request.getSession().getAttribute("studenteId");

		if (studenteId == null) {
			response.sendRedirect("loginStudente");
			return;
		}

		List<Registrazione> registrazioni = caricaRegistrazioni(studenteId);

		List<Corso> corsi = caricaCorsi();

		Map<Integer, Integer> corsoToAppelloMap = caricaMappaturaCorsoAppello();

		request.setAttribute("registrazioni", registrazioni);
		request.setAttribute("corsi", corsi);
		request.setAttribute("corsoToAppelloMap", corsoToAppelloMap);
		request.getSession().setAttribute("userType", "studente");
		request.getRequestDispatcher("/dashboard-studente.jsp").forward(request, response);
	}

	private List<Registrazione> caricaRegistrazioni(Integer studenteId) {
		List<Registrazione> registrazioni = new ArrayList<>();
		try (Connection conn = DatabaseConnector.getConnection();
				PreparedStatement stmt = conn.prepareStatement(
						"SELECT r.registrazione_id, r.studente_id, r.appello_id, r.stato, a.corso_id, c.titolo AS corso_titolo FROM Registrazioni r JOIN Appelli a ON r.appello_id = a.appello_id JOIN Corsi c ON a.corso_id = c.corso_id WHERE r.studente_id = ?")) {
			stmt.setInt(1, studenteId);
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					Registrazione registrazione = new Registrazione(rs.getInt("registrazione_id"), studenteId,
							rs.getInt("appello_id"), rs.getString("stato"), rs.getString("corso_titolo"), "");
					registrazioni.add(registrazione);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return registrazioni;
	}

	private List<Corso> caricaCorsi() {
		List<Corso> corsi = new ArrayList<>();

		try (Connection conn = DatabaseConnector.getConnection();
				PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Corsi");
				ResultSet rs = stmt.executeQuery()) {

			while (rs.next()) {
				Corso corso = new Corso(rs.getInt("corso_id"), rs.getString("titolo"), rs.getString("descrizione"));
				corsi.add(corso);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return corsi;
	}

	private Map<Integer, Integer> caricaMappaturaCorsoAppello() {
		Map<Integer, Integer> corsoToAppelloMap = new HashMap<>();
		try (Connection conn = DatabaseConnector.getConnection();
				PreparedStatement stmt = conn.prepareStatement(
						"SELECT corso_id, MAX(appello_id) AS appello_id FROM Appelli GROUP BY corso_id");
				ResultSet rs = stmt.executeQuery()) {
			while (rs.next()) {
				corsoToAppelloMap.put(rs.getInt("corso_id"), rs.getInt("appello_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return corsoToAppelloMap;
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
