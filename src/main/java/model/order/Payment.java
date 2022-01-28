package model.order;

import model.enumeration.PaymentType;

import java.util.Date;

public class Payment {
    private String ID;
    private PaymentType paymentType;
    private double amount;
    private Date createTime;

    public Payment(String ID, PaymentType paymentType, double amount, Date createTime) {
        this.ID = ID;
        this.paymentType = paymentType;
        this.amount = amount;
        this.createTime = createTime;
    }

    public Payment(String ID) {
        this.ID = ID;
    }

    public Payment(String id, double amount, Date createTime) {
    }

    public Payment() {

    }

    public PaymentType getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(PaymentType paymentType) {
        this.paymentType = paymentType;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
