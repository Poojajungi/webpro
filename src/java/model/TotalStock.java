package model;

import javax.persistence.*;

@Entity
public class TotalStock {
    
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private int tot_id;
        private String stock_name;
        private double stock_qty;
        private double stock_totamt;
        private int UserID;

    public int getTot_id() {
        return tot_id;
    }

    public void setTot_id(int tot_id) {
        this.tot_id = tot_id;
    }

    public String getStock_name() {
        return stock_name;
    }

    public void setStock_name(String stock_name) {
        this.stock_name = stock_name;
    }

    public double getStock_qty() {
        return stock_qty;
    }

    public void setStock_qty(double stock_qty) {
        this.stock_qty = stock_qty;
    }

    public double getStock_totamt() {
        return stock_totamt;
    }

    public void setStock_totamt(double stock_totamt) {
        this.stock_totamt = stock_totamt;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    @Override
    public String toString() {
        return "TotalStock{" + "tot_id=" + tot_id + ", stock_name=" + stock_name + ", stock_qty=" + stock_qty + ", stock_totamt=" + stock_totamt + ", UserID=" + UserID + '}';
    }
    
 
        
}
