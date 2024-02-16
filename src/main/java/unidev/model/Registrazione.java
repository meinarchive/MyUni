package unidev.model;

public class Registrazione {
	private int registrazione_id;
	private int studente_id;
	private int appello_id;
	private String stato;
	private String corso_titolo;
	private String studentName;

	public Registrazione(int registrazione_id, int studente_id, int appello_id, String stato) {
		super();
		this.registrazione_id = registrazione_id;
		this.studente_id = studente_id;
		this.appello_id = appello_id;
		this.stato = stato;
	}

	public Registrazione(int registrazione_id, int studente_id, int appello_id, String stato, String corso_titolo, String studentName) {
		super();
		this.registrazione_id = registrazione_id;
		this.studente_id = studente_id;
		this.appello_id = appello_id;
		this.stato = stato;
		this.corso_titolo = corso_titolo;
		this.studentName = studentName;
	}

	public int getRegistrazione_id() {
		return registrazione_id;
	}

	public void setRegistrazione_id(int registrazione_id) {
		this.registrazione_id = registrazione_id;
	}

	public int getStudente_id() {
		return studente_id;
	}

	public void setStudente_id(int studente_id) {
		this.studente_id = studente_id;
	}

	public int getAppello_id() {
		return appello_id;
	}

	public void setAppello_id(int appello_id) {
		this.appello_id = appello_id;
	}

	public String getStato() {
		return stato;
	}

	public void setStato(String stato) {
		this.stato = stato;
	}

	public String getCorso_titolo() {
		return corso_titolo;
	}

	public void setCorso_titolo(String corso_titolo) {
		this.corso_titolo = corso_titolo;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

}
