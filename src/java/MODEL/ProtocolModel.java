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
public class ProtocolModel {
    private int protocolID;
    private String protocol;
    private String conditon;
    private String protocolColor;

    /**
     * @return the protocolID
     */
    public int getProtocolID() {
        return protocolID;
    }

    /**
     * @param protocolID the protocolID to set
     */
    public void setProtocolID(int protocolID) {
        this.protocolID = protocolID;
    }

    /**
     * @return the protocol
     */
    public String getProtocol() {
        return protocol;
    }

    /**
     * @param protocol the protocol to set
     */
    public void setProtocol(String protocol) {
        this.protocol = protocol;
    }

    /**
     * @return the protocolColor
     */
    public String getProtocolColor() {
        return protocolColor;
    }

    /**
     * @param protocolColor the protocolColor to set
     */
    public void setProtocolColor(String protocolColor) {
        this.protocolColor = protocolColor;
    }

    /**
     * @return the conditon
     */
    public String getConditon() {
        return conditon;
    }

    /**
     * @param conditon the conditon to set
     */
    public void setConditon(String conditon) {
        this.conditon = conditon;
    }
}
