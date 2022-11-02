
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class create_table {

	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		
		try {
			String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
			String dbUser = "root";
			String dbPass = "12345";
			String query = "create table Field("
					+ "Field_ID char(10), location char(20), "
					+ "area int,  variety char(10), "
					+ "primary key(Field_ID));";
			
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();
			
			stmt.execute(query);
			
			System.out.println("table create success!");
			
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
