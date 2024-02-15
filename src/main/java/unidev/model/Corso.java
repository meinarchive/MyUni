package unidev.model;

public class Corso {
	private int corso_id;
	private String titolo;
	private String descrizione;
	private int insegnante_id;

	public Corso(int corso_id, String titolo, String descrizione) {
		super();
		this.corso_id = corso_id;
		this.titolo = titolo;
		this.descrizione = descrizione;
	}
	
	public Corso(int corso_id, String titolo, String descrizione, int insegnante_id) {
		super();
		this.corso_id = corso_id;
		this.titolo = titolo;
		this.descrizione = descrizione;
		this.insegnante_id = insegnante_id;
	}

	public int getCorso_id() {
		return corso_id;
	}

	public void setCorso_id(int corso_id) {
		this.corso_id = corso_id;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public int getInsegnante_id() {
		return insegnante_id;
	}

	public void setInsegnante_id(int insegnante_id) {
		this.insegnante_id = insegnante_id;
	}

}
