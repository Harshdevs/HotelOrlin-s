package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import model.student;

public class user {

    Connection con;
    Statement st;
    ResultSet rs;
    ResultSet rs1;
    HttpSession se;

    public user(HttpSession session) {
        try {

            Class.forName("com.mysql.jdbc.Driver"); // load the drivers
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sookshmas", "root", "root");
            // connection with data base
            se = session;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<student> getuserdata() {
        ArrayList<student> al = new ArrayList<student>();
        try {
            st = con.createStatement();
            String qry = "select *,date_format(date,'%b %d, %Y') as date1 from users where id not in(1);";
            rs = st.executeQuery(qry);
            while (rs.next()) {
                student p = new student();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setphone(rs.getString("phone"));
                p.setemail(rs.getString("email"));
                p.setaddress(rs.getString("addr"));
                p.setdate(rs.getString("date1"));
                al.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }

    public int delete(int slno) {
        int status = 0;
        try {
            Statement st = null;
            st = (Statement) con.createStatement();
            String qry = "delete from sookshmas1 where slno='" + slno + "'";
            status = st.executeUpdate(qry);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
