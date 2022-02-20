package onlineDrawingShop.shared;

import org.springframework.stereotype.Service;

import java.security.SecureRandom;
import java.util.Random;

@Service
public class Utils {

    private final Random rand = new SecureRandom();
    private final String alphabet = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

    public String generatePublicId(int length) {
        return generateRandomString(length);
    }

    public String generateRandomString(int length) {
        StringBuilder returnValue = new StringBuilder();
        for (int i = 0; i < length; i++) {
            returnValue.append(alphabet.charAt(rand.nextInt(alphabet.length())));
        }
        return returnValue.toString();
    }
}
