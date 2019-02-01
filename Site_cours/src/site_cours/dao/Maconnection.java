package site_cours.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Maconnection {
	// --- SINGLETON ---
	private String url = "jdbc:mysql://localhost:3306/gestionEmp?zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=UTC";
	private String login = "root";
	private String mdp = "root";
	
	private static Connection connect; // Varible de class car static
	
	// Constructeur priv�
	private Maconnection() {
		// -- Init driver --
 		// CLique droit sur le projet > Build Path > C://programmeFiles (x64) > Mysql > connector J8
 		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("Erreur de chargement du pilote 'cj.jdbc'");
		}
 		System.out.println("Chargement pilote OK");
 		
 		// -- Init/Recupere connexion --
		try {
			connect = DriverManager.getConnection(url, login, mdp);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Erreur de chargement pilote");
		}
 		System.out.println("Connexion OK\n");
	}
	
	public static Connection getInstance() {
		if(connect == null) {
			new Maconnection();
		}
		return connect;
	}
	
	public static void fermer() {
		if(connect != null) {
			try {
				connect.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	

}
