package site_cours.models;

public class User {

	private int id;
	private String login;
	private String mdp;
	private String mail;
	
	public User(int id, String login, String mdp, String mail) {
		this.setId(id);
		this.setLogin(login);
		this.setMdp(mdp);
		this.setMail(mail);
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getMdp() {
		return mdp;
	}
	public void setMdp(String mdp) {
		this.mdp = mdp;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	
	
	
	
}
