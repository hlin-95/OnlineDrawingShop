package onlineDrawingShop.controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.security.Principal;

@CrossOrigin(origins = "*")
@RestController
public class LogController {
    public static void authWithHttpServletRequest(HttpServletRequest request, String username, String password) {
        try {
            request.login(username, password);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/login", params = "register", method = RequestMethod.GET)
    public ModelAndView loginError(@RequestParam(value = "register", required = false) String register) {
        ModelAndView modelAndView = new ModelAndView("loginPage");
        if (register != null) {
            modelAndView.addObject("register", "Success! Please Login.");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/login", params = "error", method = RequestMethod.GET)
    public ModelAndView loginAfterRegister(@RequestParam(value = "error", required = false) String error) {
        ModelAndView modelAndView = new ModelAndView("loginPage");
        if (error != null) {
            modelAndView.addObject("error", "Invalid Username and Password");
        }
        return modelAndView;
    }
}
