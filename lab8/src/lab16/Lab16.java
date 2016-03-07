package lab16;

import java.sql.*;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.text.SimpleDateFormat;
/**
 *
 * @author Matthew Casiro
 */
public class Lab16 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
        }
        catch(Exception e){
            System.out.println(e);
        }
        Scanner scan = new Scanner(System.in);
        System.out.println("Please enter username:");
        String usr = scan.nextLine();
        System.out.println("Please enter password:");
        String pwd = scan.nextLine();
        String driver = "jdbc:oracle:thin:";
        String server = "@babbage.cs.camosun.bc.ca:1521:caleb";
        String url = driver+server;

        try (Connection conn = DriverManager.getConnection(url, usr, pwd); Statement stmt = conn.createStatement()) {
            String input = "";
            String query, fname, lname, dname, fdate;
            Date hdate;
            boolean hasData = false;
            while (true) {
                System.out.println();
                System.out.println("Please enter a filter string");
                input = scan.nextLine();
                if (input.compareToIgnoreCase("EXIT") == 0) {
                    break;
                }
                System.out.println();
                System.out.println("Employee Search: " + input);
                input = input.toUpperCase();
                System.out.println();
                query = "SELECT first_name, last_name, department_name, hire_date "
                        + "FROM employees e, departments d "
                        + "WHERE e.department_id = d.department_id "
                        + "AND (UPPER(first_name) LIKE '%"+input+"%' "
                        + "OR UPPER(last_name) LIKE '%"+input+"%')";
                ResultSet result = stmt.executeQuery(query);
                while (result.next()) {
                    hasData = true;
                    fname = result.getString("first_name");
                    lname = result.getString("last_name");
                    dname = result.getString("department_name");
                    hdate = result.getDate("hire_date");
                    SimpleDateFormat date = new SimpleDateFormat("MMMM d, YYYY");
                    fdate = date.format(hdate);
                    System.out.println("First Name: " + fname + "\tLast Name: "+lname);
                    System.out.println("Department: " + dname + "\tHire Date: "+fdate);
                    System.out.println("--------------------------------------------");
                }
                if (!hasData) {
                    System.out.println("No results.");
                }
                hasData = false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Lab16.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
