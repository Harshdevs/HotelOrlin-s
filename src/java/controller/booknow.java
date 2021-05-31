package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.registration;
import model.bookings;
import model.rooms;
import model.user;

@WebServlet(name = "booknow", urlPatterns = {"/booknow"})
public class booknow extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        registration reg = new registration(session);
        try {
            if (request.getParameter("booknow") != null) {
                String r_id = request.getParameter("r_id");
                String arrivaldate = request.getParameter("arrivaldate");
                out.println(arrivaldate);
                int guests = Integer.parseInt(request.getParameter("guests"));
                out.println(guests);
                int stay = Integer.parseInt(request.getParameter("stay"));
                out.println(stay);
                String status = reg.booknow(r_id, arrivaldate, guests, stay);
                out.println(r_id);
                if (status.equals("success")) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Room Booked..!!');");
                    out.println("</script>");
                    RequestDispatcher rd1 = request.getRequestDispatcher("booked.jsp");
                    rd1.forward(request, response);
                }
            } else if (request.getParameter("delete") != null) {
                int b_id = Integer.parseInt(request.getParameter("b_id"));
                int status = reg.deletecart(b_id);
                if (status > 0) {
                    out.println(status);
                    RequestDispatcher rd1 = request.getRequestDispatcher("booked.jsp");
                    rd1.forward(request, response);
                }
            } else if (request.getParameter("accept") != null) {
                String id = request.getParameter("b_id");
                int b_id = Integer.parseInt(request.getParameter("b_id"));
                int status = reg.acceptbooking(b_id);
                String email = reg.FetchEmailById(id);
                String name = reg.FetchNameById(id);
                String room = reg.RoomName(id);
                String arrival = reg.Arrival(id);
      
                final StringBuilder sb = new StringBuilder("<html> ");
                    sb.append("<body>");
                    sb.append("<div style='width: 100%;background: aliceblue;'>");
                    sb.append("<p class=notsobig-text >Hi<strong> " + name + ",</strong></p>");
                    sb.append(" <p class=notsobig-text>Your requested " + room + " room is booked successfully dated on " + arrival + ". Kindly click the below link to check it.</p> ");
                    sb.append("<div> <a target='_blank' style='text-decoration: none;padding: 2px 14px;background: #8bc34a;border-radius: 2px;overflow: hidden;margin: 10px;margin-left: 0;width: auto;display: inline-block;border: 1px solid #76b031;font-family: Helvetica,Arial,sans-serif;' href='http://localhost:8084/register?logout=yes' > <strong style='font-size: 13px;font-weight: bold;color: white;white-space: nowrap;'>Check Booking</strong> </a></div>");
                    sb.append("</div>");
                    sb.append("</body>");
                    sb.append("</html>");
                    reg.SendBookMail(sb.toString(), "Booking Confirmation Mail", email);
                    RequestDispatcher rd = request.getRequestDispatcher("adminbookings.jsp");
                    rd.forward(request, response);
                    
                if (status > 0) {
                    out.println(status);
                    RequestDispatcher rd1 = request.getRequestDispatcher("adminbookings.jsp");
                    rd1.forward(request, response);
                }
            } else if (request.getParameter("reject") != null) {
                String id = request.getParameter("b_id");
                int b_id = Integer.parseInt(request.getParameter("b_id"));
                int status = reg.rejectbooking(b_id);
                String email = reg.FetchEmailById(id);
                String name = reg.FetchNameById(id);
                String room = reg.RoomName(id);
                String arrival = reg.Arrival(id);
      
                final StringBuilder sb = new StringBuilder("<html> ");
                    sb.append("<body>");
                    sb.append("<div style='width: 100%;background: aliceblue;'>");
                    sb.append("<p class=notsobig-text >Hi<strong> " + name + ",</strong></p>");
                    sb.append(" <p class=notsobig-text>We are sorry to inform you that your requested " + room + " room is not available for booking dated on " + arrival + ". Kindly click the below link to book other room.</p> ");
                    sb.append("<div> <a target='_blank' style='text-decoration: none;padding: 2px 14px;background: #8bc34a;border-radius: 2px;overflow: hidden;margin: 10px;margin-left: 0;width: auto;display: inline-block;border: 1px solid #76b031;font-family: Helvetica,Arial,sans-serif;' href='http://localhost:8084/register?logout=yes'> <strong style='font-size: 13px;font-weight: bold;color: white;white-space: nowrap;'>Check Booking</strong> </a></div>");
                    sb.append("</div>");
                    sb.append("</body>");
                    sb.append("</html>");
                    reg.SendBookMail(sb.toString(), "Booking Rejection Mail", email);
                    RequestDispatcher rd = request.getRequestDispatcher("adminbookings.jsp");
                    rd.forward(request, response);
                    
                if (status > 0) {
                    out.println(status);
                    RequestDispatcher rd1 = request.getRequestDispatcher("adminbookings.jsp");
                    rd1.forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
