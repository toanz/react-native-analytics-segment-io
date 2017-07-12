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
pod 'Analytics', '~> 3.6'
```

## Android

TODO

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
