package application;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.DB;
import db.DbIntegrityException;

/* Checklist:
 *  Criar DbIntegrityException
 *  Tratar a exceção de integridade referencia
 */


public class Program {

	public static void main(String[] args) {

		Connection conn = null;
		PreparedStatement st = null;
		try {
			conn = DB.getConnection();
	
			st = conn.prepareStatement(
					"DELETE FROM department "
					+ "WHERE " //cuidado em por where para não apagar todo mundo.
					+ "Id = ?");

			st.setInt(1, 2);
			
			int rowsAffected = st.executeUpdate(); // Exception personalizada.
			
			System.out.println("Done! Rows affected: " + rowsAffected);
		}
		catch (SQLException e) {
			throw new DbIntegrityException(e.getMessage());
		} 
		finally {
			DB.closeStatement(st);
			DB.closeConnection();
		}
	}
}