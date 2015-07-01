/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import DB.ConcreteConnection;
import DB.ConnectionFactory;
import MODEL.WardModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class WardDAO {
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private ConnectionFactory cf;
    
    public LinkedList<WardModel> getPatientCountPerWard(){
        LinkedList<WardModel> list = new LinkedList<>();
        WardModel model;
        cf = new ConcreteConnection();
        
        try{
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT wardID, wardName, capacity, COUNT(*) AS patientCount FROM patient p, ref_ward rw WHERE p.patientWard = rw.wardID GROUP BY p.patientWard");
            rs = ps.executeQuery();
            while(rs.next()){
                model = new WardModel();
                model.setWardID(rs.getInt("wardID"));
                model.setWardName(rs.getString("wardName"));
                model.setCurrentNumber(rs.getInt("patientCount"));
                model.setCapacity(rs.getInt("capacity"));
                list.add(model);
            }
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
    }
    
    public LinkedList<WardModel> getStaffCountPerWard(){
        LinkedList<WardModel> list = new LinkedList<>();
        WardModel model;
        cf = new ConcreteConnection();
                
        try{
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT wardID, wardName, capacity, COUNT(*) AS staffCount FROM staff_schedule ss, ref_ward rw WHERE ss.assignedWard = rw.wardID GROUP BY ss.assignedWard");
            rs = ps.executeQuery();
            while(rs.next()){
                model = new WardModel();
                model.setWardID(rs.getInt("wardID"));
                model.setWardName(rs.getString("wardName"));
                model.setCurrentNumber(rs.getInt("staffCount"));
                model.setCapacity(rs.getInt("capacity"));
                list.add(model);
            }
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
    }
}
