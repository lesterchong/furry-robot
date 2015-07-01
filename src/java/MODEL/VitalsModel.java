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
public class VitalsModel {
    private int vitalsID;
    private Date dateTaken;
    private float temperature;
    private String bloodPressure;
    private Date lastDextrose;

    /**
     * @return the vitalsID
     */
    public int getVitalsID() {
        return vitalsID;
    }

    /**
     * @param vitalsID the vitalsID to set
     */
    public void setVitalsID(int vitalsID) {
        this.vitalsID = vitalsID;
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

    /**
     * @return the temperature
     */
    public float getTemperature() {
        return temperature;
    }

    /**
     * @param temperature the temperature to set
     */
    public void setTemperature(float temperature) {
        this.temperature = temperature;
    }

    /**
     * @return the bloodPressure
     */
    public String getBloodPressure() {
        return bloodPressure;
    }

    /**
     * @param bloodPressure the bloodPressure to set
     */
    public void setBloodPressure(String bloodPressure) {
        this.bloodPressure = bloodPressure;
    }

    /**
     * @return the lastDextrose
     */
    public Date getLastDextrose() {
        return lastDextrose;
    }

    /**
     * @param lastDextrose the lastDextrose to set
     */
    public void setLastDextrose(Date lastDextrose) {
        this.lastDextrose = lastDextrose;
    }
}
