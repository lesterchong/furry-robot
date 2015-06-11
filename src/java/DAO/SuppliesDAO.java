/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import DB.ConcreteConnection;
import DB.ConnectionFactory;
import MODEL.SuppliesModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

/**
 *
 * @author Lester Chong
 */
public class SuppliesDAO {
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private ConnectionFactory cf;
    
    public LinkedList<SuppliesModel> getSupplies(){
        LinkedList<SuppliesModel> supplyList = new LinkedList<>();
        SuppliesModel temp;
        cf = new ConcreteConnection();
        
        try{
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT * FROM supplies s, ref_hospital rh WHERE s.hospitalID = rh.hospitalID");
            rs = ps.executeQuery();
            while(rs.next()){
                temp = new SuppliesModel();
                temp.setSupplyID(rs.getInt("supplyID"));
                temp.setSupplyName(rs.getString("supplyName"));
                temp.setAmount(rs.getInt("amount"));
                temp.setHospital(rs.getString("hospitalName"));
                supplyList.add(temp);
            }
            con.close();
            return supplyList;
        }catch(SQLException e){
            
        }
        return null;
    }
    
    public boolean addSupply(SuppliesModel temp){
        cf = new ConcreteConnection();
        try{
            con = cf.getConnection();
            ps = con.prepareStatement("INSERT INTO supplies(supplyName, amount, hospitalID) VALUES(?, ?, ?)");
            ps.setString(1, temp.getSupplyName());
            ps.setInt(2, temp.getAmount());
            ps.setInt(3, Integer.parseInt(temp.getHospital()));
            ps.executeUpdate();
            con.close();
            return true;
        }catch(SQLException e){
           e.printStackTrace();
        }
        return false;
    }
    
    public boolean updateSupplyAmount(SuppliesModel model){
        cf = new ConcreteConnection();
        
        try{
            con = cf.getConnection();
            ps = con.prepareStatement("UPDATE supplies SET amount = ? WHERE supplyID=?");
            ps.setInt(1, model.getAmount());
            ps.setInt(2, model.getSupplyID());
            ps.executeUpdate();
            con.close();
            return true;
        }catch(SQLException e){
            
        }
        return false;
    }
    
    
}
