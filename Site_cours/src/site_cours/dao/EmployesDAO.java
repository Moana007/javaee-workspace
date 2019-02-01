package site_cours.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import site_cours.models.Employes;

public class EmployesDAO {
		
	public ArrayList<Employes> getAllServices(Integer categ){ // en maj permet de tester null
		
		ArrayList<Employes> alEmp = new ArrayList<Employes>();
		
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
 		Connection cnx = null;
 		try {
			cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionEmp?zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=UTC", "root", "root");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Erreur de connexion à la base");
		}
 		System.out.println("Connexion OK\n");
 		
 		
 		try {
 
 			String sql = "SELECT * FROM EMPLOYES";
 			if(categ != null)
 				sql += " WHERE CODESERVICE = ?";
 			PreparedStatement stmt = cnx.prepareStatement(sql);
 			if (categ != null)
 				stmt.setInt(1, categ);
 			
 			ResultSet rsEmp = stmt.executeQuery();
 			
 			while(rsEmp.next()) {
 				Employes objEmp = new Employes(rsEmp.getInt("ID_EMP"), rsEmp.getInt("CODESERVICE"), rsEmp.getString("NOM"),
 						rsEmp.getString("PRENOM"), rsEmp.getDouble("SALAIRE"),
 						rsEmp.getString("VILLE"));
 				alEmp.add(objEmp);
 			}
 			rsEmp.close();
 		} catch(SQLException e) { e.printStackTrace(); }
 		
 		finally {
 			try {
 				if(cnx != null) cnx.close();
 			} catch (SQLException e) {
 	 			e.printStackTrace();
 	 			System.out.println("Erreur de requete");
 	 		}
 		}
 		
		return alEmp;
		
	}
	
	public boolean create(Employes empACreer) {
		
		// -- Init driver --
 		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("Erreur de chargement du pilote 'cj.jdbc'");
		}
 		System.out.println("Chargement pilote OK");
 		
 		// -- Init/Recupere connexion --
 		Connection cnx = null;
 		try {
			cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionEmp?zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=UTC", "root", "root");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Erreur de connexion à la base");
		}
 		System.out.println("Connexion OK\n");
		
 		
 		int nbAffectes = 0;
 		String strSQL = "INSERT INTO EMPLOYES(CODESERVICE,NOM,PRENOM,SALAIRE,VILLE) VALUES(?,?,?,?,?)";	
 		try {
			PreparedStatement stmt = cnx.prepareStatement(strSQL);
			stmt.setInt(1, empACreer.getCodeService());
			stmt.setString(2, empACreer.getNom());
			stmt.setString(3, empACreer.getPrenom());
			stmt.setDouble(4, empACreer.getSalaire());
			stmt.setString(5, empACreer.getVille());
			nbAffectes = stmt.executeUpdate();
		} catch (SQLException e) { e.printStackTrace();	}
 		
 		finally {
 			try {
 				if(cnx != null) cnx.close();
 			} catch (SQLException e) {
 	 			e.printStackTrace();
 	 			System.out.println("Erreur de requete");
 	 		}
 		}
 		
		return nbAffectes == 1;
	}

}
