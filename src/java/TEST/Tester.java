/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package TEST;

import DAO.BarangayDAO;
import DAO.PatientDAO;
import DAO.StaffDAO;
import DAO.UserDAO;
import MODEL.BarangayModel;
import MODEL.PatientModel;
import MODEL.UserModel;
import java.util.LinkedList;

public class Tester {
    public static void main(String args[]){
        UserDAO dao = new UserDAO();
        UserModel model = new UserModel();
        model.setUsername("Nurse");
        model.setPassword("1234");
        model.setPrivilegeType("3");
        model.setHospital("0");
        model.setContactNumber(12345667);
        dao.addUser(model);
    }
    
}
