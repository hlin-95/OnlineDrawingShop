package onlineDrawingShop.dao;

import onlineDrawingShop.entity.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.jpa.QueryHints;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class CartItemDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void addCartItem(CartItemEntity cartItem, CartEntity cart) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            session.saveOrUpdate(cart);
            session.save(cartItem);
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

    public CartItemEntity findCartItemByProductAndCart(ProductEntity product, CartEntity cart) {
        CartItemEntity targetCartItem = null;
        try (Session session = sessionFactory.openSession()) {

            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<CartItemEntity> criteria = builder.createQuery(CartItemEntity.class);
            Root<CartItemEntity> cartItem = criteria.from(CartItemEntity.class);

//            criteria.select(cartItem);
            List<Predicate> predicates = new ArrayList<>();
            predicates.add(builder.equal(cartItem.get("product").get("id"), product.getId()));
            predicates.add(builder.equal(cartItem.get("cart").get("id"), cart.getId()));
            Predicate[] predicatesArr = predicates.toArray(new Predicate[predicates.size()]);
            criteria.select(cartItem).where(predicatesArr);
//            criteria.where(builder.equal(cartItem.get("product").get("id"), product.getId()));
            System.out.println(product.getId());
//            criteria.where(builder.equal(cartItem.get("cart").get("id"), cart.getId()));
            System.out.println(cart.getId());
            TypedQuery<CartItemEntity> query = session.createQuery(criteria);

            query.setHint(QueryHints.HINT_CACHEABLE, true);
            targetCartItem = query.getSingleResult();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return targetCartItem;
    }

    public void deleteCartItem(CartItemEntity cartItem) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            session.delete(cartItem);
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
}
