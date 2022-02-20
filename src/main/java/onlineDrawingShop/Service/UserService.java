package onlineDrawingShop.Service;

import onlineDrawingShop.dao.CustomerDao;
import onlineDrawingShop.dao.UserDao;
import onlineDrawingShop.entity.AddressEntity;
import onlineDrawingShop.entity.CartEntity;
import onlineDrawingShop.entity.CustomerEntity;
import onlineDrawingShop.entity.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private CustomerDao customerDao;

//    @Bean
//    public PasswordEncoder passwordEncoder() {
//        return new BCryptPasswordEncoder(10);
//    }
    @Bean
    public PasswordEncoder passwordEncoder() {
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }

    public void addUser(CustomerEntity customer, UserEntity user) {
        user.setPassword(passwordEncoder().encode(user.getPassword()));
        user.setUsername(user.getUsername().toUpperCase(Locale.ROOT));
        customer.setFirstName(customer.getFirstName().toUpperCase(Locale.ROOT));
        customer.setLastName(customer.getLastName().toUpperCase(Locale.ROOT));

        user.setEmail(customer.getEmail());
        customer.setUsername(user.getUsername());
        customer.setUser(user);
        user.setCustomer(customer);
        user.setEnabled(true);

        List<AddressEntity> addresses = new ArrayList<>();
        customer.setAddresses(addresses);

        CartEntity cart = new CartEntity();
        customer.setCart(cart);
        cart.setCustomer(customer);
        userDao.addUser(user);
    }

    public void addAddress(AddressEntity address, String username) {
        CustomerEntity customer = customerDao.getCustomerByUsername(username);
        customer.getAddresses().add(address);
        address.setCustomer(customer);
        userDao.updateUser(customer.getUser());
    }

    public void updateUser(UserEntity user) {
        userDao.updateUser(user);
    }

    public UserEntity getUserByUsername(String username) {
        return userDao.getUserByUsername(username);
    }

    public UserEntity getUserByEmail(String email) {
        return userDao.getUserByEmail(email);
    }
}
