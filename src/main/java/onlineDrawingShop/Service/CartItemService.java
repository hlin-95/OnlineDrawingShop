package onlineDrawingShop.Service;

import onlineDrawingShop.dao.CartItemDao;
import onlineDrawingShop.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;

@Service
public class CartItemService {

    @Autowired
    CustomerService customerService;

    @Autowired
    ProductService productService;

    @Autowired
    CartService cartService;

    @Autowired
    CartItemDao cartItemDao;

    public void likeItem(String productId, String username, String time) {
        CartEntity cart = cartService.findCartByUsername(username);
        ProductEntity product = productService.getProductById(productId);
        product.setLiked(product.getLiked() + 1);
        productService.updateProduct(product);

        CartItemEntity cartItem = new CartItemEntity();
        cartItem.setTime(time);
//        cartItem.setPrice(product.getPrice());

        if (product.getCartItems() == null) {
            product.setCartItems(new ArrayList<>());
        }
        product.getCartItems().add(cartItem);
        cartItem.setProduct(product);

        if (cart.getCartItems() == null) {
            cart.setCartItems(new ArrayList<>());
        }
        cart.getCartItems().add(cartItem);
//        cart.setTotalPrice(cart.getTotalPrice() + cartItem.getPrice());
        cartItem.setCart(cart);

        cartItemDao.addCartItem(cartItem, cart);
    }

    public void notLikeItem(String productId, String username) {
        ProductEntity product = productService.getProductById(productId);
        product.setLiked(product.getLiked() - 1);
        productService.updateProduct(product);

        CartItemEntity cartItem = findCartItemByProductAndUsername(productId, username);
        cartItemDao.deleteCartItem(cartItem);
        CartEntity cart = cartService.findCartByUsername(username);
//        cart.setTotalPrice(cart.getTotalPrice() - cartItem.getPrice());
        cartService.updateCart(cart);
    }

    public CartItemEntity findCartItemByProductAndUsername(String productId, String username) {
        CartEntity cart = cartService.findCartByUsername(username);
        ProductEntity product = productService.getProductById(productId);
        CartItemEntity cartItem = cartItemDao.findCartItemByProductAndCart(product, cart);
        return cartItem;
    }
}
