package onlineDrawingShop.log;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;

@Component
public class PaymentAction {

    @Autowired
    private Logger logger;

    public void pay(BigDecimal payValue) {
        logger.log("Pay begin, payValue is " + payValue);
        logger.log("Pay end");
    }
}

