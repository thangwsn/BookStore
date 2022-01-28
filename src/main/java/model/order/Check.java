package model.order;

import java.util.Date;

public class Check extends Payment{
    private String name;
    private String bankID;

    public Check(String ID, double amount, Date createTime, String name, String bankID) {
        super(ID, amount, createTime);
        this.name = name;
        this.bankID = bankID;
    }

    public Check() {

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBankID() {
        return bankID;
    }

    public void setBankID(String bankID) {
        this.bankID = bankID;
    }
}
