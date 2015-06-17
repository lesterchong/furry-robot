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
public class ProcedureModel {
    private int procedureID;
    private String procedureName; 
    private boolean done;

    /**
     * @return the procedureID
     */
    public int getProcedureID() {
        return procedureID;
    }

    /**
     * @param procedureID the procedureID to set
     */
    public void setProcedureID(int procedureID) {
        this.procedureID = procedureID;
    }

    /**
     * @return the procedureName
     */
    public String getProcedureName() {
        return procedureName;
    }

    /**
     * @param procedureName the procedureName to set
     */
    public void setProcedureName(String procedureName) {
        this.procedureName = procedureName;
    }

    /**
     * @return the done
     */
    public boolean isDone() {
        return done;
    }

    /**
     * @param done the done to set
     */
    public void setDone(boolean done) {
        this.done = done;
    }
    
}
