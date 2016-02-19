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
public class SwapView {
    public String kitapadi;
    public int kitapSahibi;
    public int kitapid;
    public int istekSahibi;
    public int swapid;//takaslar tablosu takas id

    public int getSwapid() {
        return swapid;
    }

    public void setSwapid(int swapid) {
        this.swapid = swapid;
    }
    
    public String getKitapadi() {
        return kitapadi;
    }

    public void setKitapadi(String kitapadi) {
        this.kitapadi = kitapadi;
    }

    
    public int getKitapSahibi() {
        return kitapSahibi;
    }

    public void setKitapSahibi(int kitapSahibi) {
        this.kitapSahibi = kitapSahibi;
    }

    public int getKitapid() {
        return kitapid;
    }

    public void setKitapid(int kitapid) {
        this.kitapid = kitapid;
    }

    public int getIstekSahibi() {
        return istekSahibi;
    }

    public void setIstekSahibi(int istekSahibi) {
        this.istekSahibi = istekSahibi;
    }
    
}
