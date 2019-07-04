package Model.Library;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class UTCDate {
    private static final SimpleDateFormat LOCAL = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
    private static final SimpleDateFormat UTC = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");

    public static Date getUTCDate(){
        Date date = new Date();
        UTC.setTimeZone(TimeZone.getTimeZone("UTC"));
        try {
            return LOCAL.parse(UTC.format(date));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}
