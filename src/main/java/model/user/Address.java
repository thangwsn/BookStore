package model.user;

public class Address {
    private String ID;
    private String ward;
    private String district;
    private String province;
    private String country;

    public Address(String ID, String ward, String district, String province, String country) {
        this.ID = ID;
        this.ward = ward;
        this.district = district;
        this.province = province;
        this.country = country;
    }

    public Address(String ward, String district, String province, String country) {
        this.ward = ward;
        this.district = district;
        this.province = province;
        this.country = country;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
