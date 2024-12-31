package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class FishImport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int fish_Id;
    private String fish_name;
    private float fish_qty;
    private float fish_amt;
    private float fish_totamt;
    @ManyToOne
    @JoinColumn
    private ImportStock importstock;

    public int getFish_Id() {
        return fish_Id;
    }

    public void setFish_Id(int fish_Id) {
        this.fish_Id = fish_Id;
    }

    public String getFish_name() {
        return fish_name;
    }

    public void setFish_name(String fish_name) {
        this.fish_name = fish_name;
    }

    public float getFish_qty() {
        return fish_qty;
    }

    public void setFish_qty(float fish_qty) {
        this.fish_qty = fish_qty;
    }

    public float getFish_amt() {
        return fish_amt;
    }

    public void setFish_amt(float fish_amt) {
        this.fish_amt = fish_amt;
    }

    public float getFish_totamt() {
        return fish_totamt;
    }

    public void setFish_totamt(float fish_totamt) {
        this.fish_totamt = fish_totamt;
    }

    public ImportStock getImportstock() {
        return importstock;
    }

    public void setImportstock(ImportStock importstock) {
        this.importstock = importstock;
    }

    @Override
    public String toString() {
        return "FishImport{" + "fish_Id=" + fish_Id + ", fish_name=" + fish_name + ", fish_qty=" + fish_qty + ", fish_amt=" + fish_amt + ", fish_totamt=" + fish_totamt + ", importstock=" + importstock + '}';
    }

    
    

}
