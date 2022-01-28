package model.order;

import java.util.Date;

public class Credit extends Payment{
    private String number;
    private String name;
    private Date expireDate;

    public Credit(String ID, double amount, Date createTime, String number, String name, Date expireDate) {
        super(ID, amount, createTime);
        this.number = number;
        this.name = name;
        this.expireDate = expireDate;
    }

    public Credit() {

    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(Date expireDate) {
        this.expireDate = expireDate;
    }
}
