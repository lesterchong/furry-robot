/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package MODEL;

import java.util.LinkedList;

public class PatientModel {
    private int patientID;
    private String patientFirstName;
    private String patientLastName;
    private String patientAddress;
    private String patientBarangay;
    private long patientPhoneNumber;
    private String patientWard;
    private LinkedList<ProcedureModel> procedures;
    
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
     * @return the procedures
     */
    public LinkedList<ProcedureModel> getProcedures() {
        return procedures;
    }


    /**
     * @return the patientAddress
     */
    public String getPatientAddress() {
        return patientAddress;
    }

    /**
     * @param patientAddress the patientAddress to set
     */
    public void setPatientAddress(String patientAddress) {
        this.patientAddress = patientAddress;
    }

    /**
     * @return the patientPhoneNumber
     */
    public long getPatientPhoneNumber() {
        return patientPhoneNumber;
    }

    /**
     * @param patientPhoneNumber the patientPhoneNumber to set
     */
    public void setPatientPhoneNumber(long patientPhoneNumber) {
        this.patientPhoneNumber = patientPhoneNumber;
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
     * @param procedures the procedures to set
     */
    public void setProcedures(LinkedList<ProcedureModel> procedures) {
        this.procedures = procedures;
    }
}
