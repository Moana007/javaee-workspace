package site_cours.models;

public class Employes {
	
	private int matricule;
	private int codeService;

	private String nom;
	private String prenom;
	private double salaire;
	private String ville;
	
	public Employes(int matricule, int codeService, String nom, String prenom, double salaire, String ville) {
		this.matricule = matricule;
		this.codeService = codeService;
		this.setNom(nom);
		this.prenom = prenom;
		this.salaire = salaire;
		this.setVille(ville);
	}
	public Employes(int codeService, String nom, String prenom, double salaire, String ville) {
		this.codeService = codeService;
		this.setNom(nom);
		this.prenom = prenom;
		this.salaire = salaire;
		this.setVille(ville);
	}
	
	
	public String affiche() {
		return "Employes [matricule=" + matricule + ", codeService=" + codeService + ", nom=" + nom + ", prenom="
				+ prenom + ", salaire=" + salaire + ", ville=" + ville + "]";
	}

	@Override
	public String toString() {
		return "Employes [matricule=" + matricule + ", codeService=" + codeService + ", nom=" + nom + ", prenom="
				+ prenom + ", salaire=" + salaire + ", ville=" + ville + "]";
	}

	public void setMatricule(int matricule) {
		this.matricule = matricule;
	}
	public int getMatricule() {
		return matricule;
	}
	public int getCodeService() {
		return codeService;
	}
	public void setCodeService(int codeService) {
		this.codeService = codeService;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom.toUpperCase();
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public double getSalaire() {
		return salaire;
	}
	public void setSalaire(double salaire) {
		this.salaire = salaire;
	}
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville.toUpperCase();
	}
	
	
	
	
	

}
