/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import DB.ConcreteConnection;
import DB.ConnectionFactory;
import MODEL.StaffModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;


public class StaffDAO {
    private Connection con; 
    private PreparedStatement ps;
    private ResultSet rs;
    private ConnectionFactory cf;
    
    public LinkedList<StaffModel> getStaffByHospital(int hospitalID){
        return null;
    }
    
    public LinkedList<StaffModel> getStaff(){
        LinkedList<StaffModel> list = new LinkedList<>();
        StaffModel staffModel;
        PatientDAO patientDAO = new PatientDAO();
        
        cf = new ConcreteConnection();
        try{
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT * FROM staff s, ref_hospital rh, ref_shiftstatus rss, ref_ward rw WHERE s.hospitalID = rh.hospitalID and rss.shiftID = s.shiftStatus and s.assignedWard = rw.wardID");
            rs = ps.executeQuery();
            while(rs.next()){
                staffModel = new StaffModel();
                staffModel.setStaffID(rs.getInt("staffID"));
                staffModel.setStaffFirstName(rs.getString("staffFirstName"));
                staffModel.setStaffLastName(rs.getString("staffLastName"));
                staffModel.setHospitalID(rs.getInt("hospitalID"));
                staffModel.setAssignedWard(rs.getString("wardName"));
                staffModel.setDaysAssigned(rs.getString("daysAssigned"));
                staffModel.setTimeAssigned(rs.getString("timeAssigned"));
                staffModel.setShiftStatus(rs.getString("shiftName"));
                
                staffModel.setPatients(patientDAO.getPatientsByStaffID(staffModel.getStaffID()));
                staffModel.setPatientAssigned(staffModel.getPatients().size());
                list.add(staffModel);
            }
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean addStaff(StaffModel model){
        cf = new ConcreteConnection();
        
        try{
            con = cf.getConnection();
            ps = con.prepareStatement("INSERT INTO staff(staffFirstName, staffLastName, hospitalID, shiftStatus, assignedWard) VALUES(?,?,?,?,?)");
            ps.setString(1, model.getStaffFirstName());
            ps.setString(2, model.getStaffLastName());
            ps.setInt(3, model.getHospitalID());
            ps.setInt(4, Integer.parseInt(model.getShiftStatus()));
            ps.setInt(5, Integer.parseInt(model.getAssignedWard()));
            ps.executeUpdate();
            con.close();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean updateStaffSchedule(StaffModel model){
        cf = new ConcreteConnection();
    
        try{
            con = cf.getConnection();
            ps = con.prepareStatement("UPDATE staff SET assignedWard = ?, timeAssigned = ?, daysAssigned = ?, shiftStatus = ? WHERE staffID = ?");
            ps.setInt(1, Integer.parseInt(model.getAssignedWard()));
            ps.setString(2, model.getTimeAssigned());
            ps.setString(3, model.getDaysAssigned());
            ps.setInt(4, Integer.parseInt(model.getShiftStatus()));
            ps.setInt(5, model.getStaffID());
            ps.executeUpdate();
            con.close();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return false;
    }
    
    public LinkedList<StaffModel> getPatientCountByStaffID(){
        LinkedList<StaffModel> list = new LinkedList<>();
        StaffModel model;
        cf = new ConcreteConnection();
        
        try{
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT COUNT(*) AS patientCount, hospitalID, s.staffID, staffFirstName, staffLastName FROM staff s, patient_staff ps WHERE ps.staffID = s.staffID GROUP BY ps.staffID");
            rs = ps.executeQuery();
            while(rs.next()){
                model = new StaffModel();
                model.setHospitalID(rs.getInt("hospitalID"));
                model.setPatientAssigned(rs.getInt("patientCount"));
                model.setStaffFirstName(rs.getString("staffFirstName"));
                model.setStaffLastName(rs.getString("staffLastName"));
                model.setStaffID(rs.getInt("staffID"));
                list.add(model);
            }
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
    }
    
    public LinkedList<StaffModel> searchStaffByName(String search){
        LinkedList<StaffModel> list = new LinkedList<>();
        PatientDAO patientDAO = new PatientDAO();
        StaffModel staffModel;
        cf = new ConcreteConnection();
        search = "%"+search+"%";
        
        try{
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT * FROM staff s, ref_hospital rh, ref_shiftstatus rss, ref_ward rw WHERE s.hospitalID = rh.hospitalID and rss.shiftID = s.shiftStatus and s.assignedWard = rw.wardID and (s.staffFirstName LIKE ? or s.staffLastName LIKE ?)");
            ps.setString(1, search);
            ps.setString(2, search);
            rs = ps.executeQuery();
            while(rs.next()){
                staffModel = new StaffModel();
                staffModel.setStaffID(rs.getInt("staffID"));
                staffModel.setStaffFirstName(rs.getString("staffFirstName"));
                staffModel.setStaffLastName(rs.getString("staffLastName"));
                staffModel.setHospitalID(rs.getInt("hospitalID"));
                staffModel.setAssignedWard(rs.getString("wardName"));
                staffModel.setDaysAssigned(rs.getString("daysAssigned"));
                staffModel.setTimeAssigned(rs.getString("timeAssigned"));
                staffModel.setShiftStatus(rs.getString("shiftName"));
                
                staffModel.setPatients(patientDAO.getPatientsByStaffID(staffModel.getStaffID()));
                staffModel.setPatientAssigned(staffModel.getPatients().size());
                list.add(staffModel);
            }
            con.close();
            return list;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }
    
    public StaffModel getStaffByID(int staffID){
        LinkedList<StaffModel> list = getStaff();
        for(int ctr=0; ctr<list.size(); ctr++){
            if(list.get(ctr).getStaffID() == staffID)
                return list.get(ctr);
        }
        return null;
    }
    
    public int getStaffIDWithFewestPatients(){
        cf= new ConcreteConnection();
        LinkedList<StaffModel> list = new LinkedList<>();
        StaffModel model;
        try{
            
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT s.staffID ,count(p.patientID) AS pcount FROM patient p NATURAL RIGHT JOIN staff s GROUP BY staffID");
            rs = ps.executeQuery();
            while(rs.next()){
                model = new StaffModel();
                model.setStaffID(rs.getInt("staffID"));
                model.setPatientCount(rs.getInt("pcount"));
                list.add(model);
            }
            con.close();
            Collections.sort((List)list, new StaffComparator());
            return list.getFirst().getStaffID();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return 0;
    }
}
