/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import DB.ConcreteConnection;
import DB.ConnectionFactory;
import MODEL.PatientModel;
import MODEL.ProcedureModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class PatientDAO {
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private ConnectionFactory cf;
    
    public LinkedList<PatientModel> getPatientCountByAge(){
        cf = new ConcreteConnection();
        LinkedList<PatientModel> list = new LinkedList<>();
        
        try{
            con = cf.getConnection();
            ps = con.prepareStatement("");
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean updatePatientProgress(PatientModel model){
        return false;
    } 
    
    public boolean addPatientProgess(PatientModel model){
        return false;
    }
    
    public LinkedList<PatientModel> getPatients(){
        LinkedList<PatientModel> list = new LinkedList<>();
        LinkedList<ProcedureModel> procedureList;
        ProcedureModel procedureModel;
        PatientModel model;
        Connection con2;
        PreparedStatement ps2;
        ResultSet rs2;
        
        cf = new ConcreteConnection();
        
        try{
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT admittanceID, patientFirstName, patientLastName, patientPhoneNumber, patientAddress, barangayName, patientWard FROM admittance a, ref_barangay rb WHERE a.patientBarangay = rb.barangayID");
            rs = ps.executeQuery();
            while(rs.next()){
                model = new PatientModel();
                procedureList = new LinkedList<>();
                model.setPatientID(rs.getInt("admittanceID"));
                model.setPatientFirstName(rs.getString("patientFirstName"));
                model.setPatientLastName(rs.getString("patientLastName"));
                model.setPatientPhoneNumber(rs.getLong("patientPhoneNumber"));
                model.setPatientAddress(rs.getString("patientAddress"));
                model.setPatientBarangay(rs.getString("barangayName"));
                model.setPatientWard(rs.getString("patientWard"));
                
                ps2 = con.prepareStatement("SELECT * FROM procedures p WHERE admittanceID = ?");
                ps2.setInt(1, model.getPatientID());
                rs2 = ps2.executeQuery();
                while(rs2.next()){
                    procedureModel = new ProcedureModel();
                    procedureModel.setProcedureID(rs2.getInt("procedureID"));
                    procedureModel.setProcedureName(rs2.getString("procedureName"));
                    procedureModel.setDone(rs2.getBoolean("isDone"));
                    procedureList.add(procedureModel);
                }
                model.setProcedures(procedureList);
                list.add(model);
            }
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
    }
    
    public LinkedList<PatientModel> getPatientsByHospital(){
        LinkedList<PatientModel> list = new LinkedList<>();
        return list;
    }
    
    public PatientModel getPatientByID(int id){
        LinkedList<PatientModel> list = getPatients();
        System.out.println(list.size());
        for(int ctr = 0; ctr<list.size(); ctr++){
            if(list.get(ctr).getPatientID() == id)
                return list.get(ctr);
        }
        return null;
    }
}
