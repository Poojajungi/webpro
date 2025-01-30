package model;

import javax.persistence.*;

@Entity
public class temp {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int temp_id;
    private String temp_name;
    private String sess_name;

    public int getTemp_id() {
        return temp_id;
    }

    public void setTemp_id(int temp_id) {
        this.temp_id = temp_id;
    }

    public String getTemp_name() {
        return temp_name;
    }

    public void setTemp_name(String temp_name) {
        this.temp_name = temp_name;
    }

    public String getSess_name() {
        return sess_name;
    }

    public void setSess_name(String sess_name) {
        this.sess_name = sess_name;
    }

    @Override
    public String toString() {
        return "temp{" + "temp_id=" + temp_id + ", temp_name=" + temp_name + ", sess_name=" + sess_name + '}';
    }
    
    
    
}
