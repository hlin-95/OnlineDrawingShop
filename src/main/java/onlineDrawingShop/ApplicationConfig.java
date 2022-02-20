package onlineDrawingShop;

import onlineDrawingShop.entity.*;
import onlineDrawingShop.log.Logger;
import onlineDrawingShop.log.PaymentAction;
import onlineDrawingShop.log.ServerLogger;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@EnableWebMvc
public class ApplicationConfig {

//    @Bean
//    public Logger getLogger() {
//        return new ServerLogger();
//    }
//
//    @Bean(name = "paymentAction")
//    public PaymentAction paymentAction() {
//        return new PaymentAction();
//    }

    @Bean(name = "sessionFactory")
    public LocalSessionFactoryBean sessionFactory() {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();

        sessionFactory.setDataSource(dataSource());
        sessionFactory.setHibernateProperties(hibernateProperties());

        sessionFactory.setAnnotatedClasses(new Class[] {
                AddressEntity.class,
                AuthoritiesEntity.class,
                CartEntity.class,
                CartItemEntity.class,
                CustomerEntity.class,
                OrderEntity.class,
                ProductEntity.class,
                UserEntity.class
                });

        return sessionFactory;
    }

    @Bean(name = "dataSource")
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/drawing_shop?createDatabaseIfNotExist=true");
        dataSource.setUsername("lynnhlin");
        dataSource.setPassword("Jh19940916l!");
        return dataSource;
    }

    @Bean(name = "hibernateProperties")
    public Properties hibernateProperties() {
        Properties hibernateProperties = new Properties();
//        hibernateProperties.setProperty("hibernate.hbm2ddl.auto", "create-drop");
        hibernateProperties.setProperty("hibernate.hbm2ddl.auto", "update");
        hibernateProperties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
        return hibernateProperties;
    }
}

