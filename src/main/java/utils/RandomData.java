package utils;

import java.text.ParseException;
import java.util.Date;

public interface RandomData {
    String getName(int nameLength);
    String getRandomName();
    String crateCode(int codeLength);
    String getSex();
    String getTelNum();
    String getTime(String startTime) throws ParseException;
    String getExactTime(String startTime, String endTime) throws ParseException;
    String getEmail();
    String getAddress();
}
