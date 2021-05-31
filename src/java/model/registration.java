package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import javax.servlet.http.HttpSession;

public class registration {

    private Connection con;
    HttpSession se;

    public registration(HttpSession session) {
        try {

            Class.forName("com.mysql.jdbc.Driver"); // load the drivers
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/orlins", "root", "root");
            // connection with data base
            se = session;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String Registration(String name, String phone, String email, String addr, String pw) {
        PreparedStatement ps;
        String status = "";
        try {
            Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();
            rs = st.executeQuery("select * from users where phone='" + phone + "' or email='" + email + "';");
            boolean b = rs.next();
            if (b) {
                status = "existed";
            } else {
                ps = (PreparedStatement) con.prepareStatement("insert into users values(0,?,?,?,?,now(),?)");
                ps.setString(1, name);
                ps.setString(2, phone);
                ps.setString(3, email);
                ps.setString(4, addr);
                ps.setString(5, pw);
                int a = ps.executeUpdate();
                if (a > 0) {
                    status = "success";
                } else {
                    status = "failure";
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public String Login(String email, String pass) {
        String status1 = "", id = "";
        String name = "", emails = "";

        try {
            Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();

            rs = st.executeQuery("select * from users where email='" + email + "' and pswd='" + pass + "';");
            boolean b = rs.next();
            if (b == true) {
                id = rs.getString("id");
                name = rs.getString("name");
                emails = rs.getString("email");
                se.setAttribute("uname", name);
                se.setAttribute("email", email);
                se.setAttribute("id", id);
                status1 = "success";
            } else {
                status1 = "failure";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status1;
    }

    public student getInfo() {
        Statement st = null;
        ResultSet rs = null;
        student s = null;
        try {
            st = con.createStatement();
            rs = st.executeQuery("select * from users where id= '" + se.getAttribute("id") + "'");
            boolean b = rs.next();
            if (b == true) {
                s = new student();
                s.setName(rs.getString("name"));
                s.setphone(rs.getString("phone"));
                s.setemail(rs.getString("email"));
                s.setaddress(rs.getString("address"));
            } else {
                s = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    public String update(String name, String pno, String addrs) {
        String status = "";
        Statement st = null;
        ResultSet rs = null;
        try {
            st = con.createStatement();
            st.executeUpdate("update users set name='" + name + "',phone='" + pno + "',address='" + addrs + "' where id= '" + se.getAttribute("id") + "' ");
            se.setAttribute("uname", name);
            status = "success";
        } catch (Exception e) {
            status = "failure";
            e.printStackTrace();
        }

        return status;
    }

    public ArrayList<student> getuserdata() {
        Statement st;
        ResultSet rs;
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
                p.setaddress(rs.getString("address"));
                p.setdate(rs.getString("date1"));
                al.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }

    public String delete(int id) {
        int count = 0;
        Statement st = null;
        String status = "";
        try {
            st = con.createStatement();
            count = st.executeUpdate("delete from users where id='" + id + "'");
            if (count > 0) {
                status = "success";
            } else {
                status = "failure";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public String FetchNameByEmail(String uemailMobile) {
        String name = "", update = "";
        ResultSet rs = null;
        try {
            update = "select id,name from users where email=?";
            PreparedStatement preparedstatement1 = null;
            preparedstatement1 = (PreparedStatement) con.prepareStatement(update);
            preparedstatement1.setString(1, uemailMobile);
            rs = preparedstatement1.executeQuery();
            while (rs.next()) {
                name = rs.getString("id") + "__" + rs.getString("name");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return name;
    }

    //------------ Check validate email  --------------- 
    public int ValidateEmail(String uemail) {
        int count = 0;
        ResultSet rs;
        try {
            String update = "select email from users where email=?";
            PreparedStatement preparedstatement1 = null;
            preparedstatement1 = (PreparedStatement) con.prepareStatement(update);
            preparedstatement1.setString(1, uemail);
            rs = preparedstatement1.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return count;
    }

    public int PasswordTrack(String id, String name, String email, String password) {
        int status = 0;

        try {
            String qry = "insert into passwordtrack values(?,?,?,?,?,now());";
            PreparedStatement preparedstatement = null;
            preparedstatement = (PreparedStatement) con.prepareStatement(qry);
            preparedstatement.setInt(1, 0);
            preparedstatement.setString(2, id);
            preparedstatement.setString(3, name);
            preparedstatement.setString(4, email);
            preparedstatement.setString(5, password);
            status = preparedstatement.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }
    //-----------------Insert Score Data in score_t1----------------

    public password GetPasswordTrackDetails(String email, String code) {
        password s = new password();
        try {
            ResultSet rs = null;
            Statement statement = null;
            statement = (Statement) con.createStatement();
            rs = statement.executeQuery("select * from passwordtrack where email= '" + email + "'  and password='" + code + "'order by date desc limit 1;");
            while (rs.next()) {
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setPassword(rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    public int UpdatePasswordInPassTrack(String uemailMobile, String scode, String password) {
        int status = 0;
        String update = "";
        try {
            update = "UPDATE passwordtrack SET password =? WHERE email =? and password=?;";
            java.sql.PreparedStatement preparedstatement1 = null;
            preparedstatement1 = con.prepareStatement(update);
            preparedstatement1.setString(1, password);
            preparedstatement1.setString(2, uemailMobile);
            preparedstatement1.setString(3, scode);
            status = preparedstatement1.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    // ---------------Update user Password and password_date-----------------------
    public int UpdatePassword(String uemail, String password) {
        int status = 0;
        String update = "";
        try {
            update = "UPDATE users SET pswd =? WHERE email =?;";
            java.sql.PreparedStatement preparedstatement1 = null;
            preparedstatement1 = con.prepareStatement(update);
            preparedstatement1.setString(1, password);
            preparedstatement1.setString(2, uemail);
            status = preparedstatement1.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public void SendMail(String msg, String subject, String email) {
        String from = "orlin.admn@gmail.com";
        String password = "olin@admin0";
        String to = email;
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setContent(msg, "text/html");
            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<rooms> get_productinfo(String room) {
        ArrayList<rooms> al = new ArrayList<rooms>();
        try {
            Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();
            String qry = "select * from rooms where r_type='" + room + "';";
            rs = st.executeQuery(qry);
            while (rs.next()) {
                rooms p = new rooms();
                p.setR_id(rs.getString("r_id"));
                p.setR_name(rs.getString("r_name"));
                p.setR_img1(rs.getString("r_img1"));
                p.setR_img2(rs.getString("r_img2"));
                p.setR_img3(rs.getString("r_img3"));
                p.setR_img4(rs.getString("r_img4"));
                p.setR_img5(rs.getString("r_img5"));
                p.setR_cost(rs.getString("r_cost"));
                p.setR_desc(rs.getString("r_desc"));
                p.setR_serv(rs.getString("r_serv"));
                p.setR_type(rs.getString("r_type"));
                al.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }

    public ArrayList<bookings> getcartinfo() {
        ArrayList<bookings> al = new ArrayList<bookings>();
        try {
            Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();
            String qry = ("select *  from bookings where uid=" + se.getAttribute("id") + " and status='pending' order by arrival desc;");
            rs = st.executeQuery(qry);
            while (rs.next()) {
                bookings p = new bookings();
                p.setB_id(rs.getString("b_id"));
                p.setB_img(rs.getString("b_img"));
                p.setB_name(rs.getString("b_name"));
                p.setArrival(rs.getDate("arrival"));
                p.setB_cost(rs.getString("b_cost"));
                p.setStay(rs.getInt("stay"));
                al.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }
    
    public ArrayList<bookings> getbookings() {
        ArrayList<bookings> al = new ArrayList<bookings>();
        try {
            Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();
            String qry = ("select * from bookings where uid=" + se.getAttribute("id") + " and (status='confirmed' or status='rejected' or status='pending') order by arrival desc;");
            System.out.println(qry);
            rs = st.executeQuery(qry);
            while (rs.next()) {
                bookings p = new bookings();
                p.setB_id(rs.getString("b_id"));
                p.setB_img(rs.getString("b_img"));
                p.setB_name(rs.getString("b_name"));
                p.setArrival(rs.getDate("arrival"));
                p.setB_cost(rs.getString("b_cost"));
                p.setStay(rs.getInt("stay"));
                p.setStatus(rs.getString("status"));
                al.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }
    
    public ArrayList<bookings> bookedlog() {
        ArrayList<bookings> al = new ArrayList<bookings>();
        try {
            Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();
            String qry = ("select * from bookings where (status='confirmed' or status='rejected') order by arrival desc;");
            rs = st.executeQuery(qry);
            while (rs.next()) {
                bookings p = new bookings();
                p.setB_id(rs.getString("b_id"));
                p.setB_img(rs.getString("b_img"));
                p.setB_name(rs.getString("b_name"));
                p.setUname(rs.getString("uname"));
                p.setArrival(rs.getDate("arrival"));
                p.setB_cost(rs.getString("b_cost"));
                p.setStay(rs.getInt("stay"));
                p.setStatus(rs.getString("status"));
                al.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }

    public ArrayList<bookings> adminbookings() {
        ArrayList<bookings> al = new ArrayList<bookings>();
        try {
            Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();
            String qry = ("select * from bookings where status='pending' order by arrival desc;");
            rs = st.executeQuery(qry);
            while (rs.next()) {
                bookings p = new bookings();
                p.setB_id(rs.getString("b_id"));
                p.setB_img(rs.getString("b_img"));
                p.setB_name(rs.getString("b_name"));
                p.setUname(rs.getString("uname"));
                p.setArrival(rs.getDate("arrival"));
                p.setB_cost(rs.getString("b_cost"));
                p.setStay(rs.getInt("stay"));
                p.setStatus(rs.getString("status"));
                al.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }

    public String booknow(String r_id, String arrivaldate, int guests, int stay) {
        String status = "";
        try {
            Statement st = null;
            st = (Statement) con.createStatement();
            String qry = "insert into bookings select 0,r_name,r_img1,r_cost,'" + se.getAttribute("uname") + "','" + arrivaldate + "','" + guests + "','" + stay + "','" + se.getAttribute("id") + "',(select email from users where name= '" +  se.getAttribute("uname") + "') ,'pending' from rooms where r_id=" + r_id + ";";
            int a = st.executeUpdate(qry);
            status = "success";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public int deletecart(int b_id) {
        int status = 0;
        try {
            Statement st = null;
            st = (Statement) con.createStatement();
            String qry = "update bookings set status='deleted' where b_id='" + b_id + "'";
            status = st.executeUpdate(qry);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public int acceptbooking(int b_id) {
        int status = 0;
        try {
            Statement st = null;
            st = (Statement) con.createStatement();
            String qry = "update bookings set status='confirmed' where b_id='" + b_id + "'";
            status = st.executeUpdate(qry);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public int rejectbooking(int b_id) {
        int status = 0;
        try {
            Statement st = null;
            st = (Statement) con.createStatement();
            String qry = "update bookings set status='rejected' where b_id='" + b_id + "'";
            status = st.executeUpdate(qry);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    public String FetchEmailById(String b_id) {
        String email = "";
        try {
            Statement st = null;
            st = (Statement) con.createStatement();
            String qry  = "select uemail from bookings where b_id='" + b_id + "'";
            ResultSet rs = st.executeQuery(qry);
            while(rs.next()){
                email = rs.getString("uemail");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return email;
    }
    
     public String FetchNameById(String b_id) {
        String uname = "";
        try {
            Statement st = null;
            st = (Statement) con.createStatement();
            String qry  = "select uname from bookings where b_id='" + b_id + "'";
            ResultSet rs = st.executeQuery(qry);
            while(rs.next()){
                uname = rs.getString("uname");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return uname;
    }
     
      public String RoomName(String b_id) {
        String room = "";
        try {
            Statement st = null;
            st = (Statement) con.createStatement();
            String qry  = "select b_name from bookings where b_id='" + b_id + "'";
            ResultSet rs = st.executeQuery(qry);
            while(rs.next()){
                room = rs.getString("b_name");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return room;
    }
      
      public String Arrival(String b_id) {
        String arrival = "";
        try {
            Statement st = null;
            st = (Statement) con.createStatement();
            String qry  = "select arrival from bookings where b_id='" + b_id + "'";
            ResultSet rs = st.executeQuery(qry);
            while(rs.next()){
                arrival = rs.getString("arrival");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return arrival;
    }
    
    public void SendBookMail(String msg, String subject, String email) {
        String from = "";
        String password = "";
        String to = email;
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
       Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setContent(msg, "text/html");
            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }


}
