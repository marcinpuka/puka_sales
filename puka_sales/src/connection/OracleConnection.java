package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleConnection {

	private Connection con;

	public OracleConnection() throws CustomerException {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			open();
		} catch (ClassNotFoundException e) {
			throw new CustomerException("Could not find the database dirver");
		}
	}

	public void open() throws CustomerException {
		try {
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.16:1521:orcl", "puka", "oracle");
			con.setAutoCommit(false);
		} catch (SQLException e) {
			throw new CustomerException("Could not open database connection!");
		}
	}

	public void close() throws CustomerException {
		try {
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.16:1521:orcl", "puka", "oracle");
			con.setAutoCommit(false);
		} catch (SQLException e) {
			throw new CustomerException("Could not close database connection!");
		}
	}

	public Connection getConnection() {
		return con;
	}

}
