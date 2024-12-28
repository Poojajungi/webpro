package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ExportAgency {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ExpA_Id;
    private String ExpA_name;
    private String ExpA_date;
    private String ExpA_fishtype;
    private float ExpA_qty;
    private float ExpA_amt;
    private float ExpA_totamt;

    public int getExpA_Id() {
        return ExpA_Id;
    }

    public void setExpA_Id(int ExpA_Id) {
        this.ExpA_Id = ExpA_Id;
    }

    public String getExpA_name() {
        return ExpA_name;
    }

    public void setExpA_name(String ExpA_name) {
        this.ExpA_name = ExpA_name;
    }

    public String getExpA_date() {
        return ExpA_date;
    }

    public void setExpA_date(String ExpA_date) {
        this.ExpA_date = ExpA_date;
    }

    public String getExpA_fishtype() {
        return ExpA_fishtype;
    }

    public void setExpA_fishtype(String ExpA_fishtype) {
        this.ExpA_fishtype = ExpA_fishtype;
    }

    public float getExpA_qty() {
        return ExpA_qty;
    }

    public void setExpA_qty(float ExpA_qty) {
        this.ExpA_qty = ExpA_qty;
    }

    public float getExpA_amt() {
        return ExpA_amt;
    }

    public void setExpA_amt(float ExpA_amt) {
        this.ExpA_amt = ExpA_amt;
    }

    public float getExpA_totamt() {
        return ExpA_totamt;
    }

    public void setExpA_totamt(float ExpA_totamt) {
        this.ExpA_totamt = ExpA_totamt;
    }

    @Override
    public String toString() {
        return "ExportAgency{" + "ExpA_Id=" + ExpA_Id + ", ExpA_name=" + ExpA_name + ", ExpA_date=" + ExpA_date + ", ExpA_fishtype=" + ExpA_fishtype + ", ExpA_qty=" + ExpA_qty + ", ExpA_amt=" + ExpA_amt + ", ExpA_totamt=" + ExpA_totamt + '}';
    }
    
    

}
