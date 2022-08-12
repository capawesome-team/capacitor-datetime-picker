package io.capawesome.capacitorjs.plugins.datetimepicker;

import androidx.annotation.Nullable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DatetimePickerHelper {

    public static Date convertStringToDate(String format, String value) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat(format);
        return dateFormat.parse(value);
    }

    public static String convertDateToString(String format, Date date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat(format);
        return dateFormat.format(date);
    }

    @Nullable
    public static Theme convertStringToTheme(@Nullable String value) {
        if (value == null) {
            return null;
        }
        switch (value) {
            case "light":
                return Theme.LIGHT;
            case "dark":
                return Theme.DARK;
            case "auto":
                return Theme.AUTO;
            default:
                return null;
        }
    }
}
