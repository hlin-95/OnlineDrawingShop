package onlineDrawingShop.controller;

import onlineDrawingShop.Service.CartItemService;
import onlineDrawingShop.Service.ProductService;
import onlineDrawingShop.entity.CartItemEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@CrossOrigin(origins = "*")
@RestController
public class CartItemController {

    @Autowired
    private CartItemService cartItemService;

    @Autowired
    private ProductService productService;

    @Autowired
    ProductController productController;

    @Autowired
    CartController cartController;

    @RequestMapping(value="/user/cart/likeItem", params="id", method = RequestMethod.GET)
    public void likeItem (@RequestParam(value = "id", required = false) String productId,
                          HttpServletRequest request,
                          Principal principal) {
        String username = principal.getName();
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        String time = dateFormat.format(date);
        cartItemService.likeItem(productId, username, time);
    }

    @RequestMapping(value="/user/cart/notLikeItem", params="id", method = RequestMethod.GET)
    public void notLikeItem (@RequestParam(value = "id", required = false) String productId,
                                    HttpServletRequest request,
                                    Principal principal) {
        String username = principal.getName();
        cartItemService.notLikeItem(productId, username);
    }
}
