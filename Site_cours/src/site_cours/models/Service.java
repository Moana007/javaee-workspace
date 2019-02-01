package site_cours.models;

public class Service {

	private int codeservice;
	private String libelle;
	
	
	public Service(int codeservice, String libelle) {
		this.codeservice = codeservice;
		this.libelle = libelle;
	}
	
	public int getCodeservice() {
		return codeservice;
	}
	public void setCodeservice(int codeservice) {
		this.codeservice = codeservice;
	}
	public String getLibelle() {
		return libelle;
	}
	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}
	
}
