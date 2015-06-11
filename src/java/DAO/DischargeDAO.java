/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import DB.ConcreteConnection;
import DB.ConnectionFactory;
import MODEL.DischargeModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

/**
 *
 * @author Lester Chong
 */
public class DischargeDAO {
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private ConnectionFactory cf;
    
    public LinkedList<DischargeModel> getDischarges(){
        LinkedList<DischargeModel> discharges = new LinkedList<>();
        DischargeModel model;
        
        try{
            cf = new ConcreteConnection();
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT * FROM discharge");
            rs = ps.executeQuery();
            while(rs.next()){
                model = new DischargeModel();
                model.setDischargeID(rs.getInt("dischargeID"));
                model.setLastName(rs.getString("lastName"));
                model.setFirstName(rs.getString("firstName"));
                model.setAttendingPhysician(rs.getString("attendingPhysician"));
                model.setRoomNumber(rs.getInt("roomNumber"));
                model.setPatientNumber(rs.getInt("patientNumber"));
                model.setDateOfAdmission(rs.getDate("dateOfAdmission"));
                model.setDateOfDischarge(rs.getDate("dateOfDischarge"));
                model.setProvisionalDiagnosis(rs.getString("provisionalDiagnosis"));
                model.setFinalDiagnosis(rs.getString("finalDiagnosis"));
                model.setBriefHistory(rs.getString("briefHistory"));
                model.setFindings(rs.getString("findings"));
                model.setCourseOfTreatment(rs.getString("courseOfTreatment"));
                model.setDischargeCondition(rs.getString("dischargeCondition"));
                model.setRehabPotential(rs.getString("rehabPotential"));
                model.setFollowUp(rs.getString("followUp"));
                model.setDateFiled(rs.getDate("dateFiled"));
                model.setApprovedBy(rs.getString("approvedBy"));
                discharges.add(model);
            }
            con.close();
            return discharges;
        }catch(SQLException e){
            return null;
        }
    }
    
    public boolean addDischarge(DischargeModel model){
        try{
            cf = new ConcreteConnection();
            con = cf.getConnection();
            ps = con.prepareStatement("INSERT INTO discharge(lastName, firstName, attendingPhysician, roomNumber, patientNumber, dateOfAdmission, dateOfDischarge, provisionalDiagnosis, finalDiagnosis, briefHistory, findings, courseOfTreatment, dischargeCondition, rehabPotential, followUp, dateFiled, approvedBy) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, model.getLastName());
            ps.setString(2, model.getFirstName());
            ps.setString(3, model.getAttendingPhysician());
            ps.setInt(4, model.getRoomNumber());
            ps.setInt(5, model.getPatientNumber());
            ps.setDate(6, model.getDateOfAdmission());
            ps.setDate(7, model.getDateOfDischarge());
            ps.setString(8, model.getProvisionalDiagnosis());
            ps.setString(9, model.getFinalDiagnosis());
            ps.setString(10, model.getBriefHistory());
            ps.setString(11, model.getFindings());
            ps.setString(12, model.getCourseOfTreatment());
            ps.setString(13, model.getDischargeCondition());
            ps.setString(14, model.getRehabPotential());
            ps.setString(15, model.getFollowUp());
            ps.setDate(16, model.getDateFiled());
            ps.setString(17, model.getApprovedBy());
            ps.executeUpdate();
            return true;
        }catch(SQLException e){
            
        }
        return false;
    }
}