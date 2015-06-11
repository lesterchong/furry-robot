/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package TEST;

import DAO.UserDAO;
import MODEL.UserModel;

/**
 *
 * @author Lester Chong
 */
public class Tester {
    public static void main(String args[]){
        UserModel model= new UserModel();
        UserDAO dao = new UserDAO();
        
        model.setUserID(1);
        model.setUsername("SuperUser");
        model.setPassword("1234");
        model.setContactNumber(9260751);
        model.setHospital("0");
        model.setPrivilegeType("0");
        
        dao.updatePassword(model);
        /* ADMITTANCE DAO AND MODEL TESTING
        AdmittanceDAO admittancedao= new AdmittanceDAO();
        
        
        //CountPatients
        //System.out.println(admittancedao.getPatientCount());
    
      //AddAdmittance Test
        AdmittanceModel model = new AdmittanceModel();
        model.setFirstName("Lester");
        model.setLastName("Chong");
        model.setNickName("Chong");
        model.setDateOfBirth(new java.sql.Date(new java.util.Date().getTime()));
        model.setSocialSecurityNumber(9111111);
        model.setPhoneNumber(1234567);
        model.setCivilStatus("1");
        model.setAge(14);
        model.setInsuranceType(1);
        model.setInsuranceNumber(123456789);
        model.setPrimaryDoctor("Dr Love");
        model.setDoctorPhoneNumber(143);
        model.setReleaseInfo(1);
        model.setIncidentReport("I died");
        model.setIncidentLocation("There");
        model.setAddress("123 Sesame St. ");
        
        LinkedList<String> allergies = new LinkedList<>();
        for(int ctr=0; ctr<5; ctr++){
            allergies.add("allergy "+1);
        }
        model.setAllergies(allergies);
        
        LinkedList<EmergencyContactModel> emergencyContacts = new LinkedList<>();
        for(int ctr=0; ctr<3; ctr++){
            EmergencyContactModel temp = new EmergencyContactModel();
            temp.setFirstName("John "+ctr);
            temp.setLastName("Doe "+ctr);
            temp.setPrimaryPhoneNumber(ctr);
            temp.setSecondaryPhoneNumber(ctr);
            temp.setRelationship("Soulmate");
            emergencyContacts.add(temp);
        }
        model.setEmergencyContact(emergencyContacts);
        
        System.out.println(admittancedao.addAdmittance(model));
        */
    }
    
}
