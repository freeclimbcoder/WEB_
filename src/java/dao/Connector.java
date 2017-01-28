package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ri
 */
public class Connector {

    private static final String username = "test";
    private static final String password = "test";
    private static final String adress = "jdbc:mysql://localhost:3306/shop";

    private Connector() throws SQLException {

        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
    }
    private static Connector connector;
    
    private Connection makeConnect() throws SQLException{
        
       return DriverManager.getConnection(adress, username, password);
    }
    
    public static Connection getConnection() throws SQLException {
        if (connector == null) {
            connector = new Connector();
        }
        return connector.makeConnect();
        
    }
}
