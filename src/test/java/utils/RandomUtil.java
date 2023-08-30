package utils;

import net.datafaker.Faker;

public class RandomUtil {
    public static String getNumericString(int length) {
        return new Faker().number().digits(length);
    }
}
