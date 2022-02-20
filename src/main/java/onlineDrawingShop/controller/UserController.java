package onlineDrawingShop.controller;

import onlineDrawingShop.Service.CustomerService;
import onlineDrawingShop.Service.UserService;
import onlineDrawingShop.entity.CustomerEntity;
import onlineDrawingShop.entity.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.security.Principal;

@CrossOrigin(origins = "*")
@RestController
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    CustomerService customerService;

    @RequestMapping(value= "/user/edit", params = "info", method = RequestMethod.POST)
    public String editUserInfo(
            @RequestParam(value = "info") String info,
            @ModelAttribute(value = "customer") CustomerEntity customer,
            BindingResult result,
            HttpServletRequest request,
            Principal principal) {

        if (result.hasErrors()) {
            return "error";
        }

        UserEntity updatedUser = userService.getUserByUsername(principal.getName());
        CustomerEntity updatedCustomer = customerService.getCustomerByUsername(principal.getName());
        if (info.equals("name")) {
            updatedCustomer.setFirstName(customer.getFirstName());
            updatedCustomer.setLastName(customer.getLastName());
            customerService.updateCustomer(updatedCustomer);
        }

        else if (info.equals("phone")) {
            updatedCustomer.setPhoneNumber(customer.getPhoneNumber());
            customerService.updateCustomer(updatedCustomer);
        }

        else if (info.equals("email")) {
            if (userService.getUserByEmail(customer.getEmail()) != null) {
                return "userExisted";
            }
            updatedCustomer.setEmail(customer.getEmail());
            customerService.updateCustomer(updatedCustomer);

            updatedUser.setEmail(customer.getEmail());
            userService.updateUser(updatedUser);
        }

        return "nextStep";
    }


}
