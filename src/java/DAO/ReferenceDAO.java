/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import DB.ConcreteConnection;
import DB.ConnectionFactory;
import MODEL.ReferenceModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

/**
 *
 * @author Lester Chong
 */
public class ReferenceDAO {
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private ConnectionFactory cf;
    private LinkedList<ReferenceModel> list;
    private ReferenceModel model;
    
    public LinkedList<ReferenceModel> getBarangays(){
        cf = new ConcreteConnection();
        
        try{
            list = new LinkedList<>();
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT * FROM ref_barangay");
            rs = ps.executeQuery();
            while(rs.next()){
                model = new ReferenceModel();
                model.setReferenceID(rs.getInt("barangayID"));
                model.setReferenceName(rs.getString("barangayName"));
                model.setContactNumber(rs.getInt("barangayContact"));
                list.add(model);
            }
            con.close();
        }catch(SQLException e){
            
        }
        return list;
    }
    
    public LinkedList<ReferenceModel> getConsentStatus(){
        list = new LinkedList<>();
        return list;
    }
    
    public LinkedList<ReferenceModel> getPharmacy(){
        cf = new ConcreteConnection();
        
        try{
            list = new LinkedList<>();
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT * FROM ref_hospital");
            rs = ps.executeQuery();
            while(rs.next()){
                model = new ReferenceModel();
                model.setReferenceID(rs.getInt("hospitalID"));
                model.setReferenceName(rs.getString("hospitalName"));
                model.setContactNumber(rs.getInt("hospitalContact"));
                list.add(model);
            }
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
    }
    
    public LinkedList<ReferenceModel> getCivilStatus(){
        cf = new ConcreteConnection();
        
        try{
            list = new LinkedList<>();
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT * FROM ref_civil_status");
            rs = ps.executeQuery();
            while(rs.next()){
                model = new ReferenceModel();
                model.setReferenceID(rs.getInt("civilStatusID"));
                model.setReferenceName(rs.getString("civilStatusName"));
                list.add(model);
            }
            con.close();
        }catch(SQLException e){
            
        }
        return list;
    }
    
    public LinkedList<ReferenceModel> getRelationship(){
        cf = new ConcreteConnection();
        
        try{
            list = new LinkedList<>();
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT * FROM ref_relationship");
            rs = ps.executeQuery();
            while(rs.next()){
                model = new ReferenceModel();
                model.setReferenceID(rs.getInt("relationshipID"));
                model.setReferenceName(rs.getString("relationshipName"));
                list.add(model);
            }
            con.close();
        }catch(SQLException e){
            
        }
        return list;
    }
}
