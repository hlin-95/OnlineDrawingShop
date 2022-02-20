package onlineDrawingShop.controller;

import onlineDrawingShop.Service.CartService;
import onlineDrawingShop.Service.ProductService;
import onlineDrawingShop.entity.CartEntity;
import onlineDrawingShop.entity.CartItemEntity;
import onlineDrawingShop.entity.ProductEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.*;

@RestController
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CartService cartService;

    @RequestMapping(value = "/admin/addProduct", params="category", method = RequestMethod.POST)
    public ModelAndView addProduct(
            @RequestParam(value = "category") String category,
            @ModelAttribute(value="productForm")ProductEntity product,
            BindingResult result) {
        ModelAndView modelAndView = new ModelAndView("editProductSuccessAdmin");
        if (result.hasErrors()) {
            modelAndView.addObject("error", "Error");
            return modelAndView;
        }
        product.setCategory(category);
        productService.addProduct(product);
        return modelAndView;
    }

    @RequestMapping(path = "/admin/getAddProductForm/{category}", method = RequestMethod.GET)
    public ModelAndView getAddProductForm(@PathVariable String category) {
        ModelAndView modelAndView = new ModelAndView();
        if (category.equals("all")) {
            productService.addBasicProducts();
            modelAndView.setViewName("editProductSuccessAdmin");
            return modelAndView;
        } else if (category != null){
            modelAndView.setViewName("addProductFormAdmin");
            modelAndView.addObject("category", category);
        }
        return modelAndView;
    }

    @RequestMapping(path = "/admin/deleteProduct/{category}/{productId}", method = RequestMethod.POST)
    public ModelAndView deleteProduct(@PathVariable String category,
                                      @PathVariable String productId,
                                      HttpServletRequest request,
                                      Principal principal) {
        productService.deleteProduct(productId);
        return getProducts("admin", category, request, principal);
    }

    @RequestMapping(path = "/{auth}/getProducts/{category}", method = RequestMethod.GET)
    public ModelAndView getProducts(
            @PathVariable String auth,
            @PathVariable String category,
            HttpServletRequest request,
            Principal principal) {
        String pageName = "";
        if (auth.equals("user")) {
            pageName = "productDetails" + "User";
        } else if (auth.equals("admin")){
            pageName = "productDetails" + "Admin";
        } else {
            pageName = "productDetails" + "Page";
        }
        ModelAndView modelAndView = new ModelAndView(pageName);
        modelAndView.addObject("category", category);

        List<ProductEntity> products = productService.getProducts(category);
        Map<String, Object> productsMap = new HashMap<>();
        productsMap.put("products", products);
        modelAndView.addAllObjects(productsMap);

        if (auth.equals("user")) {
            String currentUser = principal.getName().toUpperCase(Locale.ROOT);
            modelAndView.addObject("currentUser", currentUser);
            CartEntity cart = cartService.findCartByUsername(currentUser);
            List<CartItemEntity> cartItems = cart.getCartItems();

            List<Boolean> likeOrNot = new ArrayList<>();
            boolean like = false;
            for (ProductEntity product : products) {
                for (CartItemEntity cartItem : cartItems) {
                    if (cartItem.getProduct().getProductId().equals(product.getProductId())) {
                        likeOrNot.add(true);
                        like = true;
                        break;
                    }
                }
                if (!like) {
                    likeOrNot.add(false);
                }
                like = false;
            }
            modelAndView.addObject("likeOrNot", likeOrNot);
        }

        return modelAndView;
    }
}
