package businesslogic.orderDao;
import model.order.Cart;
import model.order.CartDetail;
import model.user.Customer;

import java.sql.Connection;

public interface CartDao {
    public int getQuantityOfCart(String id);
    public Cart getCartByCustomerID(Customer customer);
    public Cart getCartByCartID(String cartID);
    public void updateNewestCart(String id);
    public boolean updateCartDetail(CartDetail cartDetail);
    public boolean insertCartDetail(Cart cart, CartDetail cartDetail);
    public boolean removeCartDetail(CartDetail cartDetail);
    public CartDetail getCartDetailByID(String cartDetailID);
    public void updateCart(Cart cart);
    public void setCartStatus(Connection connection, Cart cart);
}
