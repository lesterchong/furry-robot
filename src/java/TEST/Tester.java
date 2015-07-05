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
import SMTP.SMTPDAO;
import java.util.LinkedList;

public class Tester {
    public static void main(String args[]){
        SMTPDAO dao = new SMTPDAO();
        PatientDAO pdao = new PatientDAO();
        PatientModel model= pdao.getPatientByID(2);
        System.out.println(model);
        dao.sendPatient(model, "lestercharles486@yahoo.com");
    }
    
}
