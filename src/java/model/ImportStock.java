package model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class ImportStock {
    
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private int Im_ID;
        private String Im_name;
        private String Im_date;
        private int UserID;

    public int getIm_ID() {
        return Im_ID;
    }

    public void setIm_ID(int Im_ID) {
        this.Im_ID = Im_ID;
    }

    public String getIm_name() {
        return Im_name;
    }

    public void setIm_name(String Im_name) {
        this.Im_name = Im_name;
    }

    public String getIm_date() {
        return Im_date;
    }

    public void setIm_date(String Im_date) {
        this.Im_date = Im_date;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    @Override
    public String toString() {
        return "ImportStock{" + "Im_ID=" + Im_ID + ", Im_name=" + Im_name + ", Im_date=" + Im_date + ", UserID=" + UserID + '}';
    }

 
    
        
        
}
