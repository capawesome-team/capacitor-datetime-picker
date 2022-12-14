<p align="center"><br><img src="https://avatars.githubusercontent.com/u/105555861" width="128" height="128" /></p>
<h3 align="center">Datetime Picker</h3>
<p align="center"><strong><code>@capawesome-team/capacitor-datetime-picker</code></strong></p>
<p align="center">
  Capacitor plugin that let the user easily enter both a date and a time. 
</p>

<p align="center">
  <img src="https://img.shields.io/maintenance/yes/2023?style=flat-square" />
  <!-- <a href="https://github.com/capawesome-team/capacitor-datetime-picker/actions?query=workflow%3A%22CI%22"><img src="https://img.shields.io/github/workflow/status/capawesome-team/capacitor-datetime-picker/CI/main?style=flat-square" /></a> -->
  <a href="https://github.com/capawesome-team/capacitor-datetime-picker"><img src="https://img.shields.io/github/license/capawesome-team/capacitor-datetime-picker?style=flat-square" /></a>
<!-- <br> -->
  <!-- <a href="https://www.npmjs.com/package/@capawesome-team/capacitor-datetime-picker"><img src="https://img.shields.io/npm/dw/@capawesome-team/capacitor-datetime-picker?style=flat-square" /></a> -->
  <!-- <a href="https://www.npmjs.com/package/@capawesome-team/capacitor-datetime-picker"><img src="https://img.shields.io/npm/v/@capawesome-team/capacitor-datetime-picker?style=flat-square" /></a> -->
  <a href="https://github.com/capawesome-team"><img src="https://img.shields.io/badge/part%20of-capawesome-%234f46e5?style=flat-square" /></a>
</p>

## Maintainers

| Maintainer | GitHub                                    | Social                                        |
| ---------- | ----------------------------------------- | --------------------------------------------- |
| Robin Genz | [robingenz](https://github.com/robingenz) | [@robin_genz](https://twitter.com/robin_genz) |

## Sponsorware

This project is available as **Sponsorware**.

> Sponsorware is a release strategy for open-source software that enables developers to be compensated for their open-source work with fewer downsides than traditional open-source funding models. ([Source](https://github.com/sponsorware/docs))

This means...

- The source code will be published as soon as [our GitHub Sponsors goal](https://github.com/sponsors/capawesome-team) is reached.
- Any GitHub sponsor with a [sponsorware tier](https://github.com/sponsors/capawesome-team?frequency=recurring) gets **immediate access** to our sponsors-only repository and can start using the project right away.

## Terms

This project is licensed under the terms of the MIT license.  
However, we kindly ask you to respect our **fair use policy**:

- Please **don't distribute the source code** of the sponsors-only repository. You may freely use it for public, private or commercial projects, privately fork or mirror it, but please don't make the source code public, as it would counteract the sponsorware strategy.
- If you cancel your subscription, you're automatically removed as a collaborator and will miss out on all future updates. However, **you may use the latest version that's available to you as long as you like**.

## Demo

A working example can be found here: [robingenz/capacitor-plugin-demo](https://github.com/robingenz/capacitor-plugin-demo)

| Android                                                                                                                         | iOS                                                                                                                             |
| ------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| <img src="https://user-images.githubusercontent.com/13857929/184545710-a837f45f-e335-4903-b3a9-e1f30b42163f.gif" width="324" /> | <img src="https://user-images.githubusercontent.com/13857929/184545717-a10291e4-95fe-4453-91f7-c04246c61dec.gif" width="266" /> |

## FAQ

1. **Which platforms are supported?**  
   This plugin supports Android and iOS.
1. **Which Capacitor versions are supported?**  
   There is a version for Capacitor 3 and Capacitor 4. However, new updates are only ever provided for the latest Capacitor major version (currently Capacitor 4).
1. **What do I do when I have a feature request?**  
   Please submit your feature request [here](https://github.com/capawesome-team/capacitor-datetime-picker/issues/new/choose). We will then review it and possibly put it on our roadmap.
1. **What do I do when I have found a bug?**  
   Bug reports have top priority. Please submit your bug report [here](https://github.com/capawesome-team/capacitor-datetime-picker/issues/new/choose). We will take a look at it as soon as possible.

## Installation

As long as the project is available as [Sponsorware](#sponsorware), the project will be distributed via GitHub packages.

1. Log in to GitHub package registry ([GitHub Docs](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-npm-registry#authenticating-to-github-packages)):

   ```
   $ npm login --scope=@capawesome-team --registry=https://npm.pkg.github.com

   > Username: USERNAME
   > Password: TOKEN
   > Email: PUBLIC-EMAIL-ADDRESS
   ```

1. In the same directory as your `package.json` file, create or edit an `.npmrc` file to include the following line ([GitHub Docs](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-npm-registry#installing-a-package)):
   ```
   @capawesome-team:registry=https://npm.pkg.github.com
   ```
1. Install the package with **Capacitor 3**:

   ```bash
   npm install @capawesome-team/capacitor-datetime-picker@0.0.2
   npx cap sync
   ```

   Install the package with **Capacitor 4**:

   ```bash
   npm install @capawesome-team/capacitor-datetime-picker
   npx cap sync
   ```

   ???? If you have any problems please [contact us by mail](mailto:support@capawesome.io) or [create a GitHub discussion](https://docs.github.com/en/discussions/quickstart#creating-a-new-discussion) in this repository.  
   ?????? **Attention**: Be careful not to disclose your npm auth token! If you have any questions (CI configuration etc.) please let us know.

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
