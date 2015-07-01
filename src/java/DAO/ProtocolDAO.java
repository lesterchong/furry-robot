/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import DB.ConcreteConnection;
import DB.ConnectionFactory;
import MODEL.ProtocolModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class ProtocolDAO {
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private ConnectionFactory cf;
    
    
    public LinkedList<ProtocolModel> getProtocols(){
        LinkedList<ProtocolModel> list = new LinkedList<>();
        ProtocolModel model;
        cf = new ConcreteConnection();
        
        try{
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT protocolID, protocolName, colorName, dcondition FROM ref_protocol rp, ref_protocol_color rpc WHERE rp.protocolColor = rpc.colorID");
            rs = ps.executeQuery();
            while(rs.next()){
                model = new ProtocolModel();
                model.setProtocolID(rs.getInt("protocolID"));
                model.setProtocol(rs.getString("protocolName"));
                model.setConditon(rs.getString("condition"));
                model.setProtocolColor(rs.getString("colorName"));
                list.add(model);
            }
            con.close();
            return list;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean addProtocol(ProtocolModel model){
        cf = new ConcreteConnection();
        
        try{
            con = cf.getConnection();
            ps = con.prepareStatement("INSERT INTO ref_protocol VALUES(?, ?, ?)");
            ps.setString(1, model.getProtocol());
            ps.setInt(2, Integer.parseInt(model.getProtocolColor()));
            ps.setString(3, model.getConditon());
            ps.executeUpdate();
            con.close();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return false;
    }
    
    public LinkedList<ProtocolModel> getDengueProtocols(){
        LinkedList<ProtocolModel> list = new LinkedList<>();
        ProtocolModel model;
        cf = new ConcreteConnection();
        
        try{
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT protocolID, protocolName, colorName, dcondition FROM ref_protocol rp, ref_protocol_color rpc WHERE rp.protocolColor = rpc.colorID and rp.dcondition=0");
            rs = ps.executeQuery();
            while(rs.next()){
                model = new ProtocolModel();
                model.setProtocolID(rs.getInt("protocolID"));
                model.setProtocol(rs.getString("protocolName"));
                model.setProtocolColor(rs.getString("colorName"));
                list.add(model);
            }
            con.close();
            return list;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }
    
    public LinkedList<ProtocolModel> getLeptoProtocols(){
        LinkedList<ProtocolModel> list = new LinkedList<>();
        ProtocolModel model;
        cf = new ConcreteConnection();
        
        try{
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT protocolID, protocolName, colorName, dcondition FROM ref_protocol rp, ref_protocol_color rpc WHERE rp.protocolColor = rpc.colorID and rp.dcondition=1");
            rs = ps.executeQuery();
            while(rs.next()){
                model = new ProtocolModel();
                model.setProtocolID(rs.getInt("protocolID"));
                model.setProtocol(rs.getString("protocolName"));
                model.setProtocolColor(rs.getString("colorName"));
                list.add(model);
            }
            con.close();
            return list;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }
}
