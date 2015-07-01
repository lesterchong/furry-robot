/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL;

import java.sql.Date;
import java.util.LinkedList;

public class PatientModel {

    private int patientID;
    private String patientFirstName;
    private String patientLastName;
    private String patientDiagnosis;
    private String emergencyCompanion;
    private long emegergencyContact;
    private String allergies;
    private String patientWard;
    private String assignedNurse;
    private Date dateAdmitted;
    private Date dateDischarged;
    private VitalsModel patientVitals;
    private SymptomModel patientSymptoms;
    private LinkedList<ProcedureModel> historyProcedure;
    private LinkedList<VitalsModel> historyVitals;
    private LinkedList<SymptomModel> historySymptoms;
    private ProcedureModel patientProcedure;
    private String patientBarangay;
    private String incidentBarangay;

    /**
     * @return the patientID
     */
    public int getPatientID() {
        return patientID;
    }

    /**
     * @param patientID the patientID to set
     */
    public void setPatientID(int patientID) {
        this.patientID = patientID;
    }

    /**
     * @return the patientFirstName
     */
    public String getPatientFirstName() {
        return patientFirstName;
    }

    /**
     * @param patientFirstName the patientFirstName to set
     */
    public void setPatientFirstName(String patientFirstName) {
        this.patientFirstName = patientFirstName;
    }

    /**
     * @return the patientLastName
     */
    public String getPatientLastName() {
        return patientLastName;
    }

    /**
     * @param patientLastName the patientLastName to set
     */
    public void setPatientLastName(String patientLastName) {
        this.patientLastName = patientLastName;
    }

    /**
     * @return the patientDiagnosis
     */
    public String getPatientDiagnosis() {
        return patientDiagnosis;
    }

    /**
     * @param patientDiagnosis the patientDiagnosis to set
     */
    public void setPatientDiagnosis(String patientDiagnosis) {
        this.patientDiagnosis = patientDiagnosis;
    }

    /**
     * @return the emergencyCompanion
     */
    public String getEmergencyCompanion() {
        return emergencyCompanion;
    }

    /**
     * @param emergencyCompanion the emergencyCompanion to set
     */
    public void setEmergencyCompanion(String emergencyCompanion) {
        this.emergencyCompanion = emergencyCompanion;
    }

    /**
     * @return the emegergencyContact
     */
    public long getEmegergencyContact() {
        return emegergencyContact;
    }

    /**
     * @param emegergencyContact the emegergencyContact to set
     */
    public void setEmegergencyContact(long emegergencyContact) {
        this.emegergencyContact = emegergencyContact;
    }

    /**
     * @return the patientWard
     */
    public String getPatientWard() {
        return patientWard;
    }

    /**
     * @param patientWard the patientWard to set
     */
    public void setPatientWard(String patientWard) {
        this.patientWard = patientWard;
    }

    /**
     * @return the historyVitals
     */
    public LinkedList<VitalsModel> getHistoryVitals() {
        return historyVitals;
    }

    /**
     * @param historyVitals the historyVitals to set
     */
    public void setHistoryVitals(LinkedList<VitalsModel> historyVitals) {
        this.historyVitals = historyVitals;
    }

    /**
     * @return the historySymptoms
     */
    public LinkedList<SymptomModel> getHistorySymptoms() {
        return historySymptoms;
    }

    /**
     * @param historySymptoms the historySymptoms to set
     */
    public void setHistorySymptoms(LinkedList<SymptomModel> historySymptoms) {
        this.historySymptoms = historySymptoms;
    }

    /**
     * @return the patientVitals
     */
    public VitalsModel getPatientVitals() {
        return patientVitals;
    }

    /**
     * @param patientVitals the patientVitals to set
     */
    public void setPatientVitals(VitalsModel patientVitals) {
        this.patientVitals = patientVitals;
    }

    /**
     * @return the patientSymptoms
     */
    public SymptomModel getPatientSymptoms() {
        return patientSymptoms;
    }

    /**
     * @param patientSymptoms the patientSymptoms to set
     */
    public void setPatientSymptoms(SymptomModel patientSymptoms) {
        this.patientSymptoms = patientSymptoms;
    }

    /**
     * @return the allergies
     */
    public String getAllergies() {
        return allergies;
    }

    /**
     * @param allergies the allergies to set
     */
    public void setAllergies(String allergies) {
        this.allergies = allergies;
    }

    /**
     * @return the assignedNurse
     */
    public String getAssignedNurse() {
        return assignedNurse;
    }

    /**
     * @param assignedNurse the assignedNurse to set
     */
    public void setAssignedNurse(String assignedNurse) {
        this.assignedNurse = assignedNurse;
    }

    /**
     * @return the dateAdmitted
     */
    public Date getDateAdmitted() {
        return dateAdmitted;
    }

    /**
     * @param dateAdmitted the dateAdmitted to set
     */
    public void setDateAdmitted(Date dateAdmitted) {
        this.dateAdmitted = dateAdmitted;
    }

    /**
     * @return the dateDischarged
     */
    public Date getDateDischarged() {
        return dateDischarged;
    }

    /**
     * @param dateDischarged the dateDischarged to set
     */
    public void setDateDischarged(Date dateDischarged) {
        this.dateDischarged = dateDischarged;
    }

    /**
     * @return the patientProcedure
     */
    public ProcedureModel getPatientProcedure() {
        return patientProcedure;
    }

    /**
     * @param patientProcedure the patientProcedure to set
     */
    public void setPatientProcedure(ProcedureModel patientProcedure) {
        this.patientProcedure = patientProcedure;
    }

    /**
     * @return the historyProcedure
     */
    public LinkedList<ProcedureModel> getHistoryProcedure() {
        return historyProcedure;
    }

    /**
     * @param historyProcedure the historyProcedure to set
     */
    public void setHistoryProcedure(LinkedList<ProcedureModel> historyProcedure) {
        this.historyProcedure = historyProcedure;
    }

    /**
     * @return the patientBarangay
     */
    public String getPatientBarangay() {
        return patientBarangay;
    }

    /**
     * @param patientBarangay the patientBarangay to set
     */
    public void setPatientBarangay(String patientBarangay) {
        this.patientBarangay = patientBarangay;
    }

    /**
     * @return the incidentBarangay
     */
    public String getIncidentBarangay() {
        return incidentBarangay;
    }

    /**
     * @param incidentBarangay the incidentBarangay to set
     */
    public void setIncidentBarangay(String incidentBarangay) {
        this.incidentBarangay = incidentBarangay;
    }

}
