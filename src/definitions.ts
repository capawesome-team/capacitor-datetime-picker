/// <reference types="@capacitor/cli" />

declare module '@capacitor/cli' {
  export interface PluginsConfig {
    /**
     * These configuration values are available:
     */
    DatetimePicker?: {
      /**
       * Choose the theme that the datetime picker should have.
       * With `auto` the system theme is used.
       *
       * Only available for Android and iOS.
       *
       * @default 'auto'
       * @since 0.0.1
       */
      theme?: 'auto' | 'light' | 'dark';
    };
  }
}

export interface DatetimePickerPlugin {
  /**
   * Open the datetime picker.
   *
   * Only available for Android and iOS.
   *
   * @since 0.0.1
   */
  present(options?: PresentOptions): Promise<PresentResult>;
}

export interface PresentOptions {
  /**
   * The cancel button text.
   *
   * @default 'Cancel'
   * @since 0.0.1
   */
  cancelButtonText?: string;
  /**
   * The done button text.
   *
   * @default 'Ok'
   * @since 0.0.1
   */
  doneButtonText?: string;
  /**
   * The format in which values are received and returned.
   *
   * @default 'yyyy-MM-dd'T'HH:mm:ss.sss'Z''
   *
   * @since 0.0.1
   */
  format?: string;
  /**
   * The latest date and time to accept.
   * The format of this value must match the value of the `format` parameter.
   * This value must specify a date string later than or equal to the one specified by the `min` attribute.
   *
   * @since 0.0.1
   */
  max?: string;
  /**
   * The earliest date and time to accept.
   * The format of this value must match the value of the `format` parameter.
   * This value must specify a date string earlier than or equal to the one specified by the `max` attribute.
   *
   * @since 0.0.1
   */
  min?: string;
  /**
   * Whether you want a date or time or datetime picker.
   *
   * @since 0.0.1
   *
   * @default 'datetime'
   */
  mode?: 'date' | 'time' | 'datetime';
  /**
   * Choose the theme that the datetime picker should have.
   * With `auto` the system theme is used.
   * This value overwrites the configuration.
   *
   * Only available for Android and iOS.
   *
   * @since 0.0.1
   */
  theme?: 'auto' | 'light' | 'dark';
  /**
   * The predefined value when opening the picker.
   * The format of this value must match the value of the `format` parameter.
   *
   * @since 0.0.1
   */
  value?: string;
}

export interface PresentResult {
  /**
   * The value entered by the user.
   * The value is not provided if the input was canceled.
   * The format of this value matches the value of the `format` parameter.
   *
   * @since 0.0.1
   */
  value?: string;
}
