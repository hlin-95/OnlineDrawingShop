package onlineDrawingShop.Service;

import onlineDrawingShop.dao.CartDao;
import onlineDrawingShop.dao.CartItemDao;
import onlineDrawingShop.dao.ProductDao;
import onlineDrawingShop.entity.CartEntity;
import onlineDrawingShop.entity.CartItemEntity;
import onlineDrawingShop.entity.ProductEntity;
import onlineDrawingShop.shared.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductDao productDao;

    @Autowired
    private ProductDefaultService productDefaultService;

    @Autowired
    CartItemService cartItemService;

    @Autowired
    Utils utils;

    public void addProduct(ProductEntity product) {
        product.setProductId("LIN_" + utils.generatePublicId(10));
        productDao.addProduct(product);
    }

    public void addBasicProducts() {
        productDefaultService.addCanal();
        productDefaultService.addTime();
        productDefaultService.addPushingGarden();
        productDefaultService.addModel();

        productDefaultService.addGarden();
        productDefaultService.addPinkish();
        productDefaultService.addReservoir();
        productDefaultService.addHandDrawing();

        productDefaultService.addBoat();
        productDefaultService.addMoment();
        productDefaultService.addChildhood();
        productDefaultService.addDailyLife();
    }

    public List<ProductEntity> getProducts(String category) {
        return productDao.getProducts(category);
    }

    public ProductEntity getProductById(String productId) {
        return productDao.getProductById(productId);
    }

    public void updateProduct(ProductEntity product) {
        productDao.updateProduct(product);
    }

    public void deleteProduct(String productId) {
        ProductEntity product = productDao.getProductById(productId);
        productDao.deleteProduct(product);
    }

//    public void deleteProductsByCategory(String category) {
//        productDao.deleteProductsByCategory(category);
//    }
}

