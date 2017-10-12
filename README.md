[![npm](https://img.shields.io/npm/v/react-native-analytics-segment-io.svg)](https://www.npmjs.com/package/react-native-analytics-segment-io)
[![travis](https://img.shields.io/travis/leoilab/react-native-analytics-segment-io/master.svg)](https://travis-ci.org/leoilab/react-native-analytics-segment-io)

# A React Native wrapper for Segment Analytics

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


## Android

Run `react-native link react-native-analytics-segment-io` to add the necessary lines to the build files. Alternatively, you can do this manually with the 2 following steps:

1. Add a reference to the project in `settings.gradle`:
```
include ':react-native-analytics-segment-io'
project(':react-native-analytics-segment-io').projectDir = new File(rootProject.projectDir, '../node_modules/react-native-analytics-segment-io/android')
```

2. Add the dependency to the app's `build.gradle` file:
```
compile project(':react-native-analytics-segment-io')
```

When the build files are set up to include the library, add a dependency to the Segment SDK in the app's `build.gradle` file:
```
compile 'com.segment.analytics.android:analytics:x.x.x' // We have tested with version 4.2.6
```

Then sync Gradle, and add the analytics package to your `Application` class:
```
@Override
protected List<ReactPackage> getPackages() {
  return Arrays.<ReactPackage>asList(
      new MainReactPackage(),
      new AnalyticsPackage()
  );
}
```

Your project is now ready to start calling functions on react-native-analytics-segment-io.

### enable() and disable()

The `enable()` and `disable()` methods are not available in the Segment SDK for Android, so they are not included in the Android version of this library.

### Why you need to add the Segment SDK manually

The Segment SDK is added to the library as a `provided` dependency, meaning that it is not included in the final build. That is why it is necessary to include the Segment SDK in the app's `build.gradle` file. This makes it easy to update the Segment SDK from the app, and it makes the app's build configuration the source of truth when it comes to Segment.

### Minimum React Native version

It is required to use React Native v0.46.4 or higher. This is because we use a feature in Java on the passed maps (`.toHashMap()`) that is introduced in that version.

### Device-based integration components

To add an [integration](https://segment.com/docs/sources/mobile/android/#migrating-to-v4) with a Device-based destination, you have to manually add that integration as a dependency to the app's `build.gradle` file.

For example:

```
compile 'com.segment.analytics.android.integrations:firebase:1.1.0'
compile 'com.segment.analytics.android.integrations:mixpanel:1.1.0'
```

The wrapper will automatically register the added components in the configuration when the SDK is present.

Supported integrations:

| Component           | Dependency           |
|---------------------|----------------------|
| [AppsFlyer](https://github.com/AppsFlyerSDK/AppsFlyer-Segment-Integration) | `com.appsflyer:segment-android-integration:1.9` |
| [Adjust](https://github.com/segment-integrations/analytics-android-integration-adjust) | `com.segment.analytics.android.integrations:adjust:0.3.1` |
| [Amplitude](https://github.com/segment-integrations/analytics-android-integration-amplitude) | `com.segment.analytics.android.integrations:amplitude:1.2.1` |
| [Bugsnag](https://github.com/segment-integrations/analytics-android-integration-bugsnag) | `com.segment.analytics.android.integrations:bugsnag:1.0.0` |
| [ComScore](https://github.com/segment-integrations/analytics-android-integration-comscore) | `com.segment.analytics.android.integrations:comscore:3.0.0` |
| [Countly](https://github.com/segment-integrations/analytics-android-integration-countly) | `com.segment.analytics.android.integrations:countly:1.0.0` |
| [Crittercism](https://github.com/segment-integrations/analytics-android-integration-crittercism) | `com.segment.analytics.android.integrations:crittercism:1.0.0` |
| [Firebase](https://github.com/segment-integrations/analytics-android-integration-firebase) | `com.segment.analytics.android.integrations:firebase:1.1.0` |
| [Google Analytics](https://github.com/segment-integrations/analytics-android-integration-google-analytics) | `com.segment.analytics.android.integrations:google-analytics:2.0.0` |
| [Localytics](https://github.com/segment-integrations/analytics-android-integration-localytics) | `com.segment.analytics.android.integrations:Localytics` |
| [Mixpanel](https://github.com/segment-integrations/analytics-android-integration-mixpanel) | `com.segment.analytics.android.integrations:mixpanel:1.1.0` |
| [NielsenDCR](https://github.com/segment-integrations/analytics-android-integration-nielsendcr) | `com.segment.analytics.android.integrations:nielsendcr:1.0.0-Beta` |
| [Quantcast](https://github.com/segment-integrations/analytics-android-integration-quantcast) | `com.segment.analytics.android.integrations:quantcast:1.0.1` |
| [Tapstream](https://github.com/segment-integrations/analytics-android-integration-tapstream) | `com.segment.analytics.android.integrations:tapstream:1.0.0` |

# Usage

```js
import Analytics from 'react-native-analytics-segment-io'
```

- **Analytics.setup(key, options)**
- **Analytics.identify(userId, traits)**
- **Analytics.track(event, properties)**
- **Analytics.screen(name, properties)**
- **Analytics.group(groupId, traits)**
- **Analytics.alias(newId)**
- **Analytics.reset()**
- **Analytics.flush()**
- **Analytics.enable()**
- **Analytics.disable()**

## setup: function (key, options = {})
*Initial framework setup*
```js
Analytics.setup('segment_write_key', { enableAdvertisingTracking: true })
```

*`setup()` returns a promise to indicate whether the initialization was successful or not.*

Supported options:

| Options                         | Type    | Default | Description                                                                                                                                                                            |
|---------------------------------|---------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| enableAdvertisingTracking       | Bool    | `false` | Whether the analytics client should track advertisting info.                                                                                                                           |
| flushAt                         | Integer | `20`    | The number of queued events that the analytics client should flush at. Setting this to `1` will not queue any events and will use more battery.                                        |
| recordScreenViews               | Bool    | `false` | Whether the analytics client should automatically make a screen call when a view controller is added to a view hierarchy.                                                              |
| shouldUseBluetooth              | Bool    | `false` | Whether the analytics client should record bluetooth information.                                                                                                                      |
| shouldUseLocationServices       | Bool    | `false` | Whether the analytics client should use location services.                                                                                                                             |
| trackApplicationLifecycleEvents | Bool    | `false` | Whether the analytics client should automatically make a track call for application lifecycle events, such as "Application Installed", "Application Updated" and "Application Opened". |
| trackAttributionData            | Bool    | `false` | Whether the analytics client should automatically track attribution data from enabled providers using the mobile service.                                                              |
| trackDeepLinks                  | Bool    | `false` | Whether the analytics client should automatically track deep links.                                                                                                                    |

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
Analytics.track('Photo Screen', { feed: 'private' })
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

# License

MIT
