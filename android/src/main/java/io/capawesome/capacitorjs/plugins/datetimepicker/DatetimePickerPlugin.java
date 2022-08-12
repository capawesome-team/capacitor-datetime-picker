package io.capawesome.capacitorjs.plugins.datetimepicker;

import android.util.Log;
import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import java.util.Date;

@CapacitorPlugin(name = "DatetimePicker")
public class DatetimePickerPlugin extends Plugin {

    public static final String TAG = "DatetimePickerPlugin";

    public static final String ERROR_MODE_INVALID = "The provided mode is invalid.";

    private DatetimePicker implementation;

    public void load() {
        DatetimePickerConfig config = getDatetimePickerConfig();
        implementation = new DatetimePicker(this, config);
    }

    @PluginMethod
    public void present(PluginCall call) {
        try {
            String format = call.getString("format", "yyyy-MM-dd'T'HH:mm:ss.sss'Z'");
            String max = call.getString("max");
            String min = call.getString("min");
            String mode = call.getString("mode", "datetime");
            String theme = call.getString("theme");
            String value = call.getString("value");
            String cancelButtonText = call.getString("cancelButtonText", "Cancel");
            String doneButtonText = call.getString("doneButtonText", "Ok");

            Date date = new Date();
            if (value != null) {
                date = DatetimePickerHelper.convertStringToDate(format, value);
            }
            Date minDate = null;
            if (min != null) {
                minDate = DatetimePickerHelper.convertStringToDate(format, min);
            }
            Date maxDate = null;
            if (max != null) {
                maxDate = DatetimePickerHelper.convertStringToDate(format, max);
            }
            PresentResultCallback resultCallback = new PresentResultCallback() {
                @Override
                public void success(Date date) {
                    String value = DatetimePickerHelper.convertDateToString(format, date);
                    JSObject result = new JSObject();
                    result.put("value", value);
                    call.resolve(result);
                }

                @Override
                public void cancel() {
                    JSObject result = new JSObject();
                    result.put("value", null);
                    call.resolve(result);
                }
            };

            if (mode.equals("datetime")) {
                implementation.presentDateTimePicker(date, minDate, maxDate, cancelButtonText, doneButtonText, theme, resultCallback);
            } else if (mode.equals("date")) {
                implementation.presentDatePicker(date, minDate, maxDate, cancelButtonText, doneButtonText, theme, resultCallback);
            } else if (mode.equals("time")) {
                implementation.presentTimePicker(date, cancelButtonText, doneButtonText, theme, resultCallback);
            } else {
                call.reject(ERROR_MODE_INVALID);
            }
        } catch (Exception ex) {
            String message = ex.getLocalizedMessage();
            Log.e(TAG, message);
            call.reject(message);
        }
    }

    private DatetimePickerConfig getDatetimePickerConfig() {
        DatetimePickerConfig config = new DatetimePickerConfig();

        String theme = getConfig().getString("theme");
        config.setTheme(theme, config.getTheme());

        return config;
    }
}
