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
public class DischargeModel {
    private int dischargeID;
    private String firstName;
    private String lastName;
    private String attendingPhysician;
    private int roomNumber;
    private int patientNumber;
    private Date dateOfAdmission;
    private Date dateOfDischarge;
    private String provisionalDiagnosis;
    private String finalDiagnosis;
    private String briefHistory;
    private String findings;
    private String courseOfTreatment;
    private String dischargeCondition;
    private String rehabPotential;
    private String followUp;
    private Date dateFiled;
    private String approvedBy;
    private int submittedBy;
    private int hospitalID;

    /**
     * @return the dischargeID
     */
    public int getDischargeID() {
        return dischargeID;
    }

    /**
     * @param dischargeID the dischargeID to set
     */
    public void setDischargeID(int dischargeID) {
        this.dischargeID = dischargeID;
    }

    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * @return the attendingPhysician
     */
    public String getAttendingPhysician() {
        return attendingPhysician;
    }

    /**
     * @param attendingPhysician the attendingPhysician to set
     */
    public void setAttendingPhysician(String attendingPhysician) {
        this.attendingPhysician = attendingPhysician;
    }

    /**
     * @return the roomNumber
     */
    public int getRoomNumber() {
        return roomNumber;
    }

    /**
     * @param roomNumber the roomNumber to set
     */
    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    /**
     * @return the patientNumber
     */
    public int getPatientNumber() {
        return patientNumber;
    }

    /**
     * @param patientNumber the patientNumber to set
     */
    public void setPatientNumber(int patientNumber) {
        this.patientNumber = patientNumber;
    }

    /**
     * @return the dateOfAdmission
     */
    public Date getDateOfAdmission() {
        return dateOfAdmission;
    }

    /**
     * @param dateOfAdmission the dateOfAdmission to set
     */
    public void setDateOfAdmission(Date dateOfAdmission) {
        this.dateOfAdmission = dateOfAdmission;
    }

    /**
     * @return the dateOfDischarge
     */
    public Date getDateOfDischarge() {
        return dateOfDischarge;
    }

    /**
     * @param dateOfDischarge the dateOfDischarge to set
     */
    public void setDateOfDischarge(Date dateOfDischarge) {
        this.dateOfDischarge = dateOfDischarge;
    }

    /**
     * @return the provisionalDiagnosis
     */
    public String getProvisionalDiagnosis() {
        return provisionalDiagnosis;
    }

    /**
     * @param provisionalDiagnosis the provisionalDiagnosis to set
     */
    public void setProvisionalDiagnosis(String provisionalDiagnosis) {
        this.provisionalDiagnosis = provisionalDiagnosis;
    }

    /**
     * @return the finalDiagnosis
     */
    public String getFinalDiagnosis() {
        return finalDiagnosis;
    }

    /**
     * @param finalDiagnosis the finalDiagnosis to set
     */
    public void setFinalDiagnosis(String finalDiagnosis) {
        this.finalDiagnosis = finalDiagnosis;
    }

    /**
     * @return the findings
     */
    public String getFindings() {
        return findings;
    }

    /**
     * @param findings the findings to set
     */
    public void setFindings(String findings) {
        this.findings = findings;
    }

    /**
     * @return the courseOfTreatment
     */
    public String getCourseOfTreatment() {
        return courseOfTreatment;
    }

    /**
     * @param courseOfTreatment the courseOfTreatment to set
     */
    public void setCourseOfTreatment(String courseOfTreatment) {
        this.courseOfTreatment = courseOfTreatment;
    }

    /**
     * @return the dischargeCondition
     */
    public String getDischargeCondition() {
        return dischargeCondition;
    }

    /**
     * @param dischargeCondition the dischargeCondition to set
     */
    public void setDischargeCondition(String dischargeCondition) {
        this.dischargeCondition = dischargeCondition;
    }

    /**
     * @return the rehabPotential
     */
    public String getRehabPotential() {
        return rehabPotential;
    }

    /**
     * @param rehabPotential the rehabPotential to set
     */
    public void setRehabPotential(String rehabPotential) {
        this.rehabPotential = rehabPotential;
    }

    /**
     * @return the followUp
     */
    public String getFollowUp() {
        return followUp;
    }

    /**
     * @param followUp the followUp to set
     */
    public void setFollowUp(String followUp) {
        this.followUp = followUp;
    }

    /**
     * @return the dateFiled
     */
    public Date getDateFiled() {
        return dateFiled;
    }

    /**
     * @param dateFiled the dateFiled to set
     */
    public void setDateFiled(Date dateFiled) {
        this.dateFiled = dateFiled;
    }

    /**
     * @return the approvedBy
     */
    public String getApprovedBy() {
        return approvedBy;
    }

    /**
     * @param approvedBy the approvedBy to set
     */
    public void setApprovedBy(String approvedBy) {
        this.approvedBy = approvedBy;
    }

    /**
     * @return the briefHistory
     */
    public String getBriefHistory() {
        return briefHistory;
    }

    /**
     * @param briefHistory the briefHistory to set
     */
    public void setBriefHistory(String briefHistory) {
        this.briefHistory = briefHistory;
    }

    /**
     * @return the submittedBy
     */
    public int getSubmittedBy() {
        return submittedBy;
    }

    /**
     * @param submittedBy the submittedBy to set
     */
    public void setSubmittedBy(int submittedBy) {
        this.submittedBy = submittedBy;
    }

    /**
     * @return the hospitalID
     */
    public int getHospitalID() {
        return hospitalID;
    }

    /**
     * @param hospitalID the hospitalID to set
     */
    public void setHospitalID(int hospitalID) {
        this.hospitalID = hospitalID;
    }
}
