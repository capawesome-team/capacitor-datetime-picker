package io.capawesome.capacitorjs.plugins.datetimepicker;

import java.util.Date;

public interface PresentResultCallback {
    void success(Date date);
    void cancel();
}
