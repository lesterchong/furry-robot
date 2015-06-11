/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package MODEL;

/**
 *
 * @author Lester Chong
 */
public class SuppliesModel {
    private int supplyID;
    private String supplyName;
    private int amount;
    private String hospital;

    /**
     * @return the supplyID
     */
    public int getSupplyID() {
        return supplyID;
    }

    /**
     * @param supplyID the supplyID to set
     */
    public void setSupplyID(int supplyID) {
        this.supplyID = supplyID;
    }

    /**
     * @return the supplyName
     */
    public String getSupplyName() {
        return supplyName;
    }

    /**
     * @param supplyName the supplyName to set
     */
    public void setSupplyName(String supplyName) {
        this.supplyName = supplyName;
    }

    /**
     * @return the amount
     */
    public int getAmount() {
        return amount;
    }

    /**
     * @param amount the amount to set
     */
    public void setAmount(int amount) {
        this.amount = amount;
    }

    /**
     * @return the hospital
     */
    public String getHospital() {
        return hospital;
    }

    /**
     * @param hospital the hospital to set
     */
    public void setHospital(String hospital) {
        this.hospital = hospital;
    }

}
