package onlineDrawingShop.Service;

import onlineDrawingShop.dao.CustomerDao;
import onlineDrawingShop.dao.UserDao;
import onlineDrawingShop.entity.AddressEntity;
import onlineDrawingShop.entity.CustomerEntity;
import onlineDrawingShop.entity.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CustomerService {

    @Autowired
    private CustomerDao customerDao;

    public CustomerEntity getCustomerByUsername(String username) {
        return customerDao.getCustomerByUsername(username);
    }

    public void updateCustomer(CustomerEntity customer) {
        customerDao.updateCustomer(customer);
    }
}
