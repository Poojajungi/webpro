package model;

import java.time.LocalDate;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ImportStock {
    
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private int Im_ID;
        private String Im_name;
        private String Im_date;
        private String Im_fishname;
        private float Im_qty;
        private float Im_amt;
        private float Im_totamt;

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

   
    public String getIm_fishname() {
        return Im_fishname;
    }

    public void setIm_fishname(String Im_fishname) {
        this.Im_fishname = Im_fishname;
    }

    public float getIm_qty() {
        return Im_qty;
    }

    public void setIm_qty(float Im_qty) {
        this.Im_qty = Im_qty;
    }

    public float getIm_amt() {
        return Im_amt;
    }

    public void setIm_amt(float Im_amt) {
        this.Im_amt = Im_amt;
    }

    public float getIm_totamt() {
        return Im_totamt;
    }

    public void setIm_totamt(float Im_totamt) {
        this.Im_totamt = Im_totamt;
    }

    @Override
    public String toString() {
        return "ImportStock{" + "Im_ID=" + Im_ID + ", Im_name=" + Im_name + ", Im_date=" + Im_date + ", Im_fishname=" + Im_fishname + ", Im_qty=" + Im_qty + ", Im_amt=" + Im_amt + ", Im_totamt=" + Im_totamt + '}';
    }
        
        
}
