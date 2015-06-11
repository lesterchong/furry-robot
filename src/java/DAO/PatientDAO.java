/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import DB.ConcreteConnection;
import DB.ConnectionFactory;
import MODEL.PatientModel;
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
        return list;
    }
    
    public LinkedList<PatientModel> getPatientsByHospital(){
        LinkedList<PatientModel> list = new LinkedList<>();
        return list;
    }
}
