import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(DatetimePickerPlugin)
public class DatetimePickerPlugin: CAPPlugin {
    public let errorModeInvalid = "The provided mode is invalid."

    private var implementation: DatetimePicker?

    override public func load() {
        let config = getDatetimePickerConfig()
        implementation = DatetimePicker(plugin: self, config: config)
    }

    @objc func present(_ call: CAPPluginCall) {
        let format = call.getString("format") ?? "yyyy-MM-dd'T'HH:mm:ss.sss'Z'"
        let max = call.getString("max")
        let min = call.getString("min")
        let mode = call.getString("mode", "datetime")
        let theme = call.getString("theme")
        let value = call.getString("value")
        let cancelButtonText = call.getString("cancelButtonText", "Cancel")
        let doneButtonText = call.getString("doneButtonText", "Ok")

        var date: Date = Date()
        if let value = value {
            date = DatetimePickerHelper.convertStringToDate(format, value) ?? Date()
        }
        var minDate: Date?
        if let min = min {
            minDate = DatetimePickerHelper.convertStringToDate(format, min)
        }
        var maxDate: Date?
        if let max = max {
            maxDate = DatetimePickerHelper.convertStringToDate(format, max)
        }

        let completion: (Date?) -> Void = { date in
            var value: String?
            if let date = date {
                value = DatetimePickerHelper.convertDateToString(format, date)
            }
            var result = JSObject()
            result["value"] = value
            call.resolve(result)
        }

        if mode == "datetime" {
            implementation?.presentDatetimePicker(date: date, minDate: minDate, maxDate: maxDate,
                                                  cancelButtonText: cancelButtonText, doneButtonText: doneButtonText, theme: theme, completion: completion)
        } else if mode == "date" {
            implementation?.presentDatePicker(date: date, minDate: minDate, maxDate: maxDate,
                                              cancelButtonText: cancelButtonText, doneButtonText: doneButtonText, theme: theme, completion: completion)
        } else if mode == "time" {
            implementation?.presentTimePicker(date: date, cancelButtonText: cancelButtonText, doneButtonText: doneButtonText, theme: theme, completion: completion)
        } else {
            call.reject(errorModeInvalid)
        }
    }

    private func getDatetimePickerConfig() -> DatetimePickerConfig {
        var config = DatetimePickerConfig()

        if let theme = getConfigValue("theme") as? String {
            if let convertedTheme = DatetimePickerHelper.convertStringToTheme(theme) {
                config.theme = convertedTheme
            }
        }

        return config
    }
}
