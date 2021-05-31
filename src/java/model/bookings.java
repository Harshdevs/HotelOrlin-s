package model;

import java.sql.Date;

public class bookings {
    
    String b_id;
    String b_name;
    String b_img;
    String b_cost;
    String uname;
    Date arrival;
    int guests;
    int stay;
    String uid;
    String uemail;
    String status;

    public String getB_id() {
        return b_id;
    }

    public String getB_name() {
        return b_name;
    }

    public String getB_img() {
        return b_img;
    }

    public String getB_cost() {
        return b_cost;
    }

    public String getUname() {
        return uname;
    }

    public Date getArrival() {
        return arrival;
    }

    public int getGuests() {
        return guests;
    }

    public int getStay() {
        return stay;
    }

    public String getUid() {
        return uid;
    }

    public String getuemail() {
        return uemail;
    }
    
    public String getStatus() {
        return status;
    }

    public void setB_id(String b_id) {
        this.b_id = b_id;
    }

    public void setB_name(String b_name) {
        this.b_name = b_name;
    }

    public void setB_img(String b_img) {
        this.b_img = b_img;
    }

    public void setB_cost(String b_cost) {
        this.b_cost = b_cost;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public void setArrival(Date arrival) {
        this.arrival = arrival;
    }

    public void setGuests(int guests) {
        this.guests = guests;
    }

    public void setStay(int stay) {
        this.stay = stay;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public void setuemail(String uemail) {
        this.uemail = uemail;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
