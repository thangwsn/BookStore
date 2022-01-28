package model.user;

import model.enumeration.Gender;
import model.enumeration.Role;

import java.util.Date;

public class Staff extends User{
    private String position;

    public Staff(String ID, String email, String phoneNumber, Date dob, Gender gender, Role role, Account account, Fullname fullName, Address address, String position) {
        super(ID, email, phoneNumber, dob, gender, role, account, fullName, address);
        this.position = position;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
}
