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
public class HospitalBed {
    private int bedId,bedNo,bedFloor,bedStatus;
    double bedPrice;
    
    String bedType;
    Date bedAddedDate;

    public double getBedPrice() {
        return bedPrice;
    }

    public void setBedPrice(double bedPrice) {
        this.bedPrice = bedPrice;
    }

    public HospitalBed() {
    }

    public int getBedId() {
        return bedId;
    }

    public void setBedId(int bedId) {
        this.bedId = bedId;
    }

    public int getBedNo() {
        return bedNo;
    }

    public void setBedNo(int bedNo) {
        this.bedNo = bedNo;
    }

    public int getBedFloor() {
        return bedFloor;
    }

    public void setBedFloor(int bedFloor) {
        this.bedFloor = bedFloor;
    }

    public int getBedStatus() {
        return bedStatus;
    }

    public void setBedStatus(int bedStatus) {
        this.bedStatus = bedStatus;
    }

    public String getBedType() {
        return bedType;
    }

    public void setBedType(String bedType) {
        this.bedType = bedType;
    }

    public Date getBedAddedDate() {
        return bedAddedDate;
    }

    public void setBedAddedDate(Date bedAddedDate) {
        this.bedAddedDate = bedAddedDate;
    }
    
    
}
