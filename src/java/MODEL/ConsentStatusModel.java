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
public class ConsentStatusModel {
    private int consentStatusID;
    private String consentStatus;
    private String legalGuardian;
    private long guardianNumber;
    private String decisionMaker;
    private long decisionNumber;
    private String medicalPOA;
    private long medicalNumber;

    /**
     * @return the consentStatusID
     */
    public int getConsentStatusID() {
        return consentStatusID;
    }

    /**
     * @param consentStatusID the consentStatusID to set
     */
    public void setConsentStatusID(int consentStatusID) {
        this.consentStatusID = consentStatusID;
    }

    /**
     * @return the consentStatus
     */
    public String getConsentStatus() {
        return consentStatus;
    }

    /**
     * @param consentStatus the consentStatus to set
     */
    public void setConsentStatus(String consentStatus) {
        this.consentStatus = consentStatus;
    }

    /**
     * @return the legalGuardian
     */
    public String getLegalGuardian() {
        return legalGuardian;
    }

    /**
     * @param legalGuardian the legalGuardian to set
     */
    public void setLegalGuardian(String legalGuardian) {
        this.legalGuardian = legalGuardian;
    }

    /**
     * @return the guardianNumber
     */
    public long getGuardianNumber() {
        return guardianNumber;
    }

    /**
     * @param guardianNumber the guardianNumber to set
     */
    public void setGuardianNumber(long guardianNumber) {
        this.guardianNumber = guardianNumber;
    }

    /**
     * @return the decisionMaker
     */
    public String getDecisionMaker() {
        return decisionMaker;
    }

    /**
     * @param decisionMaker the decisionMaker to set
     */
    public void setDecisionMaker(String decisionMaker) {
        this.decisionMaker = decisionMaker;
    }

    /**
     * @return the decisionNumber
     */
    public long getDecisionNumber() {
        return decisionNumber;
    }

    /**
     * @param decisionNumber the decisionNumber to set
     */
    public void setDecisionNumber(long decisionNumber) {
        this.decisionNumber = decisionNumber;
    }

    /**
     * @return the medicalPOA
     */
    public String getMedicalPOA() {
        return medicalPOA;
    }

    /**
     * @param medicalPOA the medicalPOA to set
     */
    public void setMedicalPOA(String medicalPOA) {
        this.medicalPOA = medicalPOA;
    }

    /**
     * @return the medicalNumber
     */
    public long getMedicalNumber() {
        return medicalNumber;
    }

    /**
     * @param medicalNumber the medicalNumber to set
     */
    public void setMedicalNumber(long medicalNumber) {
        this.medicalNumber = medicalNumber;
    }
}
