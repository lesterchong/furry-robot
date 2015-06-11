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
public class BarangayModel {
    private int barangayID;
    private String barangayName;
    private int patientCount;
    private long barangayContact;

    /**
     * @return the barangayID
     */
    public int getBarangayID() {
        return barangayID;
    }

    /**
     * @param barangayID the barangayID to set
     */
    public void setBarangayID(int barangayID) {
        this.barangayID = barangayID;
    }

    /**
     * @return the barangayName
     */
    public String getBarangayName() {
        return barangayName;
    }

    /**
     * @param barangayName the barangayName to set
     */
    public void setBarangayName(String barangayName) {
        this.barangayName = barangayName;
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
     * @return the barangayContact
     */
    public long getBarangayContact() {
        return barangayContact;
    }

    /**
     * @param barangayContact the barangayContact to set
     */
    public void setBarangayContact(long barangayContact) {
        this.barangayContact = barangayContact;
    }
}
