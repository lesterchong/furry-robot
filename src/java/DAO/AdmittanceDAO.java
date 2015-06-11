/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import DB.ConcreteConnection;
import DB.ConnectionFactory;
import MODEL.AdmittanceModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;


public class AdmittanceDAO {
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private ConnectionFactory cf;
    
    public LinkedList<AdmittanceModel> getAdmittances(){
        LinkedList<AdmittanceModel> admittances = new LinkedList<>();
        AdmittanceModel model;

        try{
            cf = new ConcreteConnection();
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT * FROM admittance a, ref_barangay rb, ref_hospital rh, ref_civil_status rcs, ref_relationship rr WHERE a.patientBarangay = rb.barangayID and a.incidentBarangay = rb.barangayID and a.companionBarangay = rb.barangayID and a.patientCivilStatus = rcs.civilStatusID and a.companionRelationship = rr.relationshipID and a.hospitalID = rh.hospitalID");
            rs = ps.executeQuery();
            while(rs.next()){
                model = new AdmittanceModel();
                model.setAdmittanceID(rs.getInt("admittanceID"));
                model.setPatientFirstName(rs.getString("patientFirstName"));
                model.setPatientLastName(rs.getString("patientLastName"));
                model.setPatientAge(rs.getInt("patientAge"));
                model.setPatientPhoneNumber(rs.getInt("patientPhoneNumber"));
                model.setPatientCivilStatus(rs.getString("civilStatusName"));
                model.setPatientBirthDate(rs.getDate("patientBirthdate"));
                model.setPatientAddress(rs.getString("patientAddress"));
                model.setPatientBarangay(rs.getString("barangayName"));
                model.setKnownAllergies(rs.getString("knownAllergies"));
                model.setIncidentLocation(rs.getString("incidentLocation"));
                model.setIncidentBarangay(rs.getString("barangayName"));
                
                model.setCompanionFirstName(rs.getString("companionFirstName"));
                model.setCompanionLastName(rs.getString("companionLastName"));
                model.setCompanionAge(rs.getInt("companionAge"));
                model.setCompanionBirthDate(rs.getDate("companionAge"));
                model.setCompanionPhoneNumber(rs.getInt("companionPhoneNumber"));
                model.setCompanionRelationship(rs.getString("relationshipName"));
                model.setCompanionAddress(rs.getString("companionAddress"));
                model.setCompanionBarangay(rs.getString("barangayName"));
                model.setHospitalID(rs.getInt("hospitalName"));
                model.setDateFiled(rs.getDate("dateFiled"));
                
                admittances.add(model);
            }
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return admittances;
    }
    
    public boolean addAdmittance(AdmittanceModel model){
        try{
            cf = new ConcreteConnection();
            con = cf.getConnection();
            ps = con.prepareStatement("INSERT INTO admittance(patientFirstName, patientLastName, patientAge, patientBirthdate, patientPhoneNumber, patientCivilStatus, patientAddress, patientBarangay, incidentLocation, incidentBarangay, knownAllergies, companionFirstName, companionLastName, companionAge, companionBirthdate, companionPhoneNumber, companionRelationship, companionAddress, companionBarangay, hospitalID, dateFiled) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, model.getPatientFirstName());
            ps.setString(2, model.getPatientLastName());
            ps.setInt(3, model.getPatientAge());
            ps.setDate(4, model.getPatientBirthDate());
            ps.setLong(5, model.getPatientPhoneNumber());
            ps.setInt(6, Integer.parseInt(model.getPatientCivilStatus()));
            ps.setString(7, model.getPatientAddress());
            ps.setInt(8, Integer.parseInt(model.getPatientBarangay()));
            ps.setString(9, model.getIncidentLocation());
            ps.setInt(10, Integer.parseInt(model.getIncidentBarangay()));
            ps.setString(11, model.getKnownAllergies());
            ps.setString(12, model.getCompanionFirstName());
            ps.setString(13, model.getCompanionLastName());
            ps.setInt(14, model.getCompanionAge());
            ps.setDate(15, model.getCompanionBirthDate());
            ps.setLong(16, model.getCompanionPhoneNumber());
            ps.setInt(17, Integer.parseInt(model.getCompanionRelationship()));
            ps.setString(18, model.getCompanionAddress());
            ps.setInt(19, Integer.parseInt(model.getCompanionBarangay()));
            ps.setInt(20, model.getHospitalID());
            ps.setDate(21, model.getDateFiled());
            ps.executeUpdate();
            con.close();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return false;
    }
    
    public int getPatientCountByHospital(int hospitalID){
        int temp=0;
        try{
            cf = new ConcreteConnection();
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT COUNT(admittanceID) AS patientcount FROM admittance ad, ref_hospital rh WHERE ad.hospitalID = ?");
            ps.setInt(1, hospitalID);
            rs = ps.executeQuery();
            rs.next();
            temp = rs.getInt("patientcount");
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return temp;
    }
    
    public boolean deleteAdmittance(int admittanceID){
        cf = new ConcreteConnection();
        
        try{
            con = cf.getConnection();
            ps = con.prepareStatement("DELETE FROM admittance WHERE admittanceID = ?");
            ps.setInt(1, admittanceID);
            ps.executeUpdate();
            con.close();
            return true;
        }catch(SQLException e){

        }
        return true;
    }
    
    public LinkedList<AdmittanceModel> getAdmittancesByHospital(int hospitalID){
        LinkedList<AdmittanceModel> admittances = new LinkedList<>();
        AdmittanceModel model;

        
        try{
            cf = new ConcreteConnection();
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT * FROM admittance a, ref_barangay rb, ref_hospital rh, ref_civil_status rcs, ref_relationship rr WHERE a.patientBarangay = rb.barangayID and a.incidentBarangay = rb.barangayID and a.companionBarangay = rb.barangayID and a.patientCivilStatus = rcs.civilStatusID and a.companionRelationship = rr.relationshipID and a.hospitalID = rh.hospitalID and a.hospitalID = ?");
            ps.setInt(1, hospitalID);
            rs = ps.executeQuery();
            while(rs.next()){
                model = new AdmittanceModel();
                model.setAdmittanceID(rs.getInt("admittanceID"));
                model.setPatientFirstName(rs.getString("patientFirstName"));
                model.setPatientLastName(rs.getString("patientLastName"));
                model.setPatientAge(rs.getInt("patientAge"));
                model.setPatientPhoneNumber(rs.getInt("patientPhoneNumber"));
                model.setPatientCivilStatus(rs.getString("civilStatusName"));
                model.setPatientBirthDate(rs.getDate("patientBirthdate"));
                model.setPatientAddress(rs.getString("patientAddress"));
                model.setPatientBarangay(rs.getString("barangayName"));
                model.setKnownAllergies(rs.getString("knownAllergies"));
                model.setIncidentLocation(rs.getString("incidentLocation"));
                model.setIncidentBarangay(rs.getString("barangayName"));
                
                model.setCompanionFirstName(rs.getString("companionFirstName"));
                model.setCompanionLastName(rs.getString("companionLastName"));
                model.setCompanionAge(rs.getInt("companionAge"));
                model.setCompanionBirthDate(rs.getDate("companionAge"));
                model.setCompanionPhoneNumber(rs.getInt("companionPhoneNumber"));
                model.setCompanionRelationship(rs.getString("relationshipName"));
                model.setCompanionAddress(rs.getString("companionAddress"));
                model.setCompanionBarangay(rs.getString("barangayName"));
                model.setHospitalID(rs.getInt("hospitalName"));
                model.setDateFiled(rs.getDate("dateFiled"));
                
                admittances.add(model);
            }
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return admittances;
    }
    
    public AdmittanceModel getAdmittanceByID(int id){
        LinkedList<AdmittanceModel> list = getAdmittances();
        for(int ctr=0; ctr<list.size(); ctr++){
            if(list.get(ctr).getAdmittanceID()==1)
                return list.get(ctr);
        }
        return null;
    }
}
