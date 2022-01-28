package model.user;

import model.enumeration.Gender;
import model.enumeration.MemberLevel;
import model.enumeration.Role;

import java.util.Date;

public class Customer extends User{
    private MemberLevel memberLevel;

    public Customer(String ID) {
        super(ID);
    }

    public Customer(String ID, String email, String phoneNumber, Date dob, Gender gender, Role role, Account account, Fullname fullName, Address address, MemberLevel memberLevel) {
        super(ID, email, phoneNumber, dob, gender, role, account, fullName, address);
        this.memberLevel = memberLevel;
    }

    public Customer() {
        super();
    }

    public MemberLevel getMemberLevel() {
        return memberLevel;
    }

    public void setMemberLevel(MemberLevel memberLevel) {
        this.memberLevel = memberLevel;
    }
}
