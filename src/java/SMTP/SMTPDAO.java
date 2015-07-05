/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SMTP;

import DAO.PatientDAO;
import MODEL.PatientModel;
import java.util.LinkedList;
import java.util.Properties;
import java.util.ResourceBundle;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SMTPDAO {

    private ResourceBundle rc;
    private Properties props;
    private String from;
    private String host;
    private Session session;

    public SMTPDAO() {
        rc = ResourceBundle.getBundle("SMTP.SMTPProperties");
        from = rc.getString("username");
        host = rc.getString("host");
        props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("qmmc.orms@gmail.com", "qmmc_orms");//change accordingly  
            }
        });
    }

    public boolean sendDischargeReport() {
        rc = ResourceBundle.getBundle("SMTP.SMTPProperties");
        String doh = rc.getString("doh");
        StringBuilder sb = new StringBuilder();
        PatientDAO patientDAO = new PatientDAO();
        LinkedList<PatientModel> list;

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(doh));
            message.setSubject("QMMC Discharge Report");

            list = patientDAO.getDischargedPatients();
            sb.append("Patient Name, Date Admitted, Date Discharged, Diagnosis, Barangay, Incident Report");
            for (int ctr = 0; ctr < list.size(); ctr++) {
                sb.append(System.lineSeparator());
                sb.append(list.get(ctr).getPatientLastName() + ", " + list.get(ctr).getPatientFirstName() + ", ");
                sb.append(list.get(ctr).getDateAdmitted() + ", ");
                sb.append(list.get(ctr).getDateDischarged() + ", ");
                sb.append(list.get(ctr).getPatientDiagnosis() + ", ");
                sb.append(list.get(ctr).getPatientBarangay() + ", ");
                sb.append(list.get(ctr).getIncidentBarangay() + ", ");
            }
            message.setText(sb.toString());

            Transport.send(message);
            return true;
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean sendPatient(PatientModel model, String emailReceiver) {
        StringBuilder sb = new StringBuilder();

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(emailReceiver));
            message.setSubject("QMMC Patient Transfer");

            sb.append("Patient Name: ");
            sb.append(model.getPatientLastName() + ", " + model.getPatientFirstName());
            sb.append(System.lineSeparator());
            sb.append("Patient Diagnosis: " + model.getPatientDiagnosis());
            sb.append(System.lineSeparator());
            sb.append("Companion Name: " + model.getEmergencyCompanion());
            sb.append(System.lineSeparator());
            sb.append("Companion Contact Number: " + model.getEmegergencyContact());
            sb.append(System.lineSeparator());
            sb.append("Assigned Nurse: " + model.getAssignedNurse());
            sb.append(System.lineSeparator());
            sb.append("Known Allergies: " + model.getAllergies());
            sb.append(System.lineSeparator());
            sb.append("Date Admitted: " + model.getDateAdmitted());
            sb.append(System.lineSeparator());

            sb.append(System.lineSeparator());

            sb.append("Procedure History: ");
            for (int ctr = 0; ctr < model.getHistoryProcedure().size(); ctr++) {
                sb.append(System.lineSeparator());
                sb.append("Date Taken: " + model.getHistoryProcedure().get(ctr).getDateTaken());
                sb.append(System.lineSeparator());
                sb.append("Mean Corpu Value: " + model.getHistoryProcedure().get(ctr).isMcv());
                sb.append(System.lineSeparator());
                sb.append("Mean Corpu Hb: " + model.getHistoryProcedure().get(ctr).isMchb());
                sb.append(System.lineSeparator());
                sb.append("Hemocrit: " + model.getHistoryProcedure().get(ctr).isHemocrit());
                sb.append(System.lineSeparator());
                sb.append("Red Blood Cells: " + model.getHistoryProcedure().get(ctr).isRbc());
                sb.append(System.lineSeparator());
                sb.append("RBC Distribution Width: " + model.getHistoryProcedure().get(ctr).isRbcdw());
                sb.append(System.lineSeparator());
                sb.append("Packed Cell Volume: " + model.getHistoryProcedure().get(ctr).isPacked());
                sb.append(System.lineSeparator());
                sb.append("Chloride: " + model.getHistoryProcedure().get(ctr).isChloride());
                sb.append(System.lineSeparator());
                sb.append("Urea: " + model.getHistoryProcedure().get(ctr).isUrea());
                sb.append(System.lineSeparator());
                sb.append("Creatine Phosphokinase: " + model.getHistoryProcedure().get(ctr).isCreatine());
                sb.append(System.lineSeparator());
                sb.append("Sodium: " + model.getHistoryProcedure().get(ctr).isSodium());
                sb.append(System.lineSeparator());
                sb.append("Potassium: " + model.getHistoryProcedure().get(ctr).isPotassium());
                sb.append(System.lineSeparator());
                sb.append("Bicarbonate: " + model.getHistoryProcedure().get(ctr).isBicarbonate());
                sb.append(System.lineSeparator());
                sb.append("Creatinine: " + model.getHistoryProcedure().get(ctr).isCreatinine());
                sb.append(System.lineSeparator());
                sb.append("Erythrocyte Sedi. Rate: " + model.getHistoryProcedure().get(ctr).isEsr());
                sb.append(System.lineSeparator());
                sb.append("Hemoglobin: " + model.getHistoryProcedure().get(ctr).isHemoglobin());
                sb.append(System.lineSeparator());
                sb.append("Platelet Count: " + model.getHistoryProcedure().get(ctr).isPlatelet());
                sb.append(System.lineSeparator());
                sb.append("White Blood Cells: " + model.getHistoryProcedure().get(ctr).isWbc());
                sb.append(System.lineSeparator());
                sb.append("AST: " + model.getHistoryProcedure().get(ctr).isAst());
                sb.append(System.lineSeparator());
                sb.append("ALT: " + model.getHistoryProcedure().get(ctr).isAlt());
                sb.append(System.lineSeparator());
                sb.append("Tourniquet: " + model.getHistoryProcedure().get(ctr).isTourniquet());
                sb.append(System.lineSeparator());
                sb.append("CBC: " + model.getHistoryProcedure().get(ctr).isCbc());
                sb.append(System.lineSeparator());
            }

            sb.append(System.lineSeparator());

            sb.append(System.lineSeparator());
            sb.append("Patient Vitals History: ");
            for (int ctr = 0; ctr < model.getHistoryVitals().size(); ctr++) {
                sb.append(System.lineSeparator());
                sb.append("Date Taken: " + model.getHistoryVitals().get(ctr).getDateTaken());
                sb.append(System.lineSeparator());
                sb.append("Temperature(Celcius): " + model.getHistoryVitals().get(ctr).getTemperature());
                sb.append(System.lineSeparator());
                sb.append("Blood Pressure: " + model.getHistoryVitals().get(ctr).getBloodPressure());
                sb.append(System.lineSeparator());
                sb.append("Last Dextrose: " + model.getHistoryVitals().get(ctr).getLastDextrose());
                sb.append(System.lineSeparator());
            }

            sb.append(System.lineSeparator());

            sb.append(System.lineSeparator());
            sb.append("Pains/Symptoms History: ");
            for (int ctr = 0; ctr < model.getHistorySymptoms().size(); ctr++) {
                sb.append(System.lineSeparator());
                sb.append("Abdominal Pain: " + model.getHistorySymptoms().get(ctr).isAbdominalPain());
                sb.append(System.lineSeparator());
                sb.append("Pleural Effusion: " + model.getHistorySymptoms().get(ctr).isPleuralEffusion());
                sb.append(System.lineSeparator());
                sb.append("Ascites: " + model.getHistorySymptoms().get(ctr).isAscites());
                sb.append(System.lineSeparator());
                sb.append("Hypertension: " + model.getHistorySymptoms().get(ctr).isHypotension());
                sb.append(System.lineSeparator());
                sb.append("Jaundice: " + model.getHistorySymptoms().get(ctr).getJaundice());
                sb.append(System.lineSeparator());
                sb.append("Liver (right cm): " + model.getHistorySymptoms().get(ctr).getLiver());
                sb.append(System.lineSeparator());
                sb.append("Spleen (BRCM): " + model.getHistorySymptoms().get(ctr).getSpleean());
                sb.append(System.lineSeparator());
            }

            message.setText(sb.toString());

            Transport.send(message);
            return true;
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
        return false;

    }
}
