package application;

/* Checklist:
 *  Criar DbIntegrityException
 *  Tratar a exceção de integridade referencial
 * 
 * Demo: transações
 * Referências: https://www.ibm.com/support/knowledgecenter/en/SSGMCP_5.4.0/product-overview/acid.html
 * 
 * API:
 *  setAutoCommit(false)
 *  commit()
 *  rollback()
 */

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import db.DB;
import db.DbException;

public class Program {

	public static void main(String[] args) {

		Connection conn = null;
		Statement st = null;
		try {
			conn = DB.getConnection();
	
			conn.setAutoCommit(false); //Não é para confirmar altomaticamente a transação

			st = conn.createStatement();
			
			// atualização dos dados
			int rows1 = st.executeUpdate("UPDATE seller SET BaseSalary = 2090 WHERE DepartmentId = 1");
			
			// variavel para criar uma exceção, porém a transação no banco aconteceu
			/*
			int x = 1;
			if (x < 2) {
				throw new SQLException("Fake error");
			}
			*/
			
			// atalização dos dados
			int rows2 = st.executeUpdate("UPDATE seller SET BaseSalary = 3090 WHERE DepartmentId = 2");
			
			conn.commit(); // confirma a transação para que altere no BD
			
			System.out.println("rows1 = " + rows1);
			System.out.println("rows2 = " + rows2);
		}
		catch (SQLException e) {
			try {
				conn.rollback(); // volta no estado inical no BD. 
				throw new DbException("Transaction rolled back! Caused by: " + e.getMessage()); //lançando a exception personalizada
			} 
			catch (SQLException e1) { // caso aconteça erro no Rollback, lança exception personalizado.
				throw new DbException("Error trying to rollback! Caused by: " + e1.getMessage());
			}
		} 
		finally {
			DB.closeStatement(st);
			DB.closeConnection();
		}
	}
}