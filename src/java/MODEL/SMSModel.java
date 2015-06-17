/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package MODEL;

import java.sql.Date;

public class SMSModel {
    private int SMSID;
    private String SMS;
    private String smsFrom;
    private Date dateSent;

    /**
     * @return the SMSID
     */
    public int getSMSID() {
        return SMSID;
    }

    /**
     * @param SMSID the SMSID to set
     */
    public void setSMSID(int SMSID) {
        this.SMSID = SMSID;
    }

    /**
     * @return the SMS
     */
    public String getSMS() {
        return SMS;
    }

    /**
     * @param SMS the SMS to set
     */
    public void setSMS(String SMS) {
        this.SMS = SMS;
    }

    /**
     * @return the smsFrom
     */
    public String getSmsFrom() {
        return smsFrom;
    }

    /**
     * @param smsFrom the smsFrom to set
     */
    public void setSmsFrom(String smsFrom) {
        this.smsFrom = smsFrom;
    }

    /**
     * @return the dateSent
     */
    public Date getDateSent() {
        return dateSent;
    }

    /**
     * @param dateSent the dateSent to set
     */
    public void setDateSent(Date dateSent) {
        this.dateSent = dateSent;
    }
}
