package businesslogic.orderDao;

import model.book.Book;
import model.order.CartDetail;
import model.order.Order;
import model.order.ShipmentType;
import model.user.Customer;

import java.util.List;

public interface OrderDao {
    public List<ShipmentType> getAllShipmentType();
    public ShipmentType getShipmentTypeByID(String shipmentTypeID);

    public boolean saveOrder(Order order);

    public List<Book> getBookListForOrder(List<CartDetail> cartDetailList);

    public Order getOrderByOrderID(String orderID);

    public List<Order> getOrderByCustomerID(Customer customer);
}
