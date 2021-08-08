package autocs;
import java.sql.*;
import java.io.*;



public class conn{
	static Connection con;

	public static Connection getConnection() throws Exception {
               
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/autocanstwo","root","");
	}

	public static ResultSet getResultFromSqlQuery(String SqlQueryString) {
		ResultSet rs = null;
		try {
			con = getConnection();
			rs = con.createStatement().executeQuery(SqlQueryString);
		} catch (Exception ex) {
	          ex.printStackTrace();
		}
                
		return rs;
	}

	public static int insertUpdateFromSqlQuery(String SqlQueryString) {
		Integer result=null;
		try {
			if (con == null) {
		           con=getConnection();
			}
			result=con.createStatement().executeUpdate(SqlQueryString);
		} catch (Exception ex) {
		  ex.printStackTrace();
		}
		return result;
	}
}