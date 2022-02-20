package onlineDrawingShop.controller;
import onlineDrawingShop.Service.CartItemService;
import onlineDrawingShop.Service.CartService;
import onlineDrawingShop.Service.UserService;
import onlineDrawingShop.entity.CartEntity;
import onlineDrawingShop.entity.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;

@CrossOrigin(origins = "*")
@RestController
public class HomePageController {

    @Autowired
    UserService userService;

    @Autowired
    CartService cartService;

    @GetMapping(path = "/{pageName}")
    public ModelAndView getGuestPage(@PathVariable String pageName) {
        pageName += "Page";
        ModelAndView modelAndView = new ModelAndView(pageName);
        return modelAndView;
    }

    @RequestMapping(path = "/user/{pageName}", method = RequestMethod.GET)
    public ModelAndView getUserPage(
            @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "update", required = false) String update,
            @PathVariable String pageName,
            HttpServletRequest request,
            Principal principal) {
        pageName += "User";
        ModelAndView modelAndView = new ModelAndView();
        if (principal.getName() == "linAdmin") {
            modelAndView.setViewName("loginSuccessAdmin");
            return modelAndView;
        }
        modelAndView.setViewName(pageName);
        if (name != null) {
            String currentUser = principal.getName().toUpperCase();
            modelAndView.addObject("currentUser", currentUser);
        }
        if (pageName.equals("profileUser")) {
            UserEntity user = userService.getUserByUsername(principal.getName());
            modelAndView.addObject("user", user);
            if (update != null) {
                modelAndView.addObject("infoUpdated", "Information updated successfully");
            }
            CartEntity cart = cartService.findCartByUsername(principal.getName());
            modelAndView.addObject("number", cart.getCartItems().size());
        }
        return modelAndView;
    }

    @RequestMapping(path = "/admin/{pageName}", method = RequestMethod.GET)
    public ModelAndView getAdminPage(@PathVariable String pageName) {
        pageName += "Admin";
        ModelAndView modelAndView = new ModelAndView(pageName);
        return modelAndView;
    }
}
