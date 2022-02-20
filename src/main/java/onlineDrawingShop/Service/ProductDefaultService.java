package onlineDrawingShop.Service;

import onlineDrawingShop.dao.ProductDao;
import onlineDrawingShop.entity.ProductEntity;
import onlineDrawingShop.shared.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductDefaultService {

    @Autowired
    private ProductDao productDao;

    @Autowired
    Utils utils;

    public void addCanal() {
        ProductEntity product = new ProductEntity();
        product.setCategory("Canal");
        product.setDescription("Canal City in Salt River Reservation, Phoenix, 2021");
//        product.setPrice(299);
//        product.setUnitStock(1);

        product.setProductName("desert-city");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/canal/canal0.webp");
        productDao.addProduct(product);

        product.setProductName("atlas");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/canal/canal1.webp");
        productDao.addProduct(product);

        product.setProductName("water-level");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/canal/canal2.webp");
        productDao.addProduct(product);

        product.setProductName("potential-develop-zone");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/canal/canal3.webp");
        productDao.addProduct(product);

        product.setProductName("strategy-and-typo");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/canal/canal4.webp");
        productDao.addProduct(product);

        product.setProductName("plan");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/canal/canal5.webp");
        productDao.addProduct(product);

        product.setProductName("axon");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/canal/canal6.webp");
        productDao.addProduct(product);

        product.setProductName("perspective-water");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/canal/canal7.webp");
        productDao.addProduct(product);

        product.setProductName("perspective-roof");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/canal/canal8.webp");
        productDao.addProduct(product);

        product.setProductName("water-system");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/canal/canal9.webp");
        productDao.addProduct(product);

        product.setProductName("perspective-flood");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/canal/canal99.webp");
        productDao.addProduct(product);
    }

    public void addPushingGarden() {
        ProductEntity product = new ProductEntity();
        product.setCategory("Pushing-Garden");
        product.setDescription("Garden along the Milwaukee River, 2019");
//        product.setPrice(99);
//        product.setUnitStock(1);

        product.setProductName("perspective");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/pushing/pushing0.webp");
        productDao.addProduct(product);

        product.setProductName("plan");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/pushing/pushing1.webp");
        productDao.addProduct(product);

        product.setProductName("connector");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/pushing/pushing2.webp");
        productDao.addProduct(product);

        product.setProductName("section");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/pushing/pushing3.webp");
        productDao.addProduct(product);
    }

    public void addGarden() {
        ProductEntity product = new ProductEntity();
        product.setCategory("Garden");
        product.setDescription("Elegant garden design, 2019");
//        product.setPrice(99);
//        product.setUnitStock(2);

        product.setProductName("cover");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/garden/garden0.webp");
        productDao.addProduct(product);

        product.setProductName("site-plan");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/garden/garden1.webp");
        productDao.addProduct(product);

        product.setProductName("before-and-after");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/garden/garden2.webp");
        productDao.addProduct(product);

        product.setProductName("detail-design");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/garden/garden3.webp");
        productDao.addProduct(product);

        product.setProductName("seasonal-change");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/garden/garden4.webp");
        productDao.addProduct(product);

        product.setProductName("section");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/garden/garden5.webp");
        productDao.addProduct(product);
    }

    public void addModel() {
        ProductEntity product = new ProductEntity();
        product.setCategory("Physical-Model");
        product.setDescription("Wood, laser cut, 3d printing, 2019");
//        product.setPrice(299);
//        product.setUnitStock(1);

        product.setProductName("waterfront");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/model/model0.webp");
        productDao.addProduct(product);

        product.setProductName("Columbus-Circle");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/model/model1.webp");
        productDao.addProduct(product);

        product.setProductName("Columbus-Circle-Details");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/model/model2.webp");
        productDao.addProduct(product);

        product.setProductName("Landform");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/model/model3.webp");
        productDao.addProduct(product);
    }

    public void addReservoir() {
        ProductEntity product = new ProductEntity();
        product.setCategory("Reservoir");
        product.setDescription("Redesigned reservoir park, 2021");
//        product.setPrice(99);
//        product.setUnitStock(1);

        product.setProductName("site-analysis");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/reservoir/reservoir0.webp");
        productDao.addProduct(product);

        product.setProductName("plan");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/reservoir/reservoir1.webp");
        productDao.addProduct(product);

        product.setProductName("axon");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/reservoir/reservoir2.webp");
        productDao.addProduct(product);

        product.setProductName("stair");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/reservoir/reservoir3.webp");
        productDao.addProduct(product);

        product.setProductName("paddling-pool");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/reservoir/reservoir4.webp");
        productDao.addProduct(product);

        product.setProductName("urban-plaza");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/reservoir/reservoir5.webp");
        productDao.addProduct(product);

        product.setProductName("reservoir");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/reservoir/reservoir6.webp");
        productDao.addProduct(product);
    }

    public void addChildhood() {
        ProductEntity product = new ProductEntity();
        product.setCategory("Childhood");
        product.setDescription("What was your childhood like?");
//        product.setPrice(99);
//        product.setUnitStock(1);

        product.setProductName("cartoon");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/childhood/childhood0.webp");
        productDao.addProduct(product);

        product.setProductName("blue-carpet");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/childhood/childhood1.webp");
        productDao.addProduct(product);

        product.setProductName("site-plan");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/childhood/childhood2.webp");
        productDao.addProduct(product);

        product.setProductName("activities");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/childhood/childhood3.webp");
        productDao.addProduct(product);

        product.setProductName("axon");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/childhood/childhood4.webp");
        productDao.addProduct(product);

        product.setProductName("dream");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/childhood/childhood5.webp");
        productDao.addProduct(product);
    }

    public void addPinkish() {
        ProductEntity product = new ProductEntity();
        product.setCategory("Pinkish-World");
        product.setDescription("Dreamy stage, 2020");
//        product.setPrice(99);
//        product.setUnitStock(1);

        product.setProductName("pink-stage");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/pinkish/pinkish0.webp");
        productDao.addProduct(product);

        product.setProductName("shadow-and-stage");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/pinkish/pinkish1.webp");
        productDao.addProduct(product);

        product.setProductName("seasonal-change");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/pinkish/pinkish2.webp");
        productDao.addProduct(product);

        product.setProductName("perspectives");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/pinkish/pinkish3.webp");
        productDao.addProduct(product);
    }

    public void addHandDrawing() {
        ProductEntity product = new ProductEntity();
        product.setCategory("Hand-Drawing");
        product.setDescription("Sketch and line works, 2013-2021");
//        product.setPrice(99);
//        product.setUnitStock(1);

        product.setProductName("allegorical-drawing");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/handDrawing/handDrawing0.webp");
        productDao.addProduct(product);

        product.setProductName("exploded-drawing");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/handDrawing/handDrawing1.webp");
        productDao.addProduct(product);

        product.setProductName("sketch");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/handDrawing/handDrawing2.webp");
        productDao.addProduct(product);

        product.setProductName("sketch2");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/handDrawing/handDrawing3.webp");
        productDao.addProduct(product);
    }

    public void addTime() {
        ProductEntity product = new ProductEntity();
        product.setCategory("Time");
        product.setDescription("Change over time, 2021");
//        product.setPrice(99);
//        product.setUnitStock(1);

        product.setProductName("water-level");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/time/time0.webp");
        productDao.addProduct(product);

        product.setProductName("raindrop");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/time/time1.webp");
        productDao.addProduct(product);

        product.setProductName("shadow");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/time/time2.webp");
        productDao.addProduct(product);

        product.setProductName("landform-plan");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/time/time3.webp");
        productDao.addProduct(product);

        product.setProductName("experiment");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/time/time4.webp");
        productDao.addProduct(product);

        product.setProductName("seasonal-change");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/time/time5.webp");
        productDao.addProduct(product);
    }

    public void addMoment() {
        ProductEntity product = new ProductEntity();
        product.setCategory("Moment");
        product.setDescription("Simple Moment, 2019");
//        product.setPrice(99);
//        product.setUnitStock(1);

        product.setProductName("sewing-shadow");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/moment/moment0.webp");
        productDao.addProduct(product);

        product.setProductName("different-moments");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/moment/moment1.webp");
        productDao.addProduct(product);

        product.setProductName("diagram");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/moment/moment2.webp");
        productDao.addProduct(product);

        product.setProductName("daytime-night");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/moment/moment3.webp");
        productDao.addProduct(product);

        product.setProductName("another-possibility");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/moment/moment4.webp");
        productDao.addProduct(product);
    }

    public void addBoat() {
        ProductEntity product = new ProductEntity();
        product.setCategory("Boat");
        product.setDescription("Village on the water, 2018");
//        product.setPrice(99);
//        product.setUnitStock(1);

        product.setProductName("plan");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/boat/boat0.webp");
        productDao.addProduct(product);

        product.setProductName("boat-is-my-home");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/boat/boat1.webp");
        productDao.addProduct(product);

        product.setProductName("typo");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/boat/boat2.webp");
        productDao.addProduct(product);

        product.setProductName("axon");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/boat/boat3.webp");
        productDao.addProduct(product);

        product.setProductName("cluster");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/boat/boat4.webp");
        productDao.addProduct(product);

        product.setProductName("evening");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/boat/boat5.webp");
        productDao.addProduct(product);
    }

    public void addDailyLife() {
        ProductEntity product = new ProductEntity();
        product.setCategory("Daily-Life");
        product.setDescription("My daily life - exciting moments, 2021");
//        product.setPrice(99);
//        product.setUnitStock(1);

        product.setProductName("kitty");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/photo/photo0.webp");
        productDao.addProduct(product);

        product.setProductName("mount");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/photo/photo1.webp");
        productDao.addProduct(product);

        product.setProductName("twilight");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/photo/photo2.webp");
        productDao.addProduct(product);

        product.setProductName("girl");
        product.setProductId("LIN_" + utils.generatePublicId(10));
        product.setImageUrl("/resources/photo/photo3.webp");
        productDao.addProduct(product);
    }
}
