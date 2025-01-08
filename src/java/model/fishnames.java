package model;

import javax.persistence.*;

@Entity
public class fishnames {
        
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private int fid;
        private String eng_name;
        private String guj_name;

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public String getEng_name() {
        return eng_name;
    }

    public void setEng_name(String eng_name) {
        this.eng_name = eng_name;
    }

    public String getGuj_name() {
        return guj_name;
    }

    public void setGuj_name(String guj_name) {
        this.guj_name = guj_name;
    }

    @Override
    public String toString() {
        return "fishnames{" + "fid=" + fid + ", eng_name=" + eng_name + ", guj_name=" + guj_name + '}';
    }
        
        
}
