package businesslogic.userDao;

import model.user.Account;
import model.user.User;

public interface UserDao {
    public Account login(Account account);

    public User getUserByAccountID(String id);

    public boolean isExistedUsername(String username);

    public boolean isExistedEmail(String email);

    public boolean isExistedPhoneNumber(String phoneNumber);
}
