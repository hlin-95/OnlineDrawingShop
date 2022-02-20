package onlineDrawingShop.controller;

import onlineDrawingShop.Service.CustomerService;
import onlineDrawingShop.Service.UserService;
import onlineDrawingShop.entity.AddressEntity;
import onlineDrawingShop.entity.CustomerEntity;
import onlineDrawingShop.entity.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.security.Principal;

@CrossOrigin(origins = "*")
@RestController
public class RegistrationController {

    @Autowired
    private UserService userService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private HttpServletRequest request;

    @RequestMapping(value= "/guest/register", method = RequestMethod.POST)
    public String registerUserBasicInfo(
            @Valid @ModelAttribute(value = "user") UserEntity user,
            BindingResult result,
            @ModelAttribute(value = "customer") CustomerEntity customer) {
        if (result.hasErrors()) {
            return "error";
        }
        if (userService.getUserByUsername(user.getUsername()) != null || userService.getUserByEmail(customer.getEmail()) != null) {
            return "userExisted";
        }

        userService.addUser(customer, user);
//        LogController.authWithHttpServletRequest(request, user.getUsername(), user.getPassword());
//
        return "nextStep";
    }

    @RequestMapping(value = "/user/registerShipping", method = RequestMethod.POST)
    public String registerShipping(
            HttpServletRequest request, Principal principal,
            @ModelAttribute(value = "shippingAddress") AddressEntity shippingAddress,
            BindingResult result) {
        if (result.hasErrors()) {
            return "error";
        }
        shippingAddress.setType("shipping");
        String currentUser = principal.getName();
        userService.addAddress(shippingAddress, currentUser);
        return "shippingAdded";
    }

    @RequestMapping(value = "/user/registerBilling", method = RequestMethod.POST)
    public String registerBilling(
            HttpServletRequest request, Principal principal,
            @ModelAttribute(value = "billingAddress") AddressEntity billingAddress,
            BindingResult result) {
        if (result.hasErrors()) {
            return "error";
        }
        billingAddress.setType("billing");
        String currentUser = principal.getName();
        userService.addAddress(billingAddress,  currentUser);
        return "billingAdded";
    }
}

