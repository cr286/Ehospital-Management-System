/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.entity;

/**
 *
 * @author charm_000
 */
public class Checkup {
    private int checkupId,patientId,doctorId,appointmentId;
    private String checkupReport,checkupTest,checkupMedicine,checkupRemarks;

    public int getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(int appointmentId) {
        this.appointmentId = appointmentId;
    }

    public Checkup() {
    }

    public int getCheckupId() {
        return checkupId;
    }

    public void setCheckupId(int checkupId) {
        this.checkupId = checkupId;
    }

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public String getCheckupReport() {
        return checkupReport;
    }

    public void setCheckupReport(String checkupReport) {
        this.checkupReport = checkupReport;
    }

    public String getCheckupTest() {
        return checkupTest;
    }

    public void setCheckupTest(String checkupTest) {
        this.checkupTest = checkupTest;
    }

    public String getCheckupMedicine() {
        return checkupMedicine;
    }

    public void setCheckupMedicine(String checkupMedicine) {
        this.checkupMedicine = checkupMedicine;
    }

    public String getCheckupRemarks() {
        return checkupRemarks;
    }

    public void setCheckupRemarks(String checkupRemarks) {
        this.checkupRemarks = checkupRemarks;
    }

}
