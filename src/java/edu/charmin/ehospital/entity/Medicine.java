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
public class Medicine {
   private int medicineId,medicineStatus;
    Date medicineAddedDate;
    String medicineName, medicinePurpose, medicineDescription;

    public int getMedicineId() {
        return medicineId;
    }

    public void setMedicineId(int medicineId) {
        this.medicineId = medicineId;
    }

    public int getMedicineStatus() {
        return medicineStatus;
    }

    public void setMedicineStatus(int medicineStatus) {
        this.medicineStatus = medicineStatus;
    }

    public Date getMedicineAddedDate() {
        return medicineAddedDate;
    }

    public void setMedicineAddedDate(Date medicineAddedDate) {
        this.medicineAddedDate = medicineAddedDate;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    public String getMedicinePurpose() {
        return medicinePurpose;
    }

    public void setMedicinePurpose(String medicinePurpose) {
        this.medicinePurpose = medicinePurpose;
    }

    public String getMedicineDescription() {
        return medicineDescription;
    }

    public void setMedicineDescription(String medicineDescription) {
        this.medicineDescription = medicineDescription;
    }
    
}
