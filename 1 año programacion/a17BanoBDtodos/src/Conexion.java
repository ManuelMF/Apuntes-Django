import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
	public static String bd="banco";
	public static String login="alumno";
	public static String pass="";
	public static String host="192.168.34.253";
	public static String url="";
	
	public static Connection con=null;

	
	public static void open() {
		
		try {
			if ((con==null) || (con.isClosed())) {
				url="jdbc:mysql://"+host+"/"+bd+"?useSSL=false";
				Class.forName("org.mariadb.jdbc.Driver");
				con=DriverManager.getConnection(url, login, pass);
			}
		} catch (Exception e) {
			System.out.println("No se puede conectar!!!");
		}
		
	}
	
	public static void close() {
		try {
			if (!con.isClosed()) {
				con.close();
			}
		} catch (Exception e) {
			
		}
	}
	
	
}