package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ExportCompany {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int Exp_Id;
    private String Exp_name;
    private String Exp_date;
    private String Exp_fishtype;
    private float Exp_qty;
    private float Exp_amt;
    private float Exp_totamt;

    public int getExp_Id() {
        return Exp_Id;
    }

    public void setExp_d(int Exp_Id) {
        this.Exp_Id = Exp_Id;
    }



    public String getExp_name() {
        return Exp_name;
    }

    public void setExp_name(String Exp_name) {
        this.Exp_name = Exp_name;
    }

    public String getExp_date() {
        return Exp_date;
    }

    public void setExp_date(String Exp_date) {
        this.Exp_date = Exp_date;
    }

    public String getExp_fishtype() {
        return Exp_fishtype;
    }

    public void setExp_fishtype(String Exp_fishtype) {
        this.Exp_fishtype = Exp_fishtype;
    }

    public float getExp_qty() {
        return Exp_qty;
    }

    public void setExp_qty(float Exp_qty) {
        this.Exp_qty = Exp_qty;
    }

    public float getExp_amt() {
        return Exp_amt;
    }

    public void setExp_amt(float Exp_amt) {
        this.Exp_amt = Exp_amt;
    }

    public float getExp_totamt() {
        return Exp_totamt;
    }

    public void setExp_totamt(float Exp_totamt) {
        this.Exp_totamt = Exp_totamt;
    }

    @Override
    public String toString() {
        return "ExportCompany{" + "Id=" + Exp_Id + ", Exp_name=" + Exp_name + ", Exp_date=" + Exp_date + ", Exp_fishtype=" + Exp_fishtype + ", Exp_qty=" + Exp_qty + ", Exp_amt=" + Exp_amt + ", Exp_totamt=" + Exp_totamt + '}';
    }
    
    
}
