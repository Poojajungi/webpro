package model;

import javax.persistence.*;

@Entity
public class sessTable {
        
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private int sessID;
        private String sessName;
        
}
