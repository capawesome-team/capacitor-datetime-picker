<p align="center"><br><img src="https://avatars.githubusercontent.com/u/105555861" width="128" height="128" /></p>
<h3 align="center">Datetime Picker</h3>
<p align="center"><strong><code>@capawesome-team/capacitor-datetime-picker</code></strong></p>
<p align="center">
  Capacitor plugin that let the user easily enter both a date and a time. 
</p>

<p align="center">
  <img src="https://img.shields.io/maintenance/yes/2023?style=flat-square" />
  <a href="https://github.com/capawesome-team/capacitor-datetime-picker/actions?query=workflow%3A%22CI%22"><img src="https://img.shields.io/github/actions/workflow/status/capawesome-team/capacitor-datetime-picker/ci.yml?branch=main&style=flat-square" /></a>
  <a href="https://github.com/capawesome-team/capacitor-datetime-picker"><img src="https://img.shields.io/github/license/capawesome-team/capacitor-datetime-picker?style=flat-square" /></a>
<br>
  <a href="https://www.npmjs.com/package/@capawesome-team/capacitor-datetime-picker"><img src="https://img.shields.io/npm/dw/@capawesome-team/capacitor-datetime-picker?style=flat-square" /></a>
  <a href="https://www.npmjs.com/package/@capawesome-team/capacitor-datetime-picker"><img src="https://img.shields.io/npm/v/@capawesome-team/capacitor-datetime-picker?style=flat-square" /></a>
  <a href="https://github.com/capawesome-team"><img src="https://img.shields.io/badge/part%20of-capawesome-%234f46e5?style=flat-square" /></a>
</p>

## Maintainers

| Maintainer | GitHub                                    | Social                                        |
| ---------- | ----------------------------------------- | --------------------------------------------- |
| Robin Genz | [robingenz](https://github.com/robingenz) | [@robin_genz](https://twitter.com/robin_genz) |

## Demo

A working example can be found here: [robingenz/capacitor-plugin-demo](https://github.com/robingenz/capacitor-plugin-demo)

| Android                                                                                                                         | iOS                                                                                                                             |
| ------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| <img src="https://user-images.githubusercontent.com/13857929/184545710-a837f45f-e335-4903-b3a9-e1f30b42163f.gif" width="324" /> | <img src="https://user-images.githubusercontent.com/13857929/184545717-a10291e4-95fe-4453-91f7-c04246c61dec.gif" width="266" /> |

## Installation

If you are an [Insider](https://capawesome.io/insiders/#what-is-insiders), see [Getting started with Insiders](https://capawesome.io/insiders/getting-started/?plugin=capacitor-datetime-picker) and follow the instructions to install the plugin.

If you are **not** an Insider, please install the package from the public npm registry:

```bash
npm install @capawesome-team/capacitor-datetime-picker
npx cap sync
```

## Configuration

No configuration required for this plugin.

## Usage

```typescript
import { DatetimePicker } from '@capawesome-team/capacitor-datetime-picker';

const present = async () => {
  const date = new Date('1995-12-24T02:23:00');

  const { value } = DatetimePicker.present({
    cancelButtonText: 'Cancel',
    doneButtonText: 'Ok',
    mode: 'time',
    value: date.toISOString(),
    theme: 'dark',
    locale: 'en-US',
  });

  return value;
};
```

## API

<docgen-index>

* [`present(...)`](#present)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### present(...)

```typescript
present(options?: PresentOptions | undefined) => Promise<PresentResult>
```

Open the datetime picker.

An error is thrown if the input is canceled or dismissed by the user.

Only available for Android and iOS.

| Param         | Type                                                      |
| ------------- | --------------------------------------------------------- |
| **`options`** | <code><a href="#presentoptions">PresentOptions</a></code> |

**Returns:** <code>Promise&lt;<a href="#presentresult">PresentResult</a>&gt;</code>

**Since:** 0.0.1

--------------------


### Interfaces


#### PresentResult

| Prop        | Type                | Description                                                                                          | Since |
| ----------- | ------------------- | ---------------------------------------------------------------------------------------------------- | ----- |
| **`value`** | <code>string</code> | The value entered by the user. The format of this value matches the value of the `format` parameter. | 0.0.1 |


#### PresentOptions

| Prop                   | Type                                        | Description                                                                                                                                                                                                             | Default                                     | Since |
| ---------------------- | ------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------- | ----- |
| **`cancelButtonText`** | <code>string</code>                         | The cancel button text.                                                                                                                                                                                                 | <code>'Cancel'</code>                       | 0.0.1 |
| **`doneButtonText`**   | <code>string</code>                         | The done button text.                                                                                                                                                                                                   | <code>'Ok'</code>                           | 0.0.1 |
| **`format`**           | <code>string</code>                         | The format in which values are received and returned.                                                                                                                                                                   | <code>'yyyy-MM-dd'T'HH:mm:ss.sss'Z''</code> | 0.0.1 |
| **`locale`**           | <code>string</code>                         | BCP 47 language tag to define the language of the UI.                                                                                                                                                                   |                                             | 0.0.2 |
| **`max`**              | <code>string</code>                         | The latest date and time to accept. The format of this value must match the value of the `format` parameter. This value must specify a date string later than or equal to the one specified by the `min` attribute.     |                                             | 0.0.1 |
| **`min`**              | <code>string</code>                         | The earliest date and time to accept. The format of this value must match the value of the `format` parameter. This value must specify a date string earlier than or equal to the one specified by the `max` attribute. |                                             | 0.0.1 |
| **`mode`**             | <code>'date' \| 'time' \| 'datetime'</code> | Whether you want a date or time or datetime picker.                                                                                                                                                                     | <code>'datetime'</code>                     | 0.0.1 |
| **`theme`**            | <code>'auto' \| 'light' \| 'dark'</code>    | Choose the theme that the datetime picker should have. With `auto` the system theme is used. This value overwrites the `theme` configuration value. Only available for Android and iOS.                                 |                                             | 0.0.1 |
| **`value`**            | <code>string</code>                         | The predefined value when opening the picker. The format of this value must match the value of the `format` parameter.                                                                                                  |                                             | 0.0.1 |

</docgen-api>

## Credits

The iOS implementation of this plugin is based on [RPicker](https://github.com/rheyansh/RPicker) which is licensed under [MIT](https://github.com/rheyansh/RPicker/blob/master/LICENSE).

## Changelog

See [CHANGELOG.md](https://github.com/capawesome-team/capacitor-datetime-picker/blob/main/CHANGELOG.md).

## License

See [LICENSE](https://github.com/capawesome-team/capacitor-datetime-picker/blob/main/LICENSE).
