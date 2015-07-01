/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package MODEL;

import java.sql.Date;

public class ProcedureModel {
    private int procedureID;
    private boolean tourniquet;
    private boolean platelets;
    private boolean cbc;
    private boolean ast;
    private boolean wbc;
    private boolean alt;
    private boolean hemocrit;
    private boolean hemoglobin;
    private Date dateTaken;

    /**
     * @return the procedureID
     */
    public int getProcedureID() {
        return procedureID;
    }

    /**
     * @param procedureID the procedureID to set
     */
    public void setProcedureID(int procedureID) {
        this.procedureID = procedureID;
    }

    /**
     * @return the tourniquet
     */
    public boolean isTourniquet() {
        return tourniquet;
    }

    /**
     * @param tourniquet the tourniquet to set
     */
    public void setTourniquet(boolean tourniquet) {
        this.tourniquet = tourniquet;
    }

    /**
     * @return the platelets
     */
    public boolean isPlatelets() {
        return platelets;
    }

    /**
     * @param platelets the platelets to set
     */
    public void setPlatelets(boolean platelets) {
        this.platelets = platelets;
    }

    /**
     * @return the cbc
     */
    public boolean isCbc() {
        return cbc;
    }

    /**
     * @param cbc the cbc to set
     */
    public void setCbc(boolean cbc) {
        this.cbc = cbc;
    }

    /**
     * @return the ast
     */
    public boolean isAst() {
        return ast;
    }

    /**
     * @param ast the ast to set
     */
    public void setAst(boolean ast) {
        this.ast = ast;
    }

    /**
     * @return the wbc
     */
    public boolean isWbc() {
        return wbc;
    }

    /**
     * @param wbc the wbc to set
     */
    public void setWbc(boolean wbc) {
        this.wbc = wbc;
    }

    /**
     * @return the alt
     */
    public boolean isAlt() {
        return alt;
    }

    /**
     * @param alt the alt to set
     */
    public void setAlt(boolean alt) {
        this.alt = alt;
    }

    /**
     * @return the hemocrit
     */
    public boolean isHemocrit() {
        return hemocrit;
    }

    /**
     * @param hemocrit the hemocrit to set
     */
    public void setHemocrit(boolean hemocrit) {
        this.hemocrit = hemocrit;
    }

    /**
     * @return the hemoglobin
     */
    public boolean isHemoglobin() {
        return hemoglobin;
    }

    /**
     * @param hemoglobin the hemoglobin to set
     */
    public void setHemoglobin(boolean hemoglobin) {
        this.hemoglobin = hemoglobin;
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
