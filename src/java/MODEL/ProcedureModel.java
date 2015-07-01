/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package MODEL;

import java.sql.Date;

public class ProcedureModel {
    private int procedureID;
    private boolean mcv;
    private boolean mchb;
    private boolean hemocrit;
    private boolean rbc;
    private boolean differential;
    private boolean rbcdw;
    private boolean chloride;
    private boolean urea;
    private boolean creatine;
    private boolean packed;
    private boolean sodium;
    private boolean potassium;
    private boolean bicarbonate;
    private boolean creatinine;
    private boolean esr;
    private boolean hemoglobin;
    private boolean platelet;
    private boolean wbc;
    private boolean ast;
    private boolean alt;
    private boolean tourniquet;
    private boolean cbc;
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
     * @return the mcv
     */
    public boolean isMcv() {
        return mcv;
    }

    /**
     * @param mcv the mcv to set
     */
    public void setMcv(boolean mcv) {
        this.mcv = mcv;
    }

    /**
     * @return the mchb
     */
    public boolean isMchb() {
        return mchb;
    }

    /**
     * @param mchb the mchb to set
     */
    public void setMchb(boolean mchb) {
        this.mchb = mchb;
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
     * @return the rbc
     */
    public boolean isRbc() {
        return rbc;
    }

    /**
     * @param rbc the rbc to set
     */
    public void setRbc(boolean rbc) {
        this.rbc = rbc;
    }

    /**
     * @return the differential
     */
    public boolean isDifferential() {
        return differential;
    }

    /**
     * @param differential the differential to set
     */
    public void setDifferential(boolean differential) {
        this.differential = differential;
    }

    /**
     * @return the rbcdw
     */
    public boolean isRbcdw() {
        return rbcdw;
    }

    /**
     * @param rbcdw the rbcdw to set
     */
    public void setRbcdw(boolean rbcdw) {
        this.rbcdw = rbcdw;
    }

    /**
     * @return the chloride
     */
    public boolean isChloride() {
        return chloride;
    }

    /**
     * @param chloride the chloride to set
     */
    public void setChloride(boolean chloride) {
        this.chloride = chloride;
    }

    /**
     * @return the urea
     */
    public boolean isUrea() {
        return urea;
    }

    /**
     * @param urea the urea to set
     */
    public void setUrea(boolean urea) {
        this.urea = urea;
    }

    /**
     * @return the creatine
     */
    public boolean isCreatine() {
        return creatine;
    }

    /**
     * @param creatine the creatine to set
     */
    public void setCreatine(boolean creatine) {
        this.creatine = creatine;
    }

    /**
     * @return the packed
     */
    public boolean isPacked() {
        return packed;
    }

    /**
     * @param packed the packed to set
     */
    public void setPacked(boolean packed) {
        this.packed = packed;
    }

    /**
     * @return the sodium
     */
    public boolean isSodium() {
        return sodium;
    }

    /**
     * @param sodium the sodium to set
     */
    public void setSodium(boolean sodium) {
        this.sodium = sodium;
    }

    /**
     * @return the potassium
     */
    public boolean isPotassium() {
        return potassium;
    }

    /**
     * @param potassium the potassium to set
     */
    public void setPotassium(boolean potassium) {
        this.potassium = potassium;
    }

    /**
     * @return the bicarbonate
     */
    public boolean isBicarbonate() {
        return bicarbonate;
    }

    /**
     * @param bicarbonate the bicarbonate to set
     */
    public void setBicarbonate(boolean bicarbonate) {
        this.bicarbonate = bicarbonate;
    }

    /**
     * @return the creatinine
     */
    public boolean isCreatinine() {
        return creatinine;
    }

    /**
     * @param creatinine the creatinine to set
     */
    public void setCreatinine(boolean creatinine) {
        this.creatinine = creatinine;
    }

    /**
     * @return the esr
     */
    public boolean isEsr() {
        return esr;
    }

    /**
     * @param esr the esr to set
     */
    public void setEsr(boolean esr) {
        this.esr = esr;
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
     * @return the platelet
     */
    public boolean isPlatelet() {
        return platelet;
    }

    /**
     * @param platelet the platelet to set
     */
    public void setPlatelet(boolean platelet) {
        this.platelet = platelet;
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