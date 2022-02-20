package onlineDrawingShop.dao;

import onlineDrawingShop.entity.CustomerEntity;
import onlineDrawingShop.entity.ProductEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

@Repository
public class ProductDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void addProduct(ProductEntity product) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            session.save(product);
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

    public List<ProductEntity> getProducts(String category) {
        List<ProductEntity> products = new ArrayList<>();
        try (Session session = sessionFactory.openSession()) {
            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<ProductEntity> criteria = builder.createQuery(ProductEntity.class);
            Root<ProductEntity> product = criteria.from(ProductEntity.class);

            criteria.select(product);
            criteria.where(builder.equal(product.get("category"), category));
            products = session.createQuery(criteria).getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    public ProductEntity getProductById(String productId) {
        ProductEntity targetProduct = null;
        try (Session session = sessionFactory.openSession()) {
            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<ProductEntity> criteria = builder.createQuery(ProductEntity.class);
            Root<ProductEntity> product = criteria.from(ProductEntity.class);
            product.fetch("cartItems", JoinType.LEFT);

            criteria.select(product);
            criteria.where(builder.equal(product.get("productId"), productId));
            targetProduct = session.createQuery(criteria).getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return targetProduct;
    }

    public void updateProduct(ProductEntity product) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            session.saveOrUpdate(product);
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

    public void deleteProduct(ProductEntity product) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            session.delete(product);
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

//    public void deleteProductsByCategory(String category) {
//        Session session = null;
//        try {
//            session = sessionFactory.openSession();
//            session.beginTransaction();
//            CriteriaBuilder builder = session.getCriteriaBuilder();
//            CriteriaQuery<ProductEntity> criteria = builder.createQuery(ProductEntity.class);
//            Root<ProductEntity> product = criteria.from(ProductEntity.class);
//
//            criteria.select(product);
//            criteria.where(builder.equal(product.get("category"), category));
//            List<ProductEntity> products = session.createQuery(criteria).getResultList();
//            session.delete(products);
//            session.getTransaction().commit();
//        } catch (Exception e) {
//            e.printStackTrace();
//            session.getTransaction().rollback();
//        } finally {
//            if (session != null) {
//                session.close();
//            }
//        }
//    }
}
