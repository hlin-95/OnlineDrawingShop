package onlineDrawingShop.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "carts")
public class CartEntity implements Serializable {
    private static final long serialVersionUID = -1469617015734235299L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @OneToOne
    @JoinColumn(name = "customers_id", unique = true)
    private CustomerEntity customer;

    @OneToMany(mappedBy = "cart", cascade = CascadeType.ALL,
            orphanRemoval = true)
    private List<CartItemEntity> cartItems;

    @OneToMany(mappedBy = "cart", cascade = CascadeType.ALL)
    private List<OrderEntity> orders;

//    @Column(nullable = false)
//    private double totalPrice = 0.0;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public CustomerEntity getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerEntity customer) {
        this.customer = customer;
    }

    public List<CartItemEntity> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItemEntity> cartItems) {
        this.cartItems = cartItems;
    }

    public List<OrderEntity> getOrders() {
        return orders;
    }

    public void setOrders(List<OrderEntity> orders) {
        this.orders = orders;
    }

//    public double getTotalPrice() {
//        return totalPrice;
//    }
//
//    public void setTotalPrice(double totalPrice) {
//        this.totalPrice = totalPrice;
//    }
}
