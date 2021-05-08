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
public class EmailSubscriber {
    private int subcriberId;
    private String subscriberEmail;
    private Date subscriberDate;

    public Date getSubscriberDate() {
        return subscriberDate;
    }

    public void setSubscriberDate(Date subscriberDate) {
        this.subscriberDate = subscriberDate;
    }

    @Override
    public String toString() {
        return "EmailSubscriber{" + "subcriberId=" + subcriberId + ", subscriberEmail=" + subscriberEmail + ", subscriberDate=" + subscriberDate + '}';
    }
    

    public EmailSubscriber() {
    }
    

    public int getSubcriberId() {
        return subcriberId;
    }

    public void setSubcriberId(int subcriberId) {
        this.subcriberId = subcriberId;
    }

    
    public String getSubscriberEmail() {
        return subscriberEmail;
    }

    public void setSubscriberEmail(String subscriberEmail) {
        this.subscriberEmail = subscriberEmail;
    }


}
