
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Insert_into {

	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		
		try {
			String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
			String dbUser = "root";
			String dbPass = "12345";
			String query1 = "insert into Field values ('AR1', 'A town', 40,  'red', 'Avineyard');";
			String query2 = "insert into Field values ('AR2', 'A town', 30,  'red', 'Avineyard');";
			String query3 = "insert into Field values ('AW1', 'A town', 80,  'white', 'Avineyard');";
			
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();
			
			stmt.execute(query1);
			stmt.execute(query2);
			stmt.execute(query3);
			
			System.out.println("insert success!");
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
