package unidev.model;

import java.util.Date;

public class Appello {
	private int appello_id;
	private int corso_id;
	private Date data_appello;
	private String aula;

	public Appello(int appello_id, int corso_id, Date data_appello, String aula) {
		super();
		this.appello_id = appello_id;
		this.corso_id = corso_id;
		this.data_appello = data_appello;
		this.aula = aula;
	}

	public int getAppello_id() {
		return appello_id;
	}

	public void setAppello_id(int appello_id) {
		this.appello_id = appello_id;
	}

	public int getCorso_id() {
		return corso_id;
	}

	public void setCorso_id(int corso_id) {
		this.corso_id = corso_id;
	}

	public Date getData_appello() {
		return data_appello;
	}

	public void setData_appello(Date data_appello) {
		this.data_appello = data_appello;
	}

	public String getAula() {
		return aula;
	}

	public void setAula(String aula) {
		this.aula = aula;
	}

}
