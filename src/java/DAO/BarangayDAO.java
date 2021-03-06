/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import DB.ConcreteConnection;
import DB.ConnectionFactory;
import MODEL.BarangayModel;
import MODEL.SMSModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class BarangayDAO {
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private ConnectionFactory cf;
    
    public LinkedList<BarangayModel> getCountPerBarangay(){
        LinkedList<BarangayModel> list = new LinkedList<>();
        BarangayModel model;
        
        cf = new ConcreteConnection();
        try{
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT barangayID, barangayName, barangayContact, COUNT(*) AS patientCount FROM admittance a, ref_barangay rb, patient p WHERE a.patientBarangay = rb.barangayID and a.admittanceID = p.patientID GROUP BY patientBarangay");
            rs = ps.executeQuery();
            while(rs.next()){
                model = new BarangayModel();
                model.setBarangayID(rs.getInt("barangayID"));
                model.setBarangayName(rs.getString("barangayName"));
                model.setBarangayContact(rs.getLong("barangayContact"));
                model.setPatientCount(rs.getInt("patientCount"));
                list.add(model);
            }
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
    }
    
    public LinkedList<BarangayModel> getBarangays(){
        LinkedList<BarangayModel> list = new LinkedList<>();
        LinkedList<SMSModel> smsList;
        SMSModel smsModel;
        BarangayModel model;
        PreparedStatement ps2;
        ResultSet rs2;
        
        cf = new ConcreteConnection();
        
        try{
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT barangayID, barangayName, barangayContact FROM ref_barangay");
            rs = ps.executeQuery();
            while(rs.next()){
                model = new BarangayModel();
                model.setBarangayID(rs.getInt("barangayID"));
                model.setBarangayName(rs.getString("barangayName"));
                model.setBarangayContact(rs.getLong("barangayContact"));
                
                list.add(model);
            }
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
    }
    
    public BarangayModel getBarangayByID(int id){
        LinkedList<BarangayModel> list = getBarangays();
        for(int ctr=0; ctr<list.size(); ctr++){
            if(list.get(ctr).getBarangayID() == id){
                return list.get(ctr);
            }
        }
        return null;
    }
    
    public LinkedList<BarangayModel> getCountPerBarangaySansSMS(){
        LinkedList<BarangayModel> list = new LinkedList<>();
        BarangayModel model;
        
        cf = new ConcreteConnection();
        try{
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT barangayID, barangayName, barangayContact, COUNT(*) AS patientCount FROM admittance a, ref_barangay rb, patient p WHERE a.patientBarangay = rb.barangayID and a.admittanceID = p.patientID GROUP BY patientBarangay");
            rs = ps.executeQuery();
            while(rs.next()){
                model = new BarangayModel();
                model.setBarangayID(rs.getInt("barangayID"));
                model.setBarangayName(rs.getString("barangayName"));
                model.setBarangayContact(rs.getLong("barangayContact"));
                model.setPatientCount(rs.getInt("patientCount"));
                list.add(model);
            }
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
    }
}
