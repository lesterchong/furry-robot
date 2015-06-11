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
public class ReferenceModel {
    private int referenceID;
    private String referenceName;
    private long contactNumber;

    /**
     * @return the referenceID
     */
    public int getReferenceID() {
        return referenceID;
    }

    /**
     * @param referenceID the referenceID to set
     */
    public void setReferenceID(int referenceID) {
        this.referenceID = referenceID;
    }

    /**
     * @return the referenceName
     */
    public String getReferenceName() {
        return referenceName;
    }

    /**
     * @param referenceName the referenceName to set
     */
    public void setReferenceName(String referenceName) {
        this.referenceName = referenceName;
    }

    /**
     * @return the contactNumber
     */
    public long getContactNumber() {
        return contactNumber;
    }

    /**
     * @param contactNumber the contactNumber to set
     */
    public void setContactNumber(long contactNumber) {
        this.contactNumber = contactNumber;
    }
    
}
