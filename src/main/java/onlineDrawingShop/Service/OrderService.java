package onlineDrawingShop.Service;

import onlineDrawingShop.dao.OrderDao;
import onlineDrawingShop.entity.OrderEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {

    @Autowired
    private OrderDao orderDao;

    public void addOrder(OrderEntity order) {
        orderDao.addOrder(order);
    }
}
