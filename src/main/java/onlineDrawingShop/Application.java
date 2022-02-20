package onlineDrawingShop;

import onlineDrawingShop.entity.*;
import onlineDrawingShop.log.PaymentAction;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.math.BigDecimal;
import java.util.ArrayList;

public class Application {
//    public static void main(String[] args) {
//        ApplicationContext context = new AnnotationConfigApplicationContext(ApplicationConfig.class); // container
//        PaymentAction paymentAction = (PaymentAction) context.getBean("paymentAction");
//        paymentAction.pay(new BigDecimal(2));
//    }

    public static void main(String[] args) {

//        ApplicationContext context = new AnnotationConfigApplicationContext(ApplicationConfig.class);
//        SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
//
//        Session session = sessionFactory.openSession();
//        session.beginTransaction();
//
//        System.out.println("The transaction begin");
//
//        UserEntity user = new UserEntity();
//        user.setUsername("asdfghjkl");
//        user.setPassword("abc");
//
//        CustomerEntity customer = new CustomerEntity();
//        customer.setFirstName("JH");
//        customer.setLastName("F");
//        customer.setEmail("test@test.com");
//        customer.setPhoneNumber("12345678911");
//        customer.setAddresses(new ArrayList<>());
//        customer.setOrders(new ArrayList<>());
//
//        AddressEntity shippingAddress = new AddressEntity();
//        shippingAddress.setCountry("China");
//        shippingAddress.setCity("Shanghai");
//        shippingAddress.setStreet("123 Ave");
//        shippingAddress.setPostalCode("123456");
//        shippingAddress.setType("shipping");
//        shippingAddress.setOrders(new ArrayList<>());
//
//        AddressEntity billingAddress = new AddressEntity();
//        billingAddress.setCountry("China");
//        billingAddress.setCity("Shanghai");
//        billingAddress.setStreet("123 Ave");
//        billingAddress.setPostalCode("123456");
//        billingAddress.setType("billing");
//        billingAddress.setOrders(new ArrayList<>());
//
//        CartEntity cart = new CartEntity();
////        cart.setTotalPrice(1);
//        cart.setCartItems(new ArrayList<>());
//        cart.setOrders(new ArrayList<>());
//
//        OrderEntity order = new OrderEntity();
//        order.setAddresses(new ArrayList<>());
//
//        order.setCustomer(customer);
//        customer.getOrders().add(order);
//        order.setCart(cart);
//        cart.getOrders().add(order);
//        order.getAddresses().add(shippingAddress);
//        shippingAddress.getOrders().add(order);
//        order.getAddresses().add(billingAddress);
//        billingAddress.getOrders().add(order);
//
//        cart.setCustomer(customer);
//        customer.setCart(cart);
//
//        user.setCustomer(customer);
//        customer.setUser(user);
//
//        customer.getAddresses().add(billingAddress);
//        billingAddress.setCustomer(customer);
//
//        System.out.println("Customer created");
//        session.save(user);
//        System.out.println("Customer saved");
//        session.getTransaction().commit();
//        session.close();
    }
}