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
import unidev.model.Appello;
import unidev.model.Corso;

public class DashboardProfessore extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DashboardProfessore() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Integer insegnanteId = (Integer) request.getSession().getAttribute("professoreId");
		if (insegnanteId == null) {
			response.sendRedirect("loginProfessore");
			return;
		}

		List<Corso> corsi = new ArrayList<>();
		Map<Integer, Appello> appelliPerCorso = caricaCorsiEAppelli(insegnanteId, corsi);

		request.setAttribute("corsi", corsi);
		request.setAttribute("appelliPerCorso", appelliPerCorso);
		request.getRequestDispatcher("/dashboard-professore.jsp").forward(request, response);
	}

	private Map<Integer, Appello> caricaCorsiEAppelli(Integer insegnanteId, List<Corso> corsi) {
		Map<Integer, Appello> appelliPerCorso = new HashMap<>();
		try (Connection conn = DatabaseConnector.getConnection()) {
			try (PreparedStatement stmtCorsi = conn.prepareStatement("SELECT * FROM Corsi WHERE insegnante_id = ?")) {
				stmtCorsi.setInt(1, insegnanteId);
				try (ResultSet rsCorsi = stmtCorsi.executeQuery()) {
					while (rsCorsi.next()) {
						Corso corso = new Corso(rsCorsi.getInt("corso_id"), rsCorsi.getString("titolo"),
								rsCorsi.getString("descrizione"), rsCorsi.getInt("insegnante_id"));
						corsi.add(corso);
					}
				}
			}

			for (Corso corso : corsi) {
				try (PreparedStatement stmtAppelli = conn.prepareStatement(
						"SELECT * FROM Appelli WHERE corso_id = ? ORDER BY data_appello DESC LIMIT 1")) {
					stmtAppelli.setInt(1, corso.getCorso_id());
					try (ResultSet rsAppelli = stmtAppelli.executeQuery()) {
						if (rsAppelli.next()) {
							Appello appello = new Appello(rsAppelli.getInt("appello_id"), rsAppelli.getInt("corso_id"),
									rsAppelli.getDate("data_appello"), rsAppelli.getString("aula"));
							appelliPerCorso.put(corso.getCorso_id(), appello);
						}
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return appelliPerCorso;
	}

	@SuppressWarnings("unused")
	private List<Corso> caricaCorsi(Integer insegnanteId) {
		List<Corso> corsi = new ArrayList<>();
		Map<Integer, Appello> appelliPerCorso = new HashMap<>();
		try (Connection conn = DatabaseConnector.getConnection()) {
			try (PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Corsi WHERE insegnante_id = ?")) {
				stmt.setInt(1, insegnanteId);
				try (ResultSet rs = stmt.executeQuery()) {
					while (rs.next()) {
						Corso corso = new Corso(rs.getInt("corso_id"), rs.getString("titolo"),
								rs.getString("descrizione"), rs.getInt("insegnante_id"));
						corsi.add(corso);
					}
				}
			}

			for (Corso corso : corsi) {
				try (PreparedStatement stmt = conn.prepareStatement(
						"SELECT * FROM Appelli WHERE corso_id = ? ORDER BY data_appello DESC LIMIT 1")) {
					stmt.setInt(1, corso.getCorso_id());
					try (ResultSet rs = stmt.executeQuery()) {
						if (rs.next()) {
							Appello appello = new Appello(rs.getInt("appello_id"), rs.getInt("corso_id"),
									rs.getDate("data_appello"), rs.getString("aula"));
							appelliPerCorso.put(corso.getCorso_id(), appello);
						}
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return corsi;
	}
}
