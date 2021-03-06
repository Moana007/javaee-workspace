package site_cours.dao;

import java.sql.Connection;
import java.util.ArrayList;

public abstract class DAO<T> {
	
	protected Connection connect = null;
	
	public DAO(Connection conn) {
		this.connect = conn;
	}
	public DAO() {
		this.connect = Maconnection.getInstance();
	}

	public abstract ArrayList<T> getAll();
	public abstract boolean create(T obj);
	public abstract boolean delete(T obj);
	public abstract boolean update(T obj);
	public abstract T find(int id);
	
	
	
}
