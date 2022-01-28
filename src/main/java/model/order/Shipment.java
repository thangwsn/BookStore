package model.order;

public class Shipment {
    private String ID;
    private String address;
    private String phoneNumber;
    private String note;
    private ShipmentType shipmentType;

    public Shipment(String ID, String address, String phoneNumber, String note, ShipmentType shipmentType) {
        this.ID = ID;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.note = note;
        this.shipmentType = shipmentType;
    }

    public Shipment() {

    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public ShipmentType getShipmentType() {
        return shipmentType;
    }

    public void setShipmentType(ShipmentType shipmentType) {
        this.shipmentType = shipmentType;
    }
}
