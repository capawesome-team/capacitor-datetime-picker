import Foundation

@objc public class DatetimePicker: NSObject {
    private let plugin: DatetimePickerPlugin
    private let config: DatetimePickerConfig

    private let waitForKeyboardCloseSeconds = 0.05

    init(plugin: DatetimePickerPlugin, config: DatetimePickerConfig) {
        self.plugin = plugin
        self.config = config
    }

    @objc public func presentDatetimePicker(date: Date, minDate: Date?, maxDate: Date?, cancelButtonText: String, doneButtonText: String, theme: String?, completion: @escaping (Date?) -> Void) {
        closeKeyboard()
        DispatchQueue.main.asyncAfter(deadline: .now() + waitForKeyboardCloseSeconds) {
            RPicker.selectDate(title: "", cancelText: cancelButtonText, doneText: doneButtonText, datePickerMode: .dateAndTime, selectedDate: date,
                               minDate: minDate, maxDate: maxDate, theme: self.getTheme(unconvertedTheme: theme), completion: { (date) in
                                completion(date)
                               })
        }
    }

    @objc public func presentDatePicker(date: Date, minDate: Date?, maxDate: Date?, cancelButtonText: String, doneButtonText: String, theme: String?, completion: @escaping (Date?) -> Void) {
        closeKeyboard()
        DispatchQueue.main.asyncAfter(deadline: .now() + waitForKeyboardCloseSeconds) {
            RPicker.selectDate(title: "", cancelText: cancelButtonText, doneText: doneButtonText,
                               datePickerMode: .date, selectedDate: date, minDate: minDate, maxDate: maxDate, theme: self.getTheme(unconvertedTheme: theme), completion: { (date) in
                                completion(date)
                               })
        }
    }

    @objc public func presentTimePicker(date: Date, cancelButtonText: String, doneButtonText: String, theme: String?, completion: @escaping (Date?) -> Void) {
        closeKeyboard()
        DispatchQueue.main.asyncAfter(deadline: .now() + waitForKeyboardCloseSeconds) {
            RPicker.selectDate(title: "", cancelText: cancelButtonText, doneText: doneButtonText,
                               datePickerMode: .time, selectedDate: date, theme: self.getTheme(unconvertedTheme: theme), completion: { (date) in
                                completion(date)
                               })
        }
    }

    private func closeKeyboard() {
        DispatchQueue.main.async {
            self.plugin.bridge?.viewController?.view.endEditing(true)
        }
    }

    private func getTheme(unconvertedTheme: String?) -> Theme {
        var overrideConfig: Theme?
        if let unconvertedTheme = unconvertedTheme {
            overrideConfig = DatetimePickerHelper.convertStringToTheme(unconvertedTheme)
        }
        var theme = self.config.theme
        if let overrideConfig = overrideConfig {
            theme = overrideConfig
        }
        return theme
    }
}
