package onlineDrawingShop.controller;

import onlineDrawingShop.Service.CartItemService;
import onlineDrawingShop.Service.CartService;
import onlineDrawingShop.entity.CartEntity;
import onlineDrawingShop.entity.CartItemEntity;
import onlineDrawingShop.entity.ProductEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.*;

@CrossOrigin(origins = "*")
@RestController
public class CartController {

    @Autowired
    CartService cartService;

    @RequestMapping(value = "/user/like", params = "name", method = RequestMethod.GET)
    public ModelAndView getLike(@RequestParam(value = "name", required = true) String name,
                                @RequestParam(value = "targetCategory", required = false) String targetCategory) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("likeUser");
        Map<String, Object> productsMap = new HashMap<>();

        CartEntity cart = cartService.findCartByUsername(name);
        List<CartItemEntity> cartItems = cart.getCartItems();

        if (targetCategory != null) {
            List<CartItemEntity> cartItemsSelected = new ArrayList<>();
            for (CartItemEntity cartItem : cartItems) {
                if (cartItem.getProduct().getCategory().equals(targetCategory)) {
                    cartItemsSelected.add(cartItem);
                }
            }
            productsMap.put("products", cartItemsSelected);
        } else {
            productsMap.put("products", cartItems);
        }

        Set<String> categories = new HashSet<>();
        for (CartItemEntity cartItem : cartItems) {
            String category = cartItem.getProduct().getCategory();
            if (!categories.contains(category)) {
                categories.add(category);
            }
        }
        productsMap.put("categories", categories);

        modelAndView.addAllObjects(productsMap);
        modelAndView.addObject("currentUser", name);
        modelAndView.addObject("number", cartItems.size());
        return modelAndView;
    }

    @RequestMapping(value = "/user/like", params = "category", method = RequestMethod.POST)
    public ModelAndView getLikeByCategory(@RequestParam(value = "category", required = true) String category,
                                          HttpServletRequest request,
                                          Principal principal) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("likeUser");

        String currentUser = principal.getName();
        CartEntity cart = cartService.findCartByUsername(currentUser);
        List<CartItemEntity> cartItems = cart.getCartItems();
        List<CartItemEntity> targetCartItems = new ArrayList<>();
        for (CartItemEntity cartItem : cartItems) {
            if (cartItem.getProduct().getCategory() == category) {
                targetCartItems.add(cartItem);
            }
        }

        Map<String, Object> productsMap = new HashMap<>();
        productsMap.put("products", targetCartItems);
        modelAndView.addAllObjects(productsMap);
        modelAndView.addObject("currentUser", currentUser);
        modelAndView.addObject("number", cartItems.size());
        return modelAndView;

    }
}
