/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL;

import java.util.LinkedList;

public class StaffModel {

    private int staffID;
    private String staffFirstName;
    private String staffLastName;
    private int patientAssigned;
    private String daysAssigned;
    private String timeAssigned;
    private String shiftStatus;
    private String assignedWard;
    private LinkedList<PatientModel> patients;
    private int patientCount;
    private int hospitalID;

    /**
     * @return the staffID
     */
    public int getStaffID() {
        return staffID;
    }

    /**
     * @param staffID the staffID to set
     */
    public void setStaffID(int staffID) {
        this.staffID = staffID;
    }

    /**
     * @return the staffFirstName
     */
    public String getStaffFirstName() {
        return staffFirstName;
    }

    /**
     * @param staffFirstName the staffFirstName to set
     */
    public void setStaffFirstName(String staffFirstName) {
        this.staffFirstName = staffFirstName;
    }

    /**
     * @return the staffLastName
     */
    public String getStaffLastName() {
        return staffLastName;
    }

    /**
     * @param staffLastName the staffLastName to set
     */
    public void setStaffLastName(String staffLastName) {
        this.staffLastName = staffLastName;
    }

    /**
     * @return the patients
     */
    public LinkedList<PatientModel> getPatients() {
        return patients;
    }

    /**
     * @param patients the patients to set
     */
    public void setPatients(LinkedList<PatientModel> patients) {
        this.patients = patients;
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

    /**
     * @return the patientAssigned
     */
    public int getPatientAssigned() {
        return patientAssigned;
    }

    /**
     * @param patientAssigned the patientAssigned to set
     */
    public void setPatientAssigned(int patientAssigned) {
        this.patientAssigned = patientAssigned;
    }

    /**
     * @return the patientCount
     */
    public int getPatientCount() {
        return patientCount;
    }

    /**
     * @param patientCount the patientCount to set
     */
    public void setPatientCount(int patientCount) {
        this.patientCount = patientCount;
    }

    /**
     * @return the daysAssigned
     */
    public String getDaysAssigned() {
        return daysAssigned;
    }

    /**
     * @param daysAssigned the daysAssigned to set
     */
    public void setDaysAssigned(String daysAssigned) {
        this.daysAssigned = daysAssigned;
    }

    /**
     * @return the timeAssigned
     */
    public String getTimeAssigned() {
        return timeAssigned;
    }

    /**
     * @param timeAssigned the timeAssigned to set
     */
    public void setTimeAssigned(String timeAssigned) {
        this.timeAssigned = timeAssigned;
    }

    /**
     * @return the shiftStatus
     */
    public String getShiftStatus() {
        return shiftStatus;
    }

    /**
     * @param shiftStatus the shiftStatus to set
     */
    public void setShiftStatus(String shiftStatus) {
        this.shiftStatus = shiftStatus;
    }

    /**
     * @return the assignedWard
     */
    public String getAssignedWard() {
        return assignedWard;
    }

    /**
     * @param assignedWard the assignedWard to set
     */
    public void setAssignedWard(String assignedWard) {
        this.assignedWard = assignedWard;
    }
}
