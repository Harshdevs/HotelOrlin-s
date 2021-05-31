package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.password;

import model.registration;
import model.student;
//import model.registration1;
import model.user;

@WebServlet(name = "register", urlPatterns = {"/register"})
public class register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // type of the response sent to the client or browser
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        registration reg = new registration(session);
//        registration1 regs = new registration1(session);
        try {
            if (request.getParameter("register") != null) {

                String name = request.getParameter("name");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String addr = request.getParameter("addr");
                String pw = request.getParameter("pw");
                String cp = request.getParameter("cp");

                if (pw.equals(cp)) {
                    String status = reg.Registration(name, phone, email, addr, pw);
                    if (status.equals("existed")) {

                        request.setAttribute("status", "Existed record");
                        RequestDispatcher rd1 = request.getRequestDispatcher("register.jsp");
                        rd1.forward(request, response);

                    } else if (status.equals("success")) {
                        request.setAttribute("status", "Successfully Registered");
                        RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
                        rd1.forward(request, response);

                    } else if (status.equals("failure")) {
                        request.setAttribute("status", "Registration failed");
                        RequestDispatcher rd1 = request.getRequestDispatcher("register.jsp");
                        rd1.forward(request, response);

                    }
                }
            } else if (request.getParameter("login") != null) {
                String email = request.getParameter("email");
                String pass = request.getParameter("pw");
                String status = reg.Login(email, pass);
                if (status.equals("success")) {
                    request.setAttribute("status", "Logged In");
                    RequestDispatcher rd1 = request.getRequestDispatcher("ind.jsp");
                    rd1.forward(request, response);
                } else if (status.equals("failure")) {
                    request.setAttribute("status", "Login failed");
                    RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
                    rd1.forward(request, response);
                }
            } else if (request.getParameter("logout") != null) {
                session.invalidate();
                RequestDispatcher rd1 = request.getRequestDispatcher("ind.jsp");
                rd1.forward(request, response);
            } else if (request.getParameter("forgotpassword") != null) {
                String email = request.getParameter("email");
                int count = reg.ValidateEmail(email);
                if (count == 0) {
                    request.setAttribute("status", "Enter valid email address");
                    RequestDispatcher rd = request.getRequestDispatcher("forgotpassword.jsp");
                    rd.forward(request, response);
                } else {
                    int randnumber = 0;
                    randnumber = (int) (Math.random() * 100000);
                    String code = "" + randnumber;
                    String idName = reg.FetchNameByEmail(email);
                    String id = idName.split("__")[0];
                    String uname = idName.split("__")[1];
                    reg.PasswordTrack(id, uname, email, randnumber + "");
                    final StringBuilder sb = new StringBuilder("<html> ");
                    sb.append("<body>");
                    sb.append("<div style='width: 100%;background: aliceblue;'>");
                    sb.append("<p class=notsobig-text >Hi<strong> " + uname + ",</strong></p>");
                    sb.append(" <p class=notsobig-text>You have requested to reset your password. Kindly click the below link to reset.</p> ");
                    sb.append("<div> <a target='_blank' style='text-decoration: none;padding: 2px 14px;background: #8bc34a;border-radius: 2px;overflow: hidden;margin: 10px;margin-left: 0;width: auto;display: inline-block;border: 1px solid #76b031;font-family: Helvetica,Arial,sans-serif;' href='http://localhost:8084/register?code1=" + code + "&&email=" + email + "'> <strong style='font-size: 13px;font-weight: bold;color: white;white-space: nowrap;'>Reset Password</strong> </a></div>");
                    sb.append("</div>");
                    sb.append("</body>");
                    sb.append("</html>");
                    reg.SendMail(sb.toString(), "Password Reset Link", email);
                    session.setAttribute("securitycode1", code);
                    request.setAttribute("status", "Verification code successfully sent on your email. ");
                    RequestDispatcher rd = request.getRequestDispatcher("forgotpassword.jsp");
                    rd.forward(request, response);
                }
            } else if (request.getParameter("code1") != null && request.getParameter("email") != null) {
                try {
                    String code1 = request.getParameter("code1").replace(" ", "+");
                    String email = request.getParameter("email");
                    password s = reg.GetPasswordTrackDetails(email, code1);
                    String name = "", uemail = "", scode = "";
                    if (s.getName().length() > 0) {
                        name = s.getName();
                        uemail = s.getEmail();
                        scode = s.getPassword();//password
                    }
                    if (code1.equals(scode)) {
                        session.setAttribute("scode", scode);
                        session.setAttribute("npuname", name);
                        session.setAttribute("npuemail", uemail);
                        RequestDispatcher rd = request.getRequestDispatcher("newpassword.jsp");
                        rd.forward(request, response);
                    } else {
                        request.setAttribute("status", "Invalid or expired verification link.");
                        RequestDispatcher rd = request.getRequestDispatcher("forgotpassword.jsp");
                        rd.forward(request, response);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (session.getAttribute("scode") != null && request.getParameter("submit_NewPassword") != null) {
                try {
                    int status = 0, inPassTrack = 0;
                    String uemail = session.getAttribute("npuemail").toString();
                    String uname = session.getAttribute("npuname").toString();
                    String scode = session.getAttribute("scode").toString();

                    String pass = request.getParameter("n_password");
                    String cpass = request.getParameter("c_password");
                    if (pass.equals(cpass)) {
                        status = reg.UpdatePassword(uemail, pass);
                        inPassTrack = reg.UpdatePasswordInPassTrack(uemail, scode, pass);
                        session.setAttribute("npuname", null);
                        session.setAttribute("npuemail", null);
                        session.setAttribute("scode", null);
                        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                        rd.forward(request, response);
                    } else {
                        request.setAttribute("status", "Passwords do not match!");
                        RequestDispatcher rd = request.getRequestDispatcher("newpassword.jsp");
                        rd.forward(request, response);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
