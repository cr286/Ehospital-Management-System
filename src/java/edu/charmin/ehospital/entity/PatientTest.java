/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.entity;

import java.sql.Date;

/**
 *
 * @author charm_000
 */
public class PatientTest {

    public String getReportImage() {
        return reportImage;
    }

    public void setReportImage(String reportImage) {
        this.reportImage = reportImage;
    }
    private int patientTestId,patientId,doctorId,testId,status;
    private String testBody,reportImage;
    private Date addedDate,testedDate;  

    public PatientTest() {
    }

    public int getPatientTestId() {
        return patientTestId;
    }

    public void setPatientTestId(int patientTestId) {
        this.patientTestId = patientTestId;
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

    public int getTestId() {
        return testId;
    }

    public void setTestId(int testId) {
        this.testId = testId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getTestBody() {
        return testBody;
    }

    public void setTestBody(String testBody) {
        this.testBody = testBody;
    }

    public Date getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(Date addedDate) {
        this.addedDate = addedDate;
    }

    public Date getTestedDate() {
        return testedDate;
    }

    public void setTestedDate(Date testedDate) {
        this.testedDate = testedDate;
    }
    
}
