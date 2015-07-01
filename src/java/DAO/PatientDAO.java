/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 dateTaken = vitals
 dateTaken2 = procedure
 dateTaken3 = symptoms
 */
package DAO;

import DB.ConcreteConnection;
import DB.ConnectionFactory;
import MODEL.PatientModel;
import MODEL.ProcedureModel;
import MODEL.SymptomModel;
import MODEL.VitalsModel;
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

    public boolean updateProcedure(PatientModel model) {
        cf = new ConcreteConnection();

        try {
            con = cf.getConnection();
            ps = con.prepareStatement("UPDATE patient SET mcv=?, mchb=?, hemocrit=?, rbc=?, differential=?, rbcdw=?, chloride=?, urea=?, creatine=?, packed=?, sodium=?, potassium=?, bicarbonate=?, creatinine=?, esr=?, hemoglobin=?, platelet=?, wbc=?, ast=?, alt=?, tourniquet=?, cbc=?, dateTaken =? WHERE patientID = ?");
            ps.setBoolean(1, model.getPatientProcedure().isMcv());
            ps.setBoolean(2, model.getPatientProcedure().isMchb());
            ps.setBoolean(3, model.getPatientProcedure().isHemocrit());
            ps.setBoolean(4, model.getPatientProcedure().isRbc());
            ps.setBoolean(5, model.getPatientProcedure().isDifferential());
            ps.setBoolean(6, model.getPatientProcedure().isRbcdw());
            ps.setBoolean(7, model.getPatientProcedure().isChloride());
            ps.setBoolean(8, model.getPatientProcedure().isUrea());
            ps.setBoolean(9, model.getPatientProcedure().isCreatinine());
            ps.setBoolean(10, model.getPatientProcedure().isPacked());
            ps.setBoolean(11, model.getPatientProcedure().isSodium());
            ps.setBoolean(12, model.getPatientProcedure().isPotassium());
            ps.setBoolean(13, model.getPatientProcedure().isBicarbonate());
            ps.setBoolean(14, model.getPatientProcedure().isCreatine());
            ps.setBoolean(15, model.getPatientProcedure().isEsr());
            ps.setBoolean(16, model.getPatientProcedure().isHemoglobin());
            ps.setBoolean(17, model.getPatientProcedure().isPlatelet());
            ps.setBoolean(18, model.getPatientProcedure().isWbc());
            ps.setBoolean(19, model.getPatientProcedure().isAst());
            ps.setBoolean(20, model.getPatientProcedure().isAlt());
            ps.setBoolean(21, model.getPatientProcedure().isTourniquet());
            ps.setBoolean(22, model.getPatientProcedure().isCbc());
            ps.setDate(23, model.getPatientProcedure().getDateTaken());
            ps.setInt(24, model.getPatientID());
            ps.executeUpdate();
            con.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public LinkedList<PatientModel> getPatients() {
        LinkedList<PatientModel> list = new LinkedList<>();
        LinkedList<VitalsModel> vsList;
        LinkedList<SymptomModel> symptomList;
        LinkedList<ProcedureModel> procedureList;
        VitalsModel vsModel;
        SymptomModel symptomModel;
        ProcedureModel procedureModel;
        PatientModel model;
        PreparedStatement ps2;
        ResultSet rs2;

        cf = new ConcreteConnection();

        try {
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT * FROM admittance a, patient p, ref_ward rw, ref_diagnosis rd, staff s WHERE a.admittanceID = p.patientID and p.patientWard = rw.wardID and p.patientDiagnosis = rd.diagnosisID and p.staffID = s.staffID");
            rs = ps.executeQuery();
            while (rs.next()) {
                model = new PatientModel();
                vsList = new LinkedList<>();
                symptomList = new LinkedList<>();
                procedureList = new LinkedList<>();
                vsModel = new VitalsModel();
                symptomModel = new SymptomModel();
                procedureModel = new ProcedureModel();

                //Patient Info and Procedures
                model.setPatientID(rs.getInt("patientID"));
                model.setPatientFirstName(rs.getString("patientFirstName"));
                model.setPatientLastName(rs.getString("patientLastName"));
                model.setPatientDiagnosis(rs.getString("diagnosisName"));
                model.setPatientWard(rs.getString("wardName"));
                model.setEmegergencyContact(rs.getLong("companionPhoneNumber"));
                model.setEmergencyCompanion(rs.getString("companionLastName") + ", " + rs.getString("companionFirstName"));
                model.setAllergies(rs.getString("knownAllergies"));
                model.setAssignedNurse(rs.getString("staffLastName") + ", " + rs.getString("staffFirstName"));
                model.setDateAdmitted(rs.getDate("dateFiled"));
                model.setDateDischarged(rs.getDate("dateDischarged"));

                //Procedures
                procedureModel.setMcv(rs.getBoolean("mcv"));
                procedureModel.setMchb(rs.getBoolean("mchb"));
                procedureModel.setHemocrit(rs.getBoolean("hemocrit"));
                procedureModel.setRbc(rs.getBoolean("rbc"));
                procedureModel.setDifferential(rs.getBoolean("differential"));
                procedureModel.setRbcdw(rs.getBoolean("rbcdw"));
                procedureModel.setChloride(rs.getBoolean("chloride"));
                procedureModel.setUrea(rs.getBoolean("urea"));
                procedureModel.setCreatine(rs.getBoolean("creatine"));
                procedureModel.setPacked(rs.getBoolean("packed"));
                procedureModel.setSodium(rs.getBoolean("sodium"));
                procedureModel.setPotassium(rs.getBoolean("potassium"));
                procedureModel.setBicarbonate(rs.getBoolean("bicarbonate"));
                procedureModel.setCreatinine(rs.getBoolean("creatinine"));
                procedureModel.setEsr(rs.getBoolean("esr"));
                procedureModel.setHemoglobin(rs.getBoolean("hemoglobin"));
                procedureModel.setPlatelet(rs.getBoolean("platelet"));
                procedureModel.setWbc(rs.getBoolean("wbc"));
                procedureModel.setAlt(rs.getBoolean("alt"));
                procedureModel.setAst(rs.getBoolean("ast"));
                procedureModel.setTourniquet(rs.getBoolean("tourniquet"));
                procedureModel.setCbc(rs.getBoolean("cbc"));
                procedureModel.setDateTaken(rs.getDate("dateTaken2"));
                model.setPatientProcedure(procedureModel);

                //Vital Signs
                vsModel.setDateTaken(rs.getDate("dateTaken"));
                vsModel.setTemperature(rs.getFloat("temperature"));
                vsModel.setLastDextrose(rs.getDate("lastDextrose"));
                vsModel.setBloodPressure(rs.getString("bloodPressure"));
                model.setPatientVitals(vsModel);

                //Symptoms
                symptomModel.setAbdominalPain(rs.getBoolean("abdominalPain"));
                symptomModel.setAscites(rs.getBoolean("ascites"));
                symptomModel.setHypotension(rs.getBoolean("hypotension"));
                symptomModel.setJaundice(rs.getString("jaundice"));
                symptomModel.setLiver(rs.getFloat("liver"));
                symptomModel.setPleuralEffusion(rs.getBoolean("pleuralEffusion"));
                symptomModel.setSpleen(rs.getFloat("spleen"));
                symptomModel.setDateTaken(rs.getDate("dateTaken3"));
                model.setPatientSymptoms(symptomModel);

                ps2 = con.prepareStatement("SELECT * FROM history_vitals vs WHERE patientID = ?");
                ps2.setInt(1, model.getPatientID());
                rs2 = ps2.executeQuery();
                while (rs2.next()) {
                    vsModel = new VitalsModel();
                    vsModel.setVitalsID(rs2.getInt("vitalsID"));
                    vsModel.setBloodPressure(rs2.getString("bloodPressure"));
                    vsModel.setTemperature(rs2.getFloat("temperature"));
                    vsModel.setLastDextrose(rs2.getDate("lastDextrose"));
                    vsModel.setDateTaken(rs2.getDate("dateTaken"));
                    vsList.add(vsModel);
                }
                model.setHistoryVitals(vsList);

                ps2 = con.prepareStatement("SELECT * FROM history_symptom WHERE patientID = ?");
                ps2.setInt(1, model.getPatientID());
                rs2 = ps2.executeQuery();
                while (rs2.next()) {
                    symptomModel = new SymptomModel();
                    symptomModel.setSymptomID(rs2.getInt("symptomID"));
                    symptomModel.setAbdominalPain(rs2.getBoolean("abdominalPain"));
                    symptomModel.setAscites(rs2.getBoolean("ascites"));
                    symptomModel.setHypotension(rs2.getBoolean("hypotension"));
                    symptomModel.setJaundice(rs2.getString("jaundice"));
                    symptomModel.setLiver(rs2.getFloat("liver"));
                    symptomModel.setPleuralEffusion(rs2.getBoolean("pleuralEffusion"));
                    symptomModel.setSpleen(rs2.getFloat("spleen"));
                    symptomModel.setDateTaken(rs2.getDate("dateTaken"));
                    symptomList.add(symptomModel);
                }
                model.setHistorySymptoms(symptomList);

                ps2 = con.prepareStatement("SELECT * FROM history_procedure WHERE patientID = ?");
                ps2.setInt(1, model.getPatientID());
                rs2 = ps2.executeQuery();
                while (rs2.next()) {
                    procedureModel = new ProcedureModel();
                    procedureModel.setMcv(rs.getBoolean("mcv"));
                    procedureModel.setMchb(rs.getBoolean("mchb"));
                    procedureModel.setHemocrit(rs.getBoolean("hemocrit"));
                    procedureModel.setRbc(rs.getBoolean("rbc"));
                    procedureModel.setDifferential(rs.getBoolean("differential"));
                    procedureModel.setRbcdw(rs.getBoolean("rbcdw"));
                    procedureModel.setChloride(rs.getBoolean("chloride"));
                    procedureModel.setUrea(rs.getBoolean("urea"));
                    procedureModel.setCreatine(rs.getBoolean("creatine"));
                    procedureModel.setPacked(rs.getBoolean("packed"));
                    procedureModel.setSodium(rs.getBoolean("sodium"));
                    procedureModel.setPotassium(rs.getBoolean("potassium"));
                    procedureModel.setBicarbonate(rs.getBoolean("bicarbonate"));
                    procedureModel.setCreatinine(rs.getBoolean("creatinine"));
                    procedureModel.setEsr(rs.getBoolean("esr"));
                    procedureModel.setHemoglobin(rs.getBoolean("hemoglobin"));
                    procedureModel.setPlatelet(rs.getBoolean("platelet"));
                    procedureModel.setWbc(rs.getBoolean("wbc"));
                    procedureModel.setAlt(rs.getBoolean("alt"));
                    procedureModel.setAst(rs.getBoolean("ast"));
                    procedureModel.setTourniquet(rs.getBoolean("tourniquet"));
                    procedureModel.setCbc(rs.getBoolean("cbc"));
                    procedureModel.setDateTaken(rs.getDate("dateTaken"));
                    procedureList.add(procedureModel);
                }
                model.setHistoryProcedure(procedureList);
                list.add(model);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public PatientModel getPatientByID(int id) {
        LinkedList<PatientModel> list = getPatients();
        for (int ctr = 0; ctr < list.size(); ctr++) {
            if (list.get(ctr).getPatientID() == id) {
                return list.get(ctr);
            }
        }
        return null;
    }

    public LinkedList<PatientModel> getPatientsByStaffID(int staffID) {
        LinkedList<PatientModel> list = new LinkedList<>();
        LinkedList<VitalsModel> vsList;
        LinkedList<SymptomModel> symptomList;
        LinkedList<ProcedureModel> procedureList;
        VitalsModel vsModel;
        SymptomModel symptomModel;
        PatientModel model;
        ProcedureModel procedureModel;
        PreparedStatement ps2;
        ResultSet rs2;
        cf = new ConcreteConnection();

        try {
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT * FROM admittance a, patient p, ref_ward rw, ref_diagnosis rd, staff s WHERE a.admittanceID = p.patientID and p.patientWard = rw.wardID and p.patientDiagnosis = rd.diagnosisID and p.staffID = s.staffID and p.staffID=?");
            ps.setInt(1, staffID);
            rs = ps.executeQuery();
            while (rs.next()) {
                model = new PatientModel();
                vsList = new LinkedList<>();
                symptomList = new LinkedList<>();
                procedureList = new LinkedList<>();
                vsModel = new VitalsModel();
                symptomModel = new SymptomModel();
                procedureModel = new ProcedureModel();

                model.setPatientID(rs.getInt("patientID"));
                model.setPatientFirstName(rs.getString("patientFirstName"));
                model.setPatientLastName(rs.getString("patientLastName"));
                model.setPatientDiagnosis(rs.getString("diagnosisName"));
                model.setPatientWard(rs.getString("wardName"));
                model.setAllergies(rs.getString("knownAllergies"));
                model.setEmegergencyContact(rs.getLong("companionPhoneNumber"));
                model.setEmergencyCompanion(rs.getString("companionLastName") + ", " + rs.getString("companionFirstName"));
                model.setAssignedNurse(rs.getString("staffLastName") + ", " + rs.getString("staffFirstName"));
                model.setDateAdmitted(rs.getDate("dateFiled"));
                model.setDateDischarged(rs.getDate("dateDischarged"));

                //Procedures
                procedureModel.setMcv(rs.getBoolean("mcv"));
                procedureModel.setMchb(rs.getBoolean("mchb"));
                procedureModel.setHemocrit(rs.getBoolean("hemocrit"));
                procedureModel.setRbc(rs.getBoolean("rbc"));
                procedureModel.setDifferential(rs.getBoolean("differential"));
                procedureModel.setRbcdw(rs.getBoolean("rbcdw"));
                procedureModel.setChloride(rs.getBoolean("chloride"));
                procedureModel.setUrea(rs.getBoolean("urea"));
                procedureModel.setCreatine(rs.getBoolean("creatine"));
                procedureModel.setPacked(rs.getBoolean("packed"));
                procedureModel.setSodium(rs.getBoolean("sodium"));
                procedureModel.setPotassium(rs.getBoolean("potassium"));
                procedureModel.setBicarbonate(rs.getBoolean("bicarbonate"));
                procedureModel.setCreatinine(rs.getBoolean("creatinine"));
                procedureModel.setEsr(rs.getBoolean("esr"));
                procedureModel.setHemoglobin(rs.getBoolean("hemoglobin"));
                procedureModel.setPlatelet(rs.getBoolean("platelet"));
                procedureModel.setWbc(rs.getBoolean("wbc"));
                procedureModel.setAlt(rs.getBoolean("alt"));
                procedureModel.setAst(rs.getBoolean("ast"));
                procedureModel.setTourniquet(rs.getBoolean("tourniquet"));
                procedureModel.setCbc(rs.getBoolean("cbc"));
                procedureModel.setDateTaken(rs.getDate("dateTaken2"));
                model.setPatientProcedure(procedureModel);

                //Vital Signs
                vsModel.setDateTaken(rs.getDate("dateTaken"));
                vsModel.setTemperature(rs.getFloat("temperature"));
                vsModel.setLastDextrose(rs.getDate("lastDextrose"));
                vsModel.setBloodPressure(rs.getString("bloodPressure"));
                model.setPatientVitals(vsModel);

                //Symptoms
                symptomModel.setAbdominalPain(rs.getBoolean("abdominalPain"));
                symptomModel.setAscites(rs.getBoolean("ascites"));
                symptomModel.setHypotension(rs.getBoolean("hypotension"));
                symptomModel.setJaundice(rs.getString("jaundice"));
                symptomModel.setLiver(rs.getFloat("liver"));
                symptomModel.setPleuralEffusion(rs.getBoolean("pleuralEffusion"));
                symptomModel.setSpleen(rs.getFloat("spleen"));
                symptomModel.setDateTaken(rs.getDate("dateTaken3"));
                model.setPatientSymptoms(symptomModel);

                ps2 = con.prepareStatement("SELECT * FROM history_vitals vs WHERE patientID = ?");
                ps2.setInt(1, model.getPatientID());
                rs2 = ps2.executeQuery();
                while (rs2.next()) {
                    vsModel = new VitalsModel();
                    vsModel.setVitalsID(rs2.getInt("vitalsID"));
                    vsModel.setBloodPressure(rs2.getString("bloodPressure"));
                    vsModel.setTemperature(rs2.getFloat("temperature"));
                    vsModel.setLastDextrose(rs2.getDate("lastDextrose"));
                    vsModel.setDateTaken(rs2.getDate("dateTaken"));
                    vsList.add(vsModel);
                }
                model.setHistoryVitals(vsList);

                ps2 = con.prepareStatement("SELECT * FROM history_symptom WHERE patientID = ?");
                ps2.setInt(1, model.getPatientID());
                rs2 = ps2.executeQuery();
                while (rs2.next()) {
                    symptomModel = new SymptomModel();
                    symptomModel.setSymptomID(rs2.getInt("symptomID"));
                    symptomModel.setAbdominalPain(rs2.getBoolean("abdominalPain"));
                    symptomModel.setAscites(rs2.getBoolean("ascites"));
                    symptomModel.setHypotension(rs2.getBoolean("hypotension"));
                    symptomModel.setJaundice(rs2.getString("jaundice"));
                    symptomModel.setLiver(rs2.getFloat("liver"));
                    symptomModel.setPleuralEffusion(rs2.getBoolean("pleuralEffusion"));
                    symptomModel.setSpleen(rs2.getFloat("spleen"));
                    symptomModel.setDateTaken(rs2.getDate("dateTaken"));
                    symptomList.add(symptomModel);
                }
                model.setHistorySymptoms(symptomList);

                ps2 = con.prepareStatement("SELECT * FROM history_procedure WHERE patientID = ?");
                ps2.setInt(1, model.getPatientID());
                rs2 = ps2.executeQuery();
                while (rs2.next()) {
                    procedureModel = new ProcedureModel();
                    procedureModel.setMcv(rs.getBoolean("mcv"));
                    procedureModel.setMchb(rs.getBoolean("mchb"));
                    procedureModel.setHemocrit(rs.getBoolean("hemocrit"));
                    procedureModel.setRbc(rs.getBoolean("rbc"));
                    procedureModel.setDifferential(rs.getBoolean("differential"));
                    procedureModel.setRbcdw(rs.getBoolean("rbcdw"));
                    procedureModel.setChloride(rs.getBoolean("chloride"));
                    procedureModel.setUrea(rs.getBoolean("urea"));
                    procedureModel.setCreatine(rs.getBoolean("creatine"));
                    procedureModel.setPacked(rs.getBoolean("packed"));
                    procedureModel.setSodium(rs.getBoolean("sodium"));
                    procedureModel.setPotassium(rs.getBoolean("potassium"));
                    procedureModel.setBicarbonate(rs.getBoolean("bicarbonate"));
                    procedureModel.setCreatinine(rs.getBoolean("creatinine"));
                    procedureModel.setEsr(rs.getBoolean("esr"));
                    procedureModel.setHemoglobin(rs.getBoolean("hemoglobin"));
                    procedureModel.setPlatelet(rs.getBoolean("platelet"));
                    procedureModel.setWbc(rs.getBoolean("wbc"));
                    procedureModel.setAlt(rs.getBoolean("alt"));
                    procedureModel.setAst(rs.getBoolean("ast"));
                    procedureModel.setTourniquet(rs.getBoolean("tourniquet"));
                    procedureModel.setCbc(rs.getBoolean("cbc"));
                    procedureModel.setDateTaken(rs.getDate("dateTaken"));
                    procedureList.add(procedureModel);
                }
                model.setHistoryProcedure(procedureList);
                list.add(model);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public LinkedList<PatientModel> searchPatientByName(String search) {
        LinkedList<PatientModel> list = new LinkedList<>();
        LinkedList<VitalsModel> vsList;
        LinkedList<SymptomModel> symptomList;
        LinkedList<ProcedureModel> procedureList;
        VitalsModel vsModel;
        SymptomModel symptomModel;
        PatientModel model;
        ProcedureModel procedureModel;
        PreparedStatement ps2;
        ResultSet rs2;
        cf = new ConcreteConnection();
        search = "%" + search + "%";

        try {
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT * FROM admittance a, patient p, ref_ward rw, ref_diagnosis rd, staff s WHERE a.admittanceID = p.patientID and p.patientWard = rw.wardID and p.patientDiagnosis = rd.diagnosisID and p.staffID = s.staffID and dateDischarged IS NULL and (a.patientFirstName LIKE ? or a.patientLastName LIKE ?)");
            ps.setString(1, search);
            ps.setString(2, search);
            rs = ps.executeQuery();
            while (rs.next()) {
                model = new PatientModel();
                vsList = new LinkedList<>();
                symptomList = new LinkedList<>();
                procedureList = new LinkedList<>();
                vsModel = new VitalsModel();
                symptomModel = new SymptomModel();
                procedureModel = new ProcedureModel();

                model.setPatientID(rs.getInt("patientID"));
                model.setPatientFirstName(rs.getString("patientFirstName"));
                model.setPatientLastName(rs.getString("patientLastName"));
                model.setPatientDiagnosis(rs.getString("diagnosisName"));
                model.setPatientWard(rs.getString("wardName"));
                model.setAllergies(rs.getString("knownAllergies"));
                model.setEmegergencyContact(rs.getLong("companionPhoneNumber"));
                model.setEmergencyCompanion(rs.getString("companionLastName") + ", " + rs.getString("companionFirstName"));
                model.setAssignedNurse(rs.getString("staffLastName") + ", " + rs.getString("staffFirstName"));
                model.setDateAdmitted(rs.getDate("dateFiled"));
                model.setDateDischarged(rs.getDate("dateDischarged"));

                //Procedures
                procedureModel.setMcv(rs.getBoolean("mcv"));
                procedureModel.setMchb(rs.getBoolean("mchb"));
                procedureModel.setHemocrit(rs.getBoolean("hemocrit"));
                procedureModel.setRbc(rs.getBoolean("rbc"));
                procedureModel.setDifferential(rs.getBoolean("differential"));
                procedureModel.setRbcdw(rs.getBoolean("rbcdw"));
                procedureModel.setChloride(rs.getBoolean("chloride"));
                procedureModel.setUrea(rs.getBoolean("urea"));
                procedureModel.setCreatine(rs.getBoolean("creatine"));
                procedureModel.setPacked(rs.getBoolean("packed"));
                procedureModel.setSodium(rs.getBoolean("sodium"));
                procedureModel.setPotassium(rs.getBoolean("potassium"));
                procedureModel.setBicarbonate(rs.getBoolean("bicarbonate"));
                procedureModel.setCreatinine(rs.getBoolean("creatinine"));
                procedureModel.setEsr(rs.getBoolean("esr"));
                procedureModel.setHemoglobin(rs.getBoolean("hemoglobin"));
                procedureModel.setPlatelet(rs.getBoolean("platelet"));
                procedureModel.setWbc(rs.getBoolean("wbc"));
                procedureModel.setAlt(rs.getBoolean("alt"));
                procedureModel.setAst(rs.getBoolean("ast"));
                procedureModel.setTourniquet(rs.getBoolean("tourniquet"));
                procedureModel.setCbc(rs.getBoolean("cbc"));
                procedureModel.setDateTaken(rs.getDate("dateTaken2"));
                model.setPatientProcedure(procedureModel);

                //Vital Signs
                vsModel.setDateTaken(rs.getDate("dateTaken"));
                vsModel.setTemperature(rs.getFloat("temperature"));
                vsModel.setLastDextrose(rs.getDate("lastDextrose"));
                vsModel.setBloodPressure(rs.getString("bloodPressure"));
                model.setPatientVitals(vsModel);

                //Symptoms
                symptomModel.setAbdominalPain(rs.getBoolean("abdominalPain"));
                symptomModel.setAscites(rs.getBoolean("ascites"));
                symptomModel.setHypotension(rs.getBoolean("hypotension"));
                symptomModel.setJaundice(rs.getString("jaundice"));
                symptomModel.setLiver(rs.getFloat("liver"));
                symptomModel.setPleuralEffusion(rs.getBoolean("pleuralEffusion"));
                symptomModel.setSpleen(rs.getFloat("spleen"));
                symptomModel.setDateTaken(rs.getDate("dateTaken3"));
                model.setPatientSymptoms(symptomModel);

                ps2 = con.prepareStatement("SELECT * FROM history_vitals vs WHERE patientID = ?");
                ps2.setInt(1, model.getPatientID());
                rs2 = ps2.executeQuery();
                while (rs2.next()) {
                    vsModel = new VitalsModel();
                    vsModel.setVitalsID(rs.getInt("vitalsID"));
                    vsModel.setBloodPressure(rs.getString("bloodPressure"));
                    vsModel.setTemperature(rs.getFloat("temperature"));
                    vsModel.setLastDextrose(rs.getDate("lastDextrose"));
                    vsModel.setDateTaken(rs.getDate("dateTaken"));
                    vsList.add(vsModel);
                }
                model.setHistoryVitals(vsList);

                ps2 = con.prepareStatement("SELECT * FROM history_symptom WHERE patientID = ?");
                ps2.setInt(1, model.getPatientID());
                rs2 = ps2.executeQuery();
                while (rs2.next()) {
                    symptomModel = new SymptomModel();
                    symptomModel.setSymptomID(rs2.getInt("symptomID"));
                    symptomModel.setAbdominalPain(rs2.getBoolean("abdominalPain"));
                    symptomModel.setAscites(rs2.getBoolean("ascites"));
                    symptomModel.setHypotension(rs2.getBoolean("hypotension"));
                    symptomModel.setJaundice(rs2.getString("jaundice"));
                    symptomModel.setLiver(rs2.getFloat("liver"));
                    symptomModel.setPleuralEffusion(rs2.getBoolean("pleuralEffusion"));
                    symptomModel.setSpleen(rs2.getFloat("spleen"));
                    symptomModel.setDateTaken(rs2.getDate("dateTaken"));
                    symptomList.add(symptomModel);
                }
                model.setHistorySymptoms(symptomList);

                ps2 = con.prepareStatement("SELECT * FROM history_procedure WHERE patientID = ?");
                ps2.setInt(1, model.getPatientID());
                rs2 = ps2.executeQuery();
                while (rs2.next()) {
                    procedureModel = new ProcedureModel();
                    procedureModel.setMcv(rs.getBoolean("mcv"));
                    procedureModel.setMchb(rs.getBoolean("mchb"));
                    procedureModel.setHemocrit(rs.getBoolean("hemocrit"));
                    procedureModel.setRbc(rs.getBoolean("rbc"));
                    procedureModel.setDifferential(rs.getBoolean("differential"));
                    procedureModel.setRbcdw(rs.getBoolean("rbcdw"));
                    procedureModel.setChloride(rs.getBoolean("chloride"));
                    procedureModel.setUrea(rs.getBoolean("urea"));
                    procedureModel.setCreatine(rs.getBoolean("creatine"));
                    procedureModel.setPacked(rs.getBoolean("packed"));
                    procedureModel.setSodium(rs.getBoolean("sodium"));
                    procedureModel.setPotassium(rs.getBoolean("potassium"));
                    procedureModel.setBicarbonate(rs.getBoolean("bicarbonate"));
                    procedureModel.setCreatinine(rs.getBoolean("creatinine"));
                    procedureModel.setEsr(rs.getBoolean("esr"));
                    procedureModel.setHemoglobin(rs.getBoolean("hemoglobin"));
                    procedureModel.setPlatelet(rs.getBoolean("platelet"));
                    procedureModel.setWbc(rs.getBoolean("wbc"));
                    procedureModel.setAlt(rs.getBoolean("alt"));
                    procedureModel.setAst(rs.getBoolean("ast"));
                    procedureModel.setTourniquet(rs.getBoolean("tourniquet"));
                    procedureModel.setCbc(rs.getBoolean("cbc"));
                    procedureModel.setDateTaken(rs.getDate("dateTaken"));
                    procedureList.add(procedureModel);
                }
                model.setHistoryProcedure(procedureList);
                list.add(model);
            }
            con.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public LinkedList<PatientModel> getPatientCountPerDiagnosisSansDetails() {
        LinkedList<PatientModel> list = new LinkedList<>();
        PatientModel model;
        cf = new ConcreteConnection();

        try {
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT diagnosisName, COUNT(*) AS patientCount FROM patient p, ref_diagnosis rd WHERE p.patientDiagnosis = rd.diagnosisID GROUP BY p.patientDiagnosis");
            rs = ps.executeQuery();
            while (rs.next()) {
                model = new PatientModel();
                model.setPatientDiagnosis(rs.getString("diagnosisName"));
                model.setPatientID(rs.getInt("patientCount"));
                list.add(model);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public LinkedList<PatientModel> getLatestTenPatients() {
        LinkedList<PatientModel> list = new LinkedList<>();
        VitalsModel vsModel;
        SymptomModel symptomModel;
        PatientModel model;
        ProcedureModel procedureModel;
        cf = new ConcreteConnection();

        try {
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT * FROM admittance a, patient p, ref_ward rw, ref_diagnosis rd, staff s WHERE a.admittanceID = p.patientID and p.patientWard = rw.wardID and p.patientDiagnosis = rd.diagnosisID and p.staffID = s.staffID and dateDischarged IS NULL ORDER BY dateFiled LIMIT 5");
            rs = ps.executeQuery();
            while (rs.next()) {
                model = new PatientModel();
                vsModel = new VitalsModel();
                symptomModel = new SymptomModel();
                procedureModel = new ProcedureModel();

                model.setPatientID(rs.getInt("patientID"));
                model.setPatientFirstName(rs.getString("patientFirstName"));
                model.setPatientLastName(rs.getString("patientLastName"));
                model.setPatientDiagnosis(rs.getString("diagnosisName"));
                model.setPatientWard(rs.getString("wardName"));
                model.setAllergies(rs.getString("knownAllergies"));
                model.setEmegergencyContact(rs.getLong("companionPhoneNumber"));
                model.setEmergencyCompanion(rs.getString("companionLastName") + ", " + rs.getString("companionFirstName"));
                model.setAssignedNurse(rs.getString("staffLastName") + ", " + rs.getString("staffFirstName"));
                model.setDateAdmitted(rs.getDate("dateFiled"));
                model.setDateDischarged(rs.getDate("dateDischarged"));

                //Procedures
                procedureModel.setMcv(rs.getBoolean("mcv"));
                procedureModel.setMchb(rs.getBoolean("mchb"));
                procedureModel.setHemocrit(rs.getBoolean("hemocrit"));
                procedureModel.setRbc(rs.getBoolean("rbc"));
                procedureModel.setDifferential(rs.getBoolean("differential"));
                procedureModel.setRbcdw(rs.getBoolean("rbcdw"));
                procedureModel.setChloride(rs.getBoolean("chloride"));
                procedureModel.setUrea(rs.getBoolean("urea"));
                procedureModel.setCreatine(rs.getBoolean("creatine"));
                procedureModel.setPacked(rs.getBoolean("packed"));
                procedureModel.setSodium(rs.getBoolean("sodium"));
                procedureModel.setPotassium(rs.getBoolean("potassium"));
                procedureModel.setBicarbonate(rs.getBoolean("bicarbonate"));
                procedureModel.setCreatinine(rs.getBoolean("creatinine"));
                procedureModel.setEsr(rs.getBoolean("esr"));
                procedureModel.setHemoglobin(rs.getBoolean("hemoglobin"));
                procedureModel.setPlatelet(rs.getBoolean("platelet"));
                procedureModel.setWbc(rs.getBoolean("wbc"));
                procedureModel.setAlt(rs.getBoolean("alt"));
                procedureModel.setAst(rs.getBoolean("ast"));
                procedureModel.setTourniquet(rs.getBoolean("tourniquet"));
                procedureModel.setCbc(rs.getBoolean("cbc"));
                procedureModel.setDateTaken(rs.getDate("dateTaken2"));
                model.setPatientProcedure(procedureModel);

                //Vital Signs
                vsModel.setDateTaken(rs.getDate("dateTaken"));
                vsModel.setTemperature(rs.getFloat("temperature"));
                vsModel.setLastDextrose(rs.getDate("lastDextrose"));
                vsModel.setBloodPressure(rs.getString("bloodPressure"));
                model.setPatientVitals(vsModel);

                //Symptoms
                symptomModel.setAbdominalPain(rs.getBoolean("abdominalPain"));
                symptomModel.setAscites(rs.getBoolean("ascites"));
                symptomModel.setHypotension(rs.getBoolean("hypotension"));
                symptomModel.setJaundice(rs.getString("jaundice"));
                symptomModel.setLiver(rs.getFloat("liver"));
                symptomModel.setPleuralEffusion(rs.getBoolean("pleuralEffusion"));
                symptomModel.setSpleen(rs.getFloat("spleen"));
                symptomModel.setDateTaken(rs.getDate("dateTaken3"));
                model.setPatientSymptoms(symptomModel);

                list.add(model);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public LinkedList<PatientModel> getLatestTenDischargedPatients() {
        LinkedList<PatientModel> list = new LinkedList<>();
        PatientModel model;
        VitalsModel vsModel;
        SymptomModel symptomModel;
        ProcedureModel procedureModel;

        cf = new ConcreteConnection();

        try {
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT * FROM admittance a, patient p, ref_ward rw, ref_diagnosis rd, staff s WHERE a.admittanceID = p.patientID and p.patientWard = rw.wardID and p.patientDiagnosis = rd.diagnosisID and p.staffID = s.staffID and dateDischarged IS NOT NULL ORDER BY dateDischarged LIMIT 5");
            rs = ps.executeQuery();
            while (rs.next()) {
                model = new PatientModel();
                vsModel = new VitalsModel();
                symptomModel = new SymptomModel();
                procedureModel = new ProcedureModel();

                model.setPatientID(rs.getInt("patientID"));
                model.setPatientFirstName(rs.getString("patientFirstName"));
                model.setPatientLastName(rs.getString("patientLastName"));
                model.setPatientDiagnosis(rs.getString("diagnosisName"));
                model.setPatientWard(rs.getString("wardName"));
                model.setAllergies(rs.getString("knownAllergies"));
                model.setEmegergencyContact(rs.getLong("companionPhoneNumber"));
                model.setEmergencyCompanion(rs.getString("companionLastName") + ", " + rs.getString("companionFirstName"));
                model.setAssignedNurse(rs.getString("staffLastName") + ", " + rs.getString("staffFirstName"));
                model.setDateAdmitted(rs.getDate("dateFiled"));
                model.setDateDischarged(rs.getDate("dateDischarged"));

                //Procedures
                procedureModel.setMcv(rs.getBoolean("mcv"));
                procedureModel.setMchb(rs.getBoolean("mchb"));
                procedureModel.setHemocrit(rs.getBoolean("hemocrit"));
                procedureModel.setRbc(rs.getBoolean("rbc"));
                procedureModel.setDifferential(rs.getBoolean("differential"));
                procedureModel.setRbcdw(rs.getBoolean("rbcdw"));
                procedureModel.setChloride(rs.getBoolean("chloride"));
                procedureModel.setUrea(rs.getBoolean("urea"));
                procedureModel.setCreatine(rs.getBoolean("creatine"));
                procedureModel.setPacked(rs.getBoolean("packed"));
                procedureModel.setSodium(rs.getBoolean("sodium"));
                procedureModel.setPotassium(rs.getBoolean("potassium"));
                procedureModel.setBicarbonate(rs.getBoolean("bicarbonate"));
                procedureModel.setCreatinine(rs.getBoolean("creatinine"));
                procedureModel.setEsr(rs.getBoolean("esr"));
                procedureModel.setHemoglobin(rs.getBoolean("hemoglobin"));
                procedureModel.setPlatelet(rs.getBoolean("platelet"));
                procedureModel.setWbc(rs.getBoolean("wbc"));
                procedureModel.setAlt(rs.getBoolean("alt"));
                procedureModel.setAst(rs.getBoolean("ast"));
                procedureModel.setTourniquet(rs.getBoolean("tourniquet"));
                procedureModel.setCbc(rs.getBoolean("cbc"));
                procedureModel.setDateTaken(rs.getDate("dateTaken2"));
                model.setPatientProcedure(procedureModel);

                vsModel.setDateTaken(rs.getDate("dateTaken"));
                vsModel.setTemperature(rs.getFloat("temperature"));
                vsModel.setLastDextrose(rs.getDate("lastDextrose"));
                vsModel.setBloodPressure(rs.getString("bloodPressure"));
                model.setPatientVitals(vsModel);

                //Symptoms
                symptomModel.setAbdominalPain(rs.getBoolean("abdominalPain"));
                symptomModel.setAscites(rs.getBoolean("ascites"));
                symptomModel.setHypotension(rs.getBoolean("hypotension"));
                symptomModel.setJaundice(rs.getString("jaundice"));
                symptomModel.setLiver(rs.getFloat("liver"));
                symptomModel.setPleuralEffusion(rs.getBoolean("pleuralEffusion"));
                symptomModel.setSpleen(rs.getFloat("spleen"));
                symptomModel.setDateTaken(rs.getDate("dateTaken2"));
                model.setPatientSymptoms(symptomModel);

                list.add(model);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public LinkedList<PatientModel> getUndischargedPatients() {
        LinkedList<PatientModel> list = new LinkedList<>();
        VitalsModel vsModel;
        SymptomModel symptomModel;
        PatientModel model;
        ProcedureModel procedureModel;

        cf = new ConcreteConnection();

        try {
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT * FROM admittance a, patient p, ref_ward rw, ref_diagnosis rd, staff s WHERE a.admittanceID = p.patientID and p.patientWard = rw.wardID and p.patientDiagnosis = rd.diagnosisID and p.staffID = s.staffID and dateDischarged is null");
            rs = ps.executeQuery();
            while (rs.next()) {
                model = new PatientModel();
                vsModel = new VitalsModel();
                symptomModel = new SymptomModel();
                procedureModel = new ProcedureModel();

                model.setPatientID(rs.getInt("patientID"));
                model.setPatientFirstName(rs.getString("patientFirstName"));
                model.setPatientLastName(rs.getString("patientLastName"));
                model.setPatientDiagnosis(rs.getString("diagnosisName"));
                model.setPatientWard(rs.getString("wardName"));
                model.setAllergies(rs.getString("knownAllergies"));
                model.setEmegergencyContact(rs.getLong("companionPhoneNumber"));
                model.setEmergencyCompanion(rs.getString("companionLastName") + ", " + rs.getString("companionFirstName"));
                model.setAssignedNurse(rs.getString("staffLastName") + ", " + rs.getString("staffFirstName"));
                model.setDateAdmitted(rs.getDate("dateFiled"));
                model.setDateDischarged(rs.getDate("dateDischarged"));

                //Procedures
                procedureModel.setMcv(rs.getBoolean("mcv"));
                procedureModel.setMchb(rs.getBoolean("mchb"));
                procedureModel.setHemocrit(rs.getBoolean("hemocrit"));
                procedureModel.setRbc(rs.getBoolean("rbc"));
                procedureModel.setDifferential(rs.getBoolean("differential"));
                procedureModel.setRbcdw(rs.getBoolean("rbcdw"));
                procedureModel.setChloride(rs.getBoolean("chloride"));
                procedureModel.setUrea(rs.getBoolean("urea"));
                procedureModel.setCreatine(rs.getBoolean("creatine"));
                procedureModel.setPacked(rs.getBoolean("packed"));
                procedureModel.setSodium(rs.getBoolean("sodium"));
                procedureModel.setPotassium(rs.getBoolean("potassium"));
                procedureModel.setBicarbonate(rs.getBoolean("bicarbonate"));
                procedureModel.setCreatinine(rs.getBoolean("creatinine"));
                procedureModel.setEsr(rs.getBoolean("esr"));
                procedureModel.setHemoglobin(rs.getBoolean("hemoglobin"));
                procedureModel.setPlatelet(rs.getBoolean("platelet"));
                procedureModel.setWbc(rs.getBoolean("wbc"));
                procedureModel.setAlt(rs.getBoolean("alt"));
                procedureModel.setAst(rs.getBoolean("ast"));
                procedureModel.setTourniquet(rs.getBoolean("tourniquet"));
                procedureModel.setCbc(rs.getBoolean("cbc"));
                procedureModel.setDateTaken(rs.getDate("dateTaken2"));
                model.setPatientProcedure(procedureModel);

                //Vital Signs
                vsModel.setDateTaken(rs.getDate("dateTaken"));
                vsModel.setTemperature(rs.getFloat("temperature"));
                vsModel.setLastDextrose(rs.getDate("lastDextrose"));
                vsModel.setBloodPressure(rs.getString("bloodPressure"));
                model.setPatientVitals(vsModel);

                //Symptoms
                symptomModel.setAbdominalPain(rs.getBoolean("abdominalPain"));
                symptomModel.setAscites(rs.getBoolean("ascites"));
                symptomModel.setHypotension(rs.getBoolean("hypotension"));
                symptomModel.setJaundice(rs.getString("jaundice"));
                symptomModel.setLiver(rs.getFloat("liver"));
                symptomModel.setPleuralEffusion(rs.getBoolean("pleuralEffusion"));
                symptomModel.setSpleen(rs.getFloat("spleen"));
                symptomModel.setDateTaken(rs.getDate("dateTaken3"));
                model.setPatientSymptoms(symptomModel);

                list.add(model);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean dischargePatient(PatientModel model) {
        cf = new ConcreteConnection();

        try {
            con = cf.getConnection();
            ps = con.prepareStatement("UPDATE patient SET dateDischarged = ? WHERE patientID = ?");
            ps.setDate(1, model.getDateDischarged());
            ps.setInt(2, model.getPatientID());
            ps.executeUpdate();
            con.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addPatient(PatientModel model) {
        cf = new ConcreteConnection();

        try {
            con = cf.getConnection();
            ps = con.prepareStatement("INSERT INTO patient(patientDiagnosis, patientWard, staffID) VALUES(?, ?, ?)");
            ps.setInt(1, Integer.parseInt(model.getPatientDiagnosis()));
            ps.setInt(2, Integer.parseInt(model.getPatientWard()));
            ps.setInt(3, Integer.parseInt(model.getAssignedNurse()));
            ps.executeUpdate();
            con.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateVitals(PatientModel model) {
        cf = new ConcreteConnection();

        try {
            con = cf.getConnection();
            ps = con.prepareStatement("UPDATE patient SET dateTaken = ?, bloodPressure = ?, temperature = ?, lastDextrose = ? WHERE patientID = ?");
            ps.setDate(1, model.getPatientVitals().getDateTaken());
            ps.setString(2, model.getPatientVitals().getBloodPressure());
            ps.setFloat(3, model.getPatientVitals().getTemperature());
            ps.setDate(4, model.getPatientVitals().getLastDextrose());
            ps.setInt(5, model.getPatientID());
            ps.executeUpdate();
            con.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateSymptom(PatientModel model) {
        cf = new ConcreteConnection();

        try {
            con = cf.getConnection();
            ps = con.prepareStatement("UPDATE patient SET abdominalPain=?, pleuralEffusion=?, ascites=?, hypotension=?, jaundice=?, liver=?, spleen=?, dateTaken3=? WHERE patientID=?");
            ps.setBoolean(1, model.getPatientSymptoms().isAbdominalPain());
            ps.setBoolean(2, model.getPatientSymptoms().isPleuralEffusion());
            ps.setBoolean(3, model.getPatientSymptoms().isAscites());
            ps.setBoolean(4, model.getPatientSymptoms().isHypotension());
            ps.setString(5, model.getPatientSymptoms().getJaundice());
            ps.setFloat(6, model.getPatientSymptoms().getLiver());
            ps.setFloat(7, model.getPatientSymptoms().getSpleean());
            ps.setDate(8, model.getPatientSymptoms().getDateTaken());
            ps.setInt(9, model.getPatientID());
            ps.executeUpdate();
            con.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean transferVitalsToHistory(PatientModel model) {
        cf = new ConcreteConnection();

        try {
            con = cf.getConnection();
            ps = con.prepareStatement("INSERT INTO history_vitals(dateTaken, bloodPressure, temperature, lastDextrose, patientID) VALUES(?,?,?,?,?)");
            ps.setDate(1, model.getPatientVitals().getDateTaken());
            ps.setString(2, model.getPatientVitals().getBloodPressure());
            ps.setFloat(3, model.getPatientVitals().getTemperature());
            ps.setDate(4, model.getPatientVitals().getLastDextrose());
            ps.setInt(5, model.getPatientID());
            ps.executeUpdate();
            con.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean transferSymptomsToHistory(PatientModel model) {
        cf = new ConcreteConnection();

        try {
            con = cf.getConnection();
            ps = con.prepareStatement("INSERT INTO history_symptom(abdominalPain, pleuralEffusion, ascites, hypotension, jaundice, liver, spleen, patientID) VALUES(?,?,?,?,?,?,?,?)");
            ps.setBoolean(1, model.getPatientSymptoms().isAbdominalPain());
            ps.setBoolean(2, model.getPatientSymptoms().isPleuralEffusion());
            ps.setBoolean(3, model.getPatientSymptoms().isAscites());
            ps.setBoolean(4, model.getPatientSymptoms().isHypotension());
            ps.setString(5, model.getPatientSymptoms().getJaundice());
            ps.setFloat(6, model.getPatientSymptoms().getLiver());
            ps.setFloat(7, model.getPatientSymptoms().getSpleean());
            ps.setInt(8, model.getPatientID());
            ps.executeUpdate();
            con.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public LinkedList<PatientModel> getDischargedPatients() {
        LinkedList<PatientModel> list = new LinkedList<>();
        VitalsModel vsModel;
        SymptomModel symptomModel;
        PatientModel model;
        ProcedureModel procedureModel;
        cf = new ConcreteConnection();

        try {
            con = cf.getConnection();
            ps = con.prepareStatement("SELECT * FROM admittance a, patient p, ref_ward rw, ref_diagnosis rd, staff s, ref_barangay rb WHERE a.admittanceID = p.patientID and p.patientWard = rw.wardID and p.patientDiagnosis = rd.diagnosisID and p.staffID = s.staffID and a.patientBarangay = rb.barangayID and a.incidentBarangay = rb.barangayID and dateDischarged IS NOT NULL");
            rs = ps.executeQuery();
            while (rs.next()) {
                model = new PatientModel();
                vsModel = new VitalsModel();
                symptomModel = new SymptomModel();
                procedureModel = new ProcedureModel();

                model.setPatientID(rs.getInt("patientID"));
                model.setPatientFirstName(rs.getString("patientFirstName"));
                model.setPatientLastName(rs.getString("patientLastName"));
                model.setPatientDiagnosis(rs.getString("diagnosisName"));
                model.setPatientWard(rs.getString("wardName"));
                model.setAllergies(rs.getString("knownAllergies"));
                model.setEmegergencyContact(rs.getLong("companionPhoneNumber"));
                model.setEmergencyCompanion(rs.getString("companionLastName") + ", " + rs.getString("companionFirstName"));
                model.setAssignedNurse(rs.getString("staffLastName") + ", " + rs.getString("staffFirstName"));
                model.setDateAdmitted(rs.getDate("dateFiled"));
                model.setDateDischarged(rs.getDate("dateDischarged"));
                model.setPatientBarangay(rs.getString("barangayName"));
                model.setIncidentBarangay(rs.getString("barangayName"));

                //Procedures
                procedureModel.setMcv(rs.getBoolean("mcv"));
                procedureModel.setMchb(rs.getBoolean("mchb"));
                procedureModel.setHemocrit(rs.getBoolean("hemocrit"));
                procedureModel.setRbc(rs.getBoolean("rbc"));
                procedureModel.setDifferential(rs.getBoolean("differential"));
                procedureModel.setRbcdw(rs.getBoolean("rbcdw"));
                procedureModel.setChloride(rs.getBoolean("chloride"));
                procedureModel.setUrea(rs.getBoolean("urea"));
                procedureModel.setCreatine(rs.getBoolean("creatine"));
                procedureModel.setPacked(rs.getBoolean("packed"));
                procedureModel.setSodium(rs.getBoolean("sodium"));
                procedureModel.setPotassium(rs.getBoolean("potassium"));
                procedureModel.setBicarbonate(rs.getBoolean("bicarbonate"));
                procedureModel.setCreatinine(rs.getBoolean("creatinine"));
                procedureModel.setEsr(rs.getBoolean("esr"));
                procedureModel.setHemoglobin(rs.getBoolean("hemoglobin"));
                procedureModel.setPlatelet(rs.getBoolean("platelet"));
                procedureModel.setWbc(rs.getBoolean("wbc"));
                procedureModel.setAlt(rs.getBoolean("alt"));
                procedureModel.setAst(rs.getBoolean("ast"));
                procedureModel.setTourniquet(rs.getBoolean("tourniquet"));
                procedureModel.setCbc(rs.getBoolean("cbc"));
                model.setPatientProcedure(procedureModel);

                //Vital Signs
                vsModel.setDateTaken(rs.getDate("dateTaken"));
                vsModel.setTemperature(rs.getFloat("temperature"));
                vsModel.setLastDextrose(rs.getDate("lastDextrose"));
                vsModel.setBloodPressure(rs.getString("bloodPressure"));
                model.setPatientVitals(vsModel);

                //Symptoms
                symptomModel.setAbdominalPain(rs.getBoolean("abdominalPain"));
                symptomModel.setAscites(rs.getBoolean("ascites"));
                symptomModel.setHypotension(rs.getBoolean("hypotension"));
                symptomModel.setJaundice(rs.getString("jaundice"));
                symptomModel.setLiver(rs.getFloat("liver"));
                symptomModel.setPleuralEffusion(rs.getBoolean("pleuralEffusion"));
                symptomModel.setSpleen(rs.getFloat("spleen"));
                model.setPatientSymptoms(symptomModel);

                list.add(model);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean transferProcedureToHistory(PatientModel model) {
        cf = new ConcreteConnection();

        try {
            con = cf.getConnection();
            ps = con.prepareStatement("INSERT INTO history_procedure(mcv, mchb, hemocrit, rbc, differential, rbcdw, chloride, urea, creatine, packed, sodium, potassium, bicarbonate, creatinine, esr, hemoglobin, platelet, wbc, ast, alt, tourniquet, cbc, dateTaken, patientID) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setBoolean(1, model.getPatientProcedure().isMcv());
            ps.setBoolean(2, model.getPatientProcedure().isMchb());
            ps.setBoolean(3, model.getPatientProcedure().isHemocrit());
            ps.setBoolean(4, model.getPatientProcedure().isRbc());
            ps.setBoolean(5, model.getPatientProcedure().isDifferential());
            ps.setBoolean(6, model.getPatientProcedure().isRbcdw());
            ps.setBoolean(7, model.getPatientProcedure().isChloride());
            ps.setBoolean(8, model.getPatientProcedure().isUrea());
            ps.setBoolean(9, model.getPatientProcedure().isCreatine());
            ps.setBoolean(10, model.getPatientProcedure().isPacked());
            ps.setBoolean(11, model.getPatientProcedure().isSodium());
            ps.setBoolean(12, model.getPatientProcedure().isPotassium());
            ps.setBoolean(13, model.getPatientProcedure().isBicarbonate());
            ps.setBoolean(14, model.getPatientProcedure().isCreatinine());
            ps.setBoolean(15, model.getPatientProcedure().isEsr());
            ps.setBoolean(16, model.getPatientProcedure().isHemoglobin());
            ps.setBoolean(17, model.getPatientProcedure().isPlatelet());
            ps.setBoolean(18, model.getPatientProcedure().isWbc());
            ps.setBoolean(19, model.getPatientProcedure().isAst());
            ps.setBoolean(20, model.getPatientProcedure().isAlt());
            ps.setBoolean(21, model.getPatientProcedure().isTourniquet());
            ps.setBoolean(22, model.getPatientProcedure().isCbc());
            ps.setDate(23, model.getPatientProcedure().getDateTaken());
            ps.setInt(24, model.getPatientID());
            ps.executeUpdate();
            con.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
