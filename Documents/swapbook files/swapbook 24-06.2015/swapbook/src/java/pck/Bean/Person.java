package pck.Bean;

import java.sql.Date;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author can
 */
public class Person {


    
    public int id;
    public String avatar;
    public String password;
    public String adsoyad;
    public String email;
    public String okul;
    public String bolum;
    public Date dogumtarih;
    public String cinsiyet;

    public Person(){
    
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAdsoyad() {
        return adsoyad;
    }

    public void setAdsoyad(String adsoyad) {
        this.adsoyad = adsoyad;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getOkul() {
        return okul;
    }
    public void setOkul(String okul) {
        this.okul = okul;
    }
    public String getBolum() {
        return bolum;
    }
    public void setBolum(String bolum) {
        this.bolum = bolum;
    }
    public Date getDogumtarih() {
        return dogumtarih;
    }
    public void setDogumtarih(Date dogumtarih) {
        this.dogumtarih = dogumtarih;
    }
    public String getCinsiyet() {
        return cinsiyet;
    }
    public void setCinsiyet(String cinsiyet) {
        this.cinsiyet = cinsiyet;
    }           
}
