package common;
import java.math.BigInteger;
import java.security.MessageDigest;
public class Sha1 {
    public static String toSHA1(String password){
        try {
            MessageDigest crypt = MessageDigest.getInstance("SHA-1");
            crypt.reset();
            crypt.update(password.getBytes("UTF-8"));
            return new BigInteger(1, crypt.digest()).toString(16);
        } catch (Exception e) {
            return null;
        }
    }
}
