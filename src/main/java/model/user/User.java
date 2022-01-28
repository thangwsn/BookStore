package model.user;

import model.enumeration.Gender;
import model.enumeration.Role;

import java.util.Date;

public class User {
    private String ID;
    private String email;
    private String phoneNumber;
    private Date dob;
    private Gender gender;
    private Role role;
    private Account account;
    private Fullname fullName;
    private Address address;

    public User(String ID) {
        this.ID = ID;
    }

    public User(String ID, String email, String phoneNumber, Date dob, Gender gender, Role role, Account account, Fullname fullName, Address address) {
        this.ID = ID;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.dob = dob;
        this.gender = gender;
        this.role = role;
        this.account = account;
        this.fullName = fullName;
        this.address = address;
    }

    public User() {

    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Fullname getFullName() {
        return fullName;
    }

    public void setFullName(Fullname fullName) {
        this.fullName = fullName;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }
}
