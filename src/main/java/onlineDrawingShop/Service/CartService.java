package onlineDrawingShop.Service;

import onlineDrawingShop.dao.CartDao;
import onlineDrawingShop.dao.CustomerDao;
import onlineDrawingShop.entity.CartEntity;
import onlineDrawingShop.entity.CustomerEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {

    @Autowired
    CustomerDao customerDao;

    @Autowired
    CartDao cartDao;

    public CartEntity findCartByUsername(String username) {
        int cartId = customerDao.getCustomerByUsername(username).getCart().getId();
        return cartDao.findCartById(cartId);
    }

    public void updateCart(CartEntity cart) {
        cartDao.updateCart(cart);
    }
}
