
package operatordb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

public class sqlconnect {
    
    Connection conn = null;
    
    public static Connection connect_DB(){
        
        try{
            Class.forName("org.sqlite.JDBC");
            Connection conn = DriverManager.getConnection("jdbc:sqlite:PedicabDB.db");
            System.out.println("Connection Succeded");
            return conn;
        } catch(Exception e){
            System.out.println("Connection failed" + e);
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            e.printStackTrace();
            return null;
        }

    }
    public static ObservableList<UserData>getdata(){
        Connection conn = connect_DB();
        ObservableList<UserData>list=FXCollections.observableArrayList();
        try{
            PreparedStatement ps = conn.prepareStatement("select * from Operator");
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                list.add(new UserData (rs.getString("Lastname"),
                                   rs.getString("Firstname"),
                                   rs.getString("Middlename"),
                                   rs.getString("Sex"),
                                   rs.getString("Civil_status"),
                                   rs.getInt("House_number"),
                                   rs.getString("Street"),
                                   rs.getString("Barangay"),
                                   rs.getString("City"),
                                   rs.getString("Province"),
                                   rs.getString("Operator_id"),
                                   rs.getInt("Age"),
                                   rs.getString("Birthdate"),
                                   rs.getString("phone_number")));
            }
        } catch (Exception e){
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            e.printStackTrace();
        }
        return list;
    }
}
