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
public class WardModel {
    private int wardID;
    private String wardName;
    private int capacity;
    private int currentNumber;

    /**
     * @return the wardID
     */
    public int getWardID() {
        return wardID;
    }

    /**
     * @param wardID the wardID to set
     */
    public void setWardID(int wardID) {
        this.wardID = wardID;
    }

    /**
     * @return the wardName
     */
    public String getWardName() {
        return wardName;
    }

    /**
     * @param wardName the wardName to set
     */
    public void setWardName(String wardName) {
        this.wardName = wardName;
    }

    /**
     * @return the capacity
     */
    public int getCapacity() {
        return capacity;
    }

    /**
     * @param capacity the capacity to set
     */
    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    /**
     * @return the currentNumber
     */
    public int getCurrentNumber() {
        return currentNumber;
    }

    /**
     * @param currentNumber the currentNumber to set
     */
    public void setCurrentNumber(int currentNumber) {
        this.currentNumber = currentNumber;
    }
}
