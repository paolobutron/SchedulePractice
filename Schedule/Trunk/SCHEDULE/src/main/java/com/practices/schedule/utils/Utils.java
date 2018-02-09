
package com.practices.schedule.utils;

import java.math.BigInteger;
import java.util.Date;

/**
 *
 * @author pbutron
 */
public class Utils {
    
    public static String generateUniqueId() {
        String code;
        Date date = new Date();
        Long timestamp = date.getTime();
        code = timestamp.toString() + Counter.getInstance().getCounter();
        BigInteger bigInt = new BigInteger(code);
        long n = bigInt.longValue();
        String hex = Long.toHexString(n);
        return hex;
    }

}
