package businesslogic.controller;

import businesslogic.userDao.CustomerDao;
import businesslogic.userDao.CustomerDaoImpl;
import businesslogic.userDao.UserDao;
import businesslogic.userDao.UserDaoImpl;
import model.enumeration.Gender;
import model.enumeration.MemberLevel;
import model.enumeration.Role;
import model.user.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@WebServlet(name = "CustomerServlet", value = "/customer/*")
public class CustomerServlet extends HttpServlet {
    private CustomerDao customerDao;
    private UserDao userDao;

    public void init() {
        customerDao = new CustomerDaoImpl();
        userDao = new UserDaoImpl();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo();
        switch (action) {
            case "/register":
                showRegistrationForm(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getPathInfo();
        switch (action) {
            case "/register":
                handleRegister(request, response);
                break;
        }
    }

    private void showRegistrationForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/registration-form.jsp").forward(request, response);
    }

    private void handleRegister(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Get params
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date dob = null;
        try {
            dob = sdf.parse(request.getParameter("dob"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String ward = request.getParameter("ward");
        String district = request.getParameter("district");
        String province = request.getParameter("province");
        String country = request.getParameter("country");
        Account account = new Account(username, password);
        Fullname fullname = new Fullname(firstName, lastName);
        Address address = new Address(ward, district, province, country);
        User user = new Customer();
        user.setAccount(account);
        user.setFullName(fullname);
        user.setAddress(address);
        user.setGender(Gender.valueOf(gender));
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        user.setDob(dob);

        if (!password.equals(confirmPassword)) {
            request.setAttribute("message", "Confirm password is not correct!");
            request.setAttribute("user", user);
            request.getRequestDispatcher("/view/registration-form.jsp").forward(request, response);
            return;
        }

        // Kiểm tra unique
        if (userDao.isExistedUsername(username)) {
            request.setAttribute("message", "Username is existed!");
            request.setAttribute("user", user);
            request.getRequestDispatcher("/view/registration-form.jsp").forward(request, response);
            return;
        }

        if (userDao.isExistedEmail(email)) {
            request.setAttribute("message", "Email is existed");
            request.setAttribute("user", user);
            request.getRequestDispatcher("/view/registration-form.jsp").forward(request, response);
            return;
        }

        if (userDao.isExistedPhoneNumber(phoneNumber)) {
            request.setAttribute("message", "Phone number is existed");
            request.setAttribute("user", user);
            request.getRequestDispatcher("/view/registration-form.jsp").forward(request, response);
            return;
        }

        user.setID(UUID.randomUUID().toString());
        user.getAccount().setID(UUID.randomUUID().toString());
        user.getAddress().setID(UUID.randomUUID().toString());
        user.getFullName().setID(UUID.randomUUID().toString());
        user.setRole(Role.Customer);
        ((Customer) user).setMemberLevel(MemberLevel.Standard);
        if (customerDao.addCustomer((Customer) user)) {
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            request.setAttribute("message", "Have errors in progress!");
            request.setAttribute("user", user);
            request.getRequestDispatcher("/view/registration-form.jsp").forward(request, response);
        }

    }
}
