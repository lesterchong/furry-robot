/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import DB.ConcreteConnection;
import DB.ConnectionFactory;
import MODEL.UserModel;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

/**
 *
 * @author Lester Chong
 */
public class UserDAO {
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private ConnectionFactory cf;
    
    public boolean addUser(UserModel user){
        try{
            cf = new ConcreteConnection();
            con = cf.getConnection();
            ps = con.prepareStatement("INSERT INTO USER(username, password, contactNumber, privilegeID, hospitalID) VALUES(?, ?, ?, ?, ?)");
            ps.setString(1, user.getUsername());
            ps.setString(2, hashPassword(user.getPassword()));
            ps.setInt(3, (int)user.getContactNumber());
            ps.setString(4, user.getPrivilegeType());
            ps.setInt(5, Integer.parseInt(user.getHospital()));
            ps.executeUpdate();
            con.close();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    
    private String hashPassword(String pass){
        MessageDigest md;
        try{
            md = MessageDigest.getInstance("MD5");
            byte[] passBytes = pass.getBytes();
            md.reset();
            byte[] digested = md.digest(passBytes);
            StringBuilder sb = new StringBuilder();
            for(int i=0;i<digested.length;i++){
                sb.append(Integer.toHexString(0xff & digested[i]));
            }
        return sb.toString();
        }catch(NoSuchAlgorithmException ex){
            ex.printStackTrace();
        }
    return null;  
    }
    
    //Could be optimized db side.
    public boolean checkDuplicate(String username){
        LinkedList<UserModel> users = getUsers();
        for(int ctr=0; ctr<users.size(); ctr++){
            if(users.get(ctr).getUsername().equals(username))
                return true;
        }
        return false;
    }
    
    public LinkedList<UserModel> getUsers(){
        LinkedList<UserModel> users = new LinkedList<>();
        UserModel temp;
        
        try{
            cf = new ConcreteConnection();
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT * FROM user u, ref_privilege rp, ref_hospital rh WHERE u.privilegeID = rp.privilegeID and u.hospitalID = rh.hospitalID");
            rs = ps.executeQuery();
            while(rs.next()){
                temp = new UserModel();
                temp.setUserID(rs.getInt("userID"));
                temp.setUsername(rs.getString("username"));
                temp.setPassword(rs.getString("password"));
                temp.setContactNumber(rs.getInt("contactNumber"));
                temp.setPrivilegeType(rs.getString("privilegeName"));
                temp.setHospital(rs.getString("hospitalID"));
                users.add(temp);
            }
            con.close();
        }catch(SQLException e){
            return users;
        }
        return users;
    }
    
    //Could be optimized db side. Assumption input is not yet encrypted. 
    public boolean validateAccount(UserModel user){
        LinkedList<UserModel> users = getUsers();
        String encrypt = hashPassword(user.getPassword());
        
        for(int ctr=0; ctr<users.size(); ctr++){
            if(users.get(ctr).getUsername().equals(user.getUsername())){
                if(users.get(ctr).getPassword().equals(encrypt))
                    return true;
            }
        }
        return false;
    }
    
    public UserModel getUserByUsername(String username){
        UserModel temp=null;
        LinkedList<UserModel> userList = getUsers();
        while(!userList.isEmpty()){
            if(userList.getFirst().getUsername().equals(username)){
                temp = userList.getFirst();
                return temp;
            }else
                userList.pop();
        }
        return temp;
    }
    
    public boolean updatePassword(UserModel user){
        cf = new ConcreteConnection();
        
        try{
            con = cf.getConnection();
            ps = con.prepareStatement("UPDATE user SET password = ? WHERE userID = ?");
            ps.setString(1, hashPassword(user.getPassword()));
            ps.setInt(2, user.getUserID());
            ps.executeUpdate();
            con.close();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return false;
    }
}
