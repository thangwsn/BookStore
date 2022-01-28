package businesslogic.userDao;

import model.user.Customer;

import java.util.List;

public interface CustomerDao {
    public boolean addCustomer(Customer customer);

    List<Customer> getAllCustomer();
}
