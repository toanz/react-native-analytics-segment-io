[![npm](https://img.shields.io/npm/v/react-native-analytics-segment-io.svg)](https://www.npmjs.com/package/react-native-analytics-segment-io)
[![travis](https://img.shields.io/travis/leoilab/react-native-analytics-segment-io/master.svg)](https://travis-ci.org/leoilab/react-native-analytics-segment-io)

# A React Native wrapper for Segment Analytics

- [Installation](#installation)
  * [iOS](#ios)
  * [Android](#android)
- [Usage](#usage)
- [Example](#example)
- [License](#license)


# Installation

```
yarn add react-native-analytics-segment-io
```
```
react-native link react-native-analytics-segment-io
```

## iOS
Add `Analytics` framework to your Podfile.

```
pod 'Analytics'
```

### Device-based integration components

To add an [integration](https://segment.com/docs/sources/mobile/ios/#migrating-to-v3) with a Device-based Connection Mode, you must manually add that integration’s dependencies to the Podfile.

```
pod 'Segment-Mixpanel'
pod 'Segment-GoogleAnalytics'
```

The wrapper will automatically register the added components in the configuration when the SDK is initialized.

Supported integrations:

| Component           | Podfile                             |
|---------------------|-------------------------------------|
| [Taplytics](https://github.com/segment-integrations/analytics-ios-integration-taplytics)           | `pod 'Segment-Taplytics'`           |
| [Adjust](https://github.com/segment-integrations/analytics-ios-integration-adjust)              | `pod 'Segment-Adjust'`              |
| [Google Analytics](https://github.com/segment-integrations/analytics-ios-integration-google-analytics)    | `pod 'Segment-GoogleAnalytics'`     |
| [ComScore](https://github.com/segment-integrations/analytics-ios-integration-comscore)            | `pod 'Segment-ComScore'`            |
| [Amplitude](https://github.com/segment-integrations/analytics-ios-integration-amplitude)           | `pod 'Segment-Amplitude'`           |
| [Facebook App Events](https://github.com/segment-integrations/analytics-ios-integration-facebook-app-events) | `pod 'Segment-Facebook-App-Events'` |
| [Mixpanel](https://github.com/segment-integrations/analytics-ios-integration-mixpanel)            | `pod 'Segment-Mixpanel'`            |
| [Localytics](https://github.com/segment-integrations/analytics-ios-integration-localytics)          | `pod 'Segment-Localytics'`          |
| [Flurry](https://github.com/segment-integrations/analytics-ios-integration-flurry)              | `pod 'Segment-Flurry'`              |
| [Quantcast](https://github.com/segment-integrations/analytics-ios-integration-quantcast)           | `pod 'Segment-Quantcast'`           |
| [Crittercism](https://github.com/segment-integrations/analytics-ios-integration-crittercism)         | `pod 'Segment-Crittercism'`         |
| [Firebase](https://github.com/segment-integrations/analytics-ios-integration-firebase)            | `pod 'Segment-Firebase'`            |
| [AppsFlyer](https://github.com/AppsFlyerSDK/segment-appsflyer-ios)            | `pod 'segment-appsflyer-ios'`            |
| [Branch](https://github.com/BranchMetrics/Segment-Branch-iOS)            | `pod 'Segment-Branch'`            |
| [Braze (formerly Appboy)](https://github.com/Appboy/appboy-segment-ios)            | `pod 'Segment-Appboy'`            |
| [Intercom](https://github.com/segment-integrations/analytics-ios-integration-intercom) | `pod 'Segment-Intercom'` |

### Ensure build order

To be absolutely certain that your integrations will be correctly handled by the `react-native-analytics-segment-io` module, you have to make sure that the `Pods` target is built before the `RNAnalyticsSegmentIO` one.

1. Open your project workspace `<name_of_your_app>.xcworkspace` located in the `ios/` folder.

:warning: we want to open the `.xcworkspace` file and **NOT** the `.xcodeproj`.

2. Open the `Edit Scheme…` pane of your own app target main scheme.

![Edit scheme](./docs/edit-scheme.png)

3. Select `Build` in the phase list on the left.

![Build list](./docs/build-list.png)

4. Make sure that the `Parallelize build` option is unchecked.

![Parallelize build](./docs/parallelize-build.png)

5. If the `Pods-<name_of_your_app>` target is not present in the list click the `+` button and select it in the list under the `Pods` project.

![Pods target selection](./docs/pods-selection.png)

6. If the `RNAnalyticsSegmentIO` target is not present in the list click the `+` button and select it in the list under the `RNAnalyticsSegmentIO` project.

![Module target selection](./docs/module-selection.png)

7. Re-arrange the `Targets` list by dragging targets around to make sure that:
- Both `Pods-<name_of_your_app>` and `RNAnalyticsSegmentIO` are placed **after** the `React` target and **before** the `<name_of_your_app>` target.
- The `RNAnalyticsSegmentIO` target is placed **after** the `Pods-<name_of_your_app>` one.

![Build order](./docs/build-order.png)

*Note: This setup is particularly relevant if your Podfile contains* `use_frameworks!`

## Android

Run `react-native link react-native-analytics-segment-io` to add the necessary lines to the build files. Alternatively, you can do this manually with the 2 following steps:

1. Add a reference to the project in `settings.gradle`:
```gradle
include ':react-native-analytics-segment-io'
project(':react-native-analytics-segment-io').projectDir = new File(rootProject.projectDir, '../node_modules/react-native-analytics-segment-io/android')
```

2. Add the dependency to the app's `build.gradle` file:
```gradle
compile project(':react-native-analytics-segment-io')
```

When the build files are set up to include the library, add a dependency to the Segment SDK in the app's `build.gradle` file:
```gradle
compile 'com.segment.analytics.android:analytics:x.x.x' // We have tested with version 4.2.6
```

Then sync Gradle, and add the analytics package to your `Application` class:
```java
import com.leo_pharma.analytics.AnalyticsPackage;
...
@Override
protected List<ReactPackage> getPackages() {
  return Arrays.<ReactPackage>asList(
      new MainReactPackage(),
      new AnalyticsPackage()
  );
}
```

Your project is now ready to start calling functions on react-native-analytics-segment-io.

### Why you need to add the Segment SDK manually

The Segment SDK is added to the library as a `provided` dependency, meaning that it is not included in the final build. That is why it is necessary to include the Segment SDK in the app's `build.gradle` file. This makes it easy to update the Segment SDK from the app, and it makes the app's build configuration the source of truth when it comes to Segment.

### Minimum React Native version

It is required to use React Native v0.46.4 or higher. This is because we use a feature in Java on the passed maps (`.toHashMap()`) that is introduced in that version.

### Device-based integration components

To add an [integration](https://segment.com/docs/sources/mobile/android/#migrating-to-v4) with a Device-based destination, you have to manually add that integration as a dependency to the app's `build.gradle` file.

For example:

```gradle
compile 'com.segment.analytics.android.integrations:firebase:1.1.0'
compile 'com.segment.analytics.android.integrations:mixpanel:1.1.0'
```

The wrapper will automatically register the added components in the configuration when the SDK is present.

Supported integrations:

| Component           | Dependency           |
|---------------------|----------------------|
| [Braze (formerly Appboy)](https://github.com/Appboy/appboy-segment-android) | `com.appboy:appboy-segment-integration:2.1.1` |
| [AppsFlyer](https://github.com/AppsFlyerSDK/AppsFlyer-Segment-Integration) | `com.appsflyer:segment-android-integration:1.9` |
| [Adjust](https://github.com/segment-integrations/analytics-android-integration-adjust) | `com.segment.analytics.android.integrations:adjust:0.3.1` |
| [Amplitude](https://github.com/segment-integrations/analytics-android-integration-amplitude) | `com.segment.analytics.android.integrations:amplitude:1.2.1` |
| [Bugsnag](https://github.com/segment-integrations/analytics-android-integration-bugsnag) | `com.segment.analytics.android.integrations:bugsnag:1.0.0` |
| [ComScore](https://github.com/segment-integrations/analytics-android-integration-comscore) | `com.segment.analytics.android.integrations:comscore:3.0.0` |
| [Countly](https://github.com/segment-integrations/analytics-android-integration-countly) | `com.segment.analytics.android.integrations:countly:1.0.0` |
| [Crittercism](https://github.com/segment-integrations/analytics-android-integration-crittercism) | `com.segment.analytics.android.integrations:crittercism:1.0.0` |
| [Firebase](https://github.com/segment-integrations/analytics-android-integration-firebase) | `com.segment.analytics.android.integrations:firebase:1.1.0` |
| [Flurry](https://github.com/segment-integrations/analytics-android-integration-flurry) | `com.segment.analytics.android.integrations:flurry:3.0.0` |
| [Google Analytics](https://github.com/segment-integrations/analytics-android-integration-google-analytics) | `com.segment.analytics.android.integrations:google-analytics:2.0.0` |
| [Intercom](https://github.com/segment-integrations/analytics-android-integration-intercom) | `com.segment.analytics.android.integrations:intercom:1.1.0-beta` |
| [Localytics](https://github.com/segment-integrations/analytics-android-integration-localytics) | `com.segment.analytics.android.integrations:Localytics` |
| [Mixpanel](https://github.com/segment-integrations/analytics-android-integration-mixpanel) | `com.segment.analytics.android.integrations:mixpanel:1.1.0` |
| [NielsenDCR](https://github.com/segment-integrations/analytics-android-integration-nielsendcr) | `com.segment.analytics.android.integrations:nielsendcr:1.0.0-Beta` |
| [Quantcast](https://github.com/segment-integrations/analytics-android-integration-quantcast) | `com.segment.analytics.android.integrations:quantcast:1.0.1` |
| [Tapstream](https://github.com/segment-integrations/analytics-android-integration-tapstream) | `com.segment.analytics.android.integrations:tapstream:1.0.0` |
| [Branch](https://github.com/BranchMetrics/Segment-Branch-Android) | `io.branch.segment.analytics.android.integrations:branch:1.0.2-RELEASE` |

### Extra repositories

Some integrations require you to add an extra Maven repository to your app's `build.gradle` file.
These are all of those dependencies with their repository:

```gradle
repositories {
  ...
  maven { url "http://appboy.github.io/appboy-android-sdk/sdk" } // Required for Braze (formerly Appboy)
  maven { url 'https://comscore.bintray.com/Analytics' } // Required for Comscore
  maven { url 'http://dl.bintray.com/countly/maven' } // Required for Countly
  maven { url 'https://maven.google.com' } // Required for Firebase
  maven { url 'http://maven.localytics.com/public' } // Required for Localytics
}
```

# Usage

```js
import Analytics, { AnalyticsConstants } from 'react-native-analytics-segment-io'
```

- [Analytics.setup(key, options)](#setup-function-key-options--)
- [Analytics.identify(userId, traits)](#identify-function-userid-traits--)
- [Analytics.track(event, properties)](#track-function-event-properties--)
- [Analytics.screen(name, properties)](#screen-function-name-properties--)
- [Analytics.group(groupId, traits)](#group-function-groupid-traits--)
- [Analytics.alias(newId)](#alias-function-newid)
- [Analytics.reset()](#reset-function-)
- [Analytics.flush()](#flush-function-)
- [Analytics.enable()](#enable-function-)
- [Analytics.disable()](#disable-function-)

## setup: function (key, options = {})
*Initial framework setup*
```js
const options = { option: value, option: value }
Analytics.setup('segment_write_key', options)
```

Where `options` is an object that contains the options mentioned in the table below.
There are constants available for all the options, using `[AnalyticsConstants.optionName]`, e.g. `[AnalyticsConstants.trackApplicationLifecycleEvents]: true`.
If an option is not set in the `options` object, its default value is used (see table below).

*`setup()` returns a promise to indicate whether the initialization was successful or not.*

Supported options:

| Options                         | Type    | Default | iOS | Android | Description                                                                                                                                                                            |
|---------------------------------|---------|---------|-----|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| enableAdvertisingTracking       | Bool    | `true`  | ✓   | ✗       | Whether the analytics client should track advertising info.                                                                                                                           |
| flushAt                         | Integer | `20`    | ✓   | ✓       | The number of queued events that the analytics client should flush at. Setting this to `1` will not queue any events and will use more battery.                                        |
| recordScreenViews               | Bool    | `false` | ✓   | ✓       | Whether the analytics client should automatically make a screen call when a view controller is added to a view hierarchy.                                                              |
| shouldUseBluetooth              | Bool    | `false` | ✓   | ✗       | Whether the analytics client should record bluetooth information.                                                                                                                      |
| shouldUseLocationServices       | Bool    | `false` | ✓   | ✗       | Whether the analytics client should use location services.                                                                                                                             |
| trackApplicationLifecycleEvents | Bool    | `false` | ✓   | ✓       | Whether the analytics client should automatically make a track call for application lifecycle events, such as "Application Installed", "Application Updated" and "Application Opened". |
| trackAttributionData            | Bool    | `false` | ✓   | ✓       | Whether the analytics client should automatically track attribution data from enabled providers using the mobile service.                                                              |
| trackDeepLinks                  | Bool    | `false` | ✓   | ✗       | Whether the analytics client should automatically track deep links.                                                                                                                    |
| debug                           | Bool    | `false` | ✓   | ✓       | Whether the analytics client should log everything to the console (only enable this during development).                                                                               |

## identify: function (userId, traits = {})
*Tie a user to their actions and record traits about them*
```js
Analytics.identify('user_id', { email: 'user_email' })
```

Futher [explanation](https://segment.com/docs/sources/mobile/ios/#identify) can be found on Segments own page.

## track: function (event, properties = {})
*Record the actions your users performs*
```js
Analytics.track('Weapon Bought', { weapon: 'sword' })
```

Futher [explanation](https://segment.com/docs/sources/mobile/ios/#track) can be found on Segments own page.

## screen: function (name, properties = {})
*Record whenever a user sees a screen*
```js
Analytics.screen('Photo Screen', { feed: 'private' })
```
Futher [explanation](https://segment.com/docs/sources/mobile/ios/#screen) can be found on Segments own page.

## group: function (groupId, traits = {})
*Associate an identified user user with a group*
```js
Analytics.group('Group123', {name: 'Bob Group', description: 'Accounting Awesome'})
```

Futher [explanation](https://segment.com/docs/sources/mobile/ios/#group) can be found on Segments own page.

## alias: function (newId)
*Associate one user identity with another*
```js
Analytics.alias('new_id')
```
Futher [explanation](https://segment.com/docs/sources/mobile/ios/#alias) can be found on Segments own page.

## reset: function ()
*Clears the SDK’s internal stores for the current user and group*
```js
Analytics.reset()
```
Futher [explanation](https://segment.com/docs/sources/mobile/ios/#reset) can be found on Segments own page.

## flush: function ()
*Manually flush the queue*
```js
Analytics.flush()
```
Futher [explanation](https://segment.com/docs/sources/mobile/ios/#flushing) can be found on Segments own page.

## enable: function ()
*You may need to offer the ability for users to opt-out of analytics*
```js
Analytics.enable()
```
Futher [explanation](https://segment.com/docs/sources/mobile/ios/#opt-out) can be found on Segments own page.

## disable: function ()
*You may need to offer the ability for users to opt-out of analytics*
```js
Analytics.disable()
```
Futher [explanation](https://segment.com/docs/sources/mobile/ios/#opt-out) can be found on Segments own page.

# Example
To run the iOS example:
```
git clone git@github.com:leoilab/react-native-analytics-segment-io.git
cd react-native-analytics-segment-io
cd example
yarn install
cd ios
pod install
cd ..
react-native run-ios
```

To run the Android example:
```
git clone git@github.com:leoilab/react-native-analytics-segment-io.git
cd react-native-analytics-segment-io
cd example
yarn install
react-native run-android
```

# License

MIT
