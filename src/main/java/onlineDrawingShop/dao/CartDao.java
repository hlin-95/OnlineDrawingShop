package onlineDrawingShop.dao;

import onlineDrawingShop.entity.CartEntity;
import onlineDrawingShop.entity.CartItemEntity;
import onlineDrawingShop.entity.CustomerEntity;
import onlineDrawingShop.entity.ProductEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.jpa.QueryHints;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Root;
import java.io.IOException;
import java.util.List;

@Repository
public class CartDao {
    @Autowired
    private SessionFactory sessionFactory;

    public CartEntity findCartById(int cartId) {
        CartEntity targetCart = null;
        try (Session session = sessionFactory.openSession()) {

            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<CartEntity> criteria = builder.createQuery(CartEntity.class);
            Root<CartEntity> cart = criteria.from(CartEntity.class);
            cart.fetch("cartItems", JoinType.LEFT);

            criteria.select(cart);
            criteria.where(builder.equal(cart.get("id"), cartId));
            TypedQuery<CartEntity> query = session.createQuery(criteria);

            query.setHint(QueryHints.HINT_CACHEABLE, true);
            targetCart = query.getSingleResult();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return targetCart;
    }

    public void updateCart(CartEntity cart) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            session.saveOrUpdate(cart);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public CartEntity validate (int cartId) throws IOException {
        CartEntity cart = findCartById(cartId);
        if (cart == null || cart.getCartItems().size() == 0) {
            throw new IOException(cartId + "");
        }
        updateCart(cart);
        return cart;
    }

    public double getTotalOrder (CartEntity cart) {
        double totalPrice = 0;
        List<CartItemEntity> cartItems = cart.getCartItems();
        for (CartItemEntity cartItem : cartItems) {
            totalPrice += cartItem.getPrice();
        }
        return totalPrice;
    }
}
