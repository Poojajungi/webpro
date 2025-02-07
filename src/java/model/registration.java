package model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class registration {
    
    @Id
    private int refid;
    private String fullnm;
    private String username;
    private String city;
    private String mobileno;
    private String email;
    private String password;

    public int getRefid() {
        return refid;
    }

    public void setRefid(int refid) {
        this.refid = refid;
    }

    public String getFullnm() {
        return fullnm;
    }

    public void setFullnm(String fullnm) {
        this.fullnm = fullnm;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getMobileno() {
        return mobileno;
    }

    public void setMobileno(String mobileno) {
        this.mobileno = mobileno;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "registration{" + "refid=" + refid + ", fullnm=" + fullnm + ", username=" + username + ", city=" + city + ", mobileno=" + mobileno + ", email=" + email + ", password=" + password + '}';
    }

  
}
