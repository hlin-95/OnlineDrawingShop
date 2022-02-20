package onlineDrawingShop.dao;

import onlineDrawingShop.entity.CustomerEntity;
import onlineDrawingShop.entity.UserEntity;
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

@Repository
public class CustomerDao {

    @Autowired
    private SessionFactory sessionFactory;

    public CustomerEntity getCustomerByUsername(String username) {
        CustomerEntity targetCustomer = null;
        try (Session session = sessionFactory.openSession()) {

            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<CustomerEntity> criteria = builder.createQuery(CustomerEntity.class);
            Root<CustomerEntity> customer = criteria.from(CustomerEntity.class);
            customer.fetch("addresses", JoinType.LEFT);

            criteria.select(customer);
            criteria.where(builder.equal(customer.get("username"), username));
            TypedQuery<CustomerEntity> query = session.createQuery(criteria);

            query.setHint(QueryHints.HINT_CACHEABLE, true);
            targetCustomer = query.getSingleResult();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return targetCustomer;
    }

    public void updateCustomer(CustomerEntity customer) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            session.saveOrUpdate(customer);
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