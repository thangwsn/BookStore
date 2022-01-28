package model.order;

import model.enumeration.CodStatus;

import java.util.Date;

public class COD extends Payment{
    private CodStatus codStatus;

    public COD(String ID, double amount, Date createTime, CodStatus codStatus) {
        super(ID, amount, createTime);
        this.codStatus = codStatus;
    }

    public COD() {
        super();
    }

    public CodStatus getCodStatus() {
        return codStatus;
    }

    public void setCodStatus(CodStatus codStatus) {
        this.codStatus = codStatus;
    }
}
