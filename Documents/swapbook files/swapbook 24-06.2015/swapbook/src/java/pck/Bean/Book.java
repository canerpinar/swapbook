/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pck.Bean;

/**
 *
 * @author can
 */
public class Book {
    public boolean takasStatus;
    public int id;
    public int proid;
    public String adi,kategori,yazar,yorum;
    public boolean satilikdurum;
    public int takasOnay;

    public int getTakasOnay() {
        return takasOnay;
    }

    public void setTakasOnay(int takasOnay) {
        this.takasOnay = takasOnay;
    }

    public boolean isSatilikdurum() {
        return satilikdurum;
    }

    public void setSatilikdurum(boolean satilikdurum) {
        this.satilikdurum = satilikdurum;
    }

    public String getYorum() {
        return yorum;
    }

    public void setYorum(String yorum) {
        this.yorum = yorum;
    }

    public boolean isTakasStatus() {
        return takasStatus;
    }

    public void setTakasStatus(boolean takasStatus) {
        this.takasStatus = takasStatus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProid() {
        return proid;
    }

    public void setProid(int proid) {
        this.proid = proid;
    }

    public String getAdi() {
        return adi;
    }

    public void setAdi(String adi) {
        this.adi = adi;
    }

    public String getKategori() {
        return kategori;
    }

    public void setKategori(String kategori) {
        this.kategori = kategori;
    }

    public String getYazar() {
        return yazar;
    }

    public void setYazar(String yazar) {
        this.yazar = yazar;
    }
    
}
