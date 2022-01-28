package model.order;

public class ShipmentType {
    private String ID;
    private String type;
    private double fee;

    public ShipmentType(String ID, String type, double fee) {
        this.ID = ID;
        this.type = type;
        this.fee = fee;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getFee() {
        return fee;
    }

    public void setFee(double fee) {
        this.fee = fee;
    }
}
