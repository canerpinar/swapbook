/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pck.Bean;

/**
 *
 * @author caner
 */
public class SatilikBook extends Book {
    
    public int satilikKitapID;
    public int kitapID;
    public String fiyat;

    public int getSatilikKitapID() {
        return satilikKitapID;
    }

    public void setSatilikKitapID(int satilikKitapID) {
        this.satilikKitapID = satilikKitapID;
    }

    public int getKitapID() {
        return kitapID;
    }

    public void setKitapID(int kitapID) {
        this.kitapID = kitapID;
    }

    public String getFiyat() {
        return fiyat;
    }

    public void setFiyat(String fiyat) {
        this.fiyat = fiyat;
    }
    
    
}
