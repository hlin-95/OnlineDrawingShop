package onlineDrawingShop.dao;

import onlineDrawingShop.entity.AuthoritiesEntity;
import onlineDrawingShop.entity.UserEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.jpa.QueryHints;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
public class UserDao {

    @Autowired
    private SessionFactory sessionFactory;

//    @PersistenceContext
//    EntityManager entityManager;

    public void addUser(UserEntity user) {
        AuthoritiesEntity authorities = new AuthoritiesEntity();
        authorities.setAuthority("ROLE_USER");
        authorities.setUsername(user.getUsername());
        authorities.setEmail(user.getEmail());
        Session session = null;

        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            session.save(authorities);
            session.save(user);
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

    public void updateUser(UserEntity user) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            session.saveOrUpdate(user);
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

    public UserEntity getUserByUsername(String username) {
        UserEntity targetUser = null;
        try (Session session = sessionFactory.openSession()) {

            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<UserEntity> criteria = builder.createQuery(UserEntity.class);
            Root<UserEntity> user = criteria.from(UserEntity.class);

            criteria.select(user);
            criteria.where(builder.equal(user.get("username"), username));
            TypedQuery<UserEntity> query = session.createQuery(criteria);
            query.setHint(QueryHints.HINT_CACHEABLE, true);
            targetUser = query.getSingleResult();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return targetUser;
    }

    public UserEntity getUserByEmail(String email) {
        UserEntity targetUser = null;
        try (Session session = sessionFactory.openSession()) {
            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<UserEntity> criteria = builder.createQuery(UserEntity.class);
            Root<UserEntity> user = criteria.from(UserEntity.class);

            criteria.select(user);
            criteria.where(builder.equal(user.get("email"), email));
            TypedQuery<UserEntity> query = session.createQuery(criteria);
            query.setHint(QueryHints.HINT_CACHEABLE, true);
            targetUser = query.getSingleResult();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return targetUser;
    }
}
