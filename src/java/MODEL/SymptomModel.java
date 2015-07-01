/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package MODEL;

import java.sql.Date;

/**
 *
 * @author Lester Chong
 */
public class SymptomModel {
    private int symptomID;
    private boolean abdominalPain;
    private boolean pleuralEffusion;
    private boolean ascites;
    private boolean hypotension;
    private String jaundice;
    private float liver;
    private float spleen;
    private Date dateTaken;
    
    /**
     * @return the abdominalPain
     */
    public boolean isAbdominalPain() {
        return abdominalPain;
    }

    /**
     * @param abdominalPain the abdominalPain to set
     */
    public void setAbdominalPain(boolean abdominalPain) {
        this.abdominalPain = abdominalPain;
    }

    /**
     * @return the pleuralEffusion
     */
    public boolean isPleuralEffusion() {
        return pleuralEffusion;
    }

    /**
     * @param pleuralEffusion the pleuralEffusion to set
     */
    public void setPleuralEffusion(boolean pleuralEffusion) {
        this.pleuralEffusion = pleuralEffusion;
    }

    /**
     * @return the ascites
     */
    public boolean isAscites() {
        return ascites;
    }

    /**
     * @param ascites the ascites to set
     */
    public void setAscites(boolean ascites) {
        this.ascites = ascites;
    }

    /**
     * @return the hypotension
     */
    public boolean isHypotension() {
        return hypotension;
    }

    /**
     * @param hypotension the hypotension to set
     */
    public void setHypotension(boolean hypotension) {
        this.hypotension = hypotension;
    }

    /**
     * @return the jaundice
     */
    public String getJaundice() {
        return jaundice;
    }

    /**
     * @param jaundice the jaundice to set
     */
    public void setJaundice(String jaundice) {
        this.jaundice = jaundice;
    }

    /**
     * @return the liver
     */
    public float getLiver() {
        return liver;
    }

    /**
     * @param liver the liver to set
     */
    public void setLiver(float liver) {
        this.liver = liver;
    }

    /**
     * @return the spleen
     */
    public float getSpleean() {
        return getSpleen();
    }

    /**
     * @param spleen the spleen to set
     */
    public void setSpleen(float spleen) {
        this.spleen = spleen;
    }

    /**
     * @return the symptomID
     */
    public int getSymptomID() {
        return symptomID;
    }

    /**
     * @param symptomID the symptomID to set
     */
    public void setSymptomID(int symptomID) {
        this.symptomID = symptomID;
    }

    /**
     * @return the spleen
     */
    public float getSpleen() {
        return spleen;
    }

    /**
     * @return the dateTaken
     */
    public Date getDateTaken() {
        return dateTaken;
    }

    /**
     * @param dateTaken the dateTaken to set
     */
    public void setDateTaken(Date dateTaken) {
        this.dateTaken = dateTaken;
    }
            
}
