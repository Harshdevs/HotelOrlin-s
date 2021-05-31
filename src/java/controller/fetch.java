package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.user;
import model.student;
import org.json.JSONArray;
import org.json.JSONObject;


@WebServlet(name = "fetch", urlPatterns = {"/fetch"})
public class fetch extends HttpServlet {

    
     
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        user u = new user(session);
        JSONObject json1 = new JSONObject();
        JSONArray array = new JSONArray();
        try {
            if (session.getAttribute("id") != null && session.getAttribute("id").equals("1") && request.getParameter("FetchUser") != null) {
                ArrayList<student> al = u.getuserdata();
                if (al.size() > 0) {
                    Iterator<student> itr = al.iterator();
                    while (itr.hasNext()) {
                        student d = itr.next();
                        JSONObject json = new JSONObject();
                        json.put("Id", d.getId());
                        json.put("Name", d.getName());
                        json.put("Mobile", d.getphone());
                        json.put("Email", d.getemail());
                        json.put("Address", d.getaddress());
                        json.put("Date", d.getdate());
                        array.put(json);
                    }
                    json1.put("jsonarray", array);
                    out.print(json1);
                } else {
                    json1.put("status", "No data");
                    out.print(json1);
                }
            } else if (session.getAttribute("id") != null && session.getAttribute("id").equals("1") && request.getParameter("DeleteUser") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                int status = u.delete(id);
                if (status > 0) {
                    json1.put("status", "Deleted");
                    out.print(json1);
                } else {
                    json1.put("status", "Not Deleted");
                    out.print(json1);
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
    }// </editor-fold>

}
