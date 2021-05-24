package application;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DB;

/* API:
 * Statement
 * ResultSet
 * o next() [move para o próximo, retorna false se já estiver no último]
 * 
 * programa para recuperar os departamentos
 * Na classe DB, criar métodos auxiliares estáticos
 * para fechar ResultSet e Statement 
 */

public class Program {

	public static void main(String[] args) {

		Connection conn = null; // variavel que conecta ao banco de dados
		Statement st = null; // prepara uma consulta SQL para fazer a busca dos dados ao banco de dados
		ResultSet rs = null; // resultado sera armazenado na variavel rs.
		
		try {
			conn = DB.getConnection(); // conecta ao banco de dados
	
			st = conn.createStatement(); // variavel st instanciando Statement
			                             // comando SQL, atraves da coneção do banco ja instanciada.
			
			rs = st.executeQuery("select * from department"); // resultadado da consulta atribuir a variavel
			                                                  // rs do ResultSet
			
			while (rs.next()) {
				System.out.println(rs.getInt("Id") + ", " + rs.getString("Name"));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally { //fechando os recursos
			DB.closeResultSet(rs);
			DB.closeStatement(st);
			DB.closeConnection();
		}
	}
}