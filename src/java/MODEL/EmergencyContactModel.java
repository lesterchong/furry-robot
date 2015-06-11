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
public class EmergencyContactModel {
    private int emergencyContactID;
    private String firstName;
    private String lastName;
    private long primaryPhoneNumber;
    private long secondaryPhoneNumber;
    private String relationship;

    /**
     * @return the emergencyContactID
     */
    public int getEmergencyContactID() {
        return emergencyContactID;
    }

    /**
     * @param emergencyContactID the emergencyContactID to set
     */
    public void setEmergencyContactID(int emergencyContactID) {
        this.emergencyContactID = emergencyContactID;
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
     * @return the primaryPhoneNumber
     */
    public long getPrimaryPhoneNumber() {
        return primaryPhoneNumber;
    }

    /**
     * @param primaryPhoneNumber the primaryPhoneNumber to set
     */
    public void setPrimaryPhoneNumber(long primaryPhoneNumber) {
        this.primaryPhoneNumber = primaryPhoneNumber;
    }

    /**
     * @return the secondaryPhoneNumber
     */
    public long getSecondaryPhoneNumber() {
        return secondaryPhoneNumber;
    }

    /**
     * @param secondaryPhoneNumber the secondaryPhoneNumber to set
     */
    public void setSecondaryPhoneNumber(long secondaryPhoneNumber) {
        this.secondaryPhoneNumber = secondaryPhoneNumber;
    }

    /**
     * @return the relationship
     */
    public String getRelationship() {
        return relationship;
    }

    /**
     * @param relationship the relationship to set
     */
    public void setRelationship(String relationship) {
        this.relationship = relationship;
    }
    
}
