import { NativeModules } from 'react-native'

const RNASegmentIO = NativeModules.RNASegmentIO || NativeModules.SegmentModule

export default {
  setup: function (key, options = {}) {
    return RNASegmentIO.setup(key, options)
  },

  identify: function (userId, traits = {}) {
    RNASegmentIO.identify(userId, traits)
  },

  track: function (event, properties = {}) {
    RNASegmentIO.track(event, properties)
  },

  screen: function (name, properties = {}) {
    RNASegmentIO.screen(name, properties)
  },

  group: function (groupId, traits = {}) {
    RNASegmentIO.group(groupId, traits)
  },

  alias: function (newId) {
    RNASegmentIO.alias(newId)
  },

  reset: function () {
    RNASegmentIO.reset()
  },

  flush: function () {
    RNASegmentIO.flush()
  },

  enable: function () {
    RNASegmentIO.enable()
  },

  disable: function () {
    RNASegmentIO.disable()
  }
}

export const AnalyticsConstants = {
  enableAdvertisingTracking: RNASegmentIO.enableAdvertisingTracking,
  flushAt: RNASegmentIO.flushAt,
  recordScreenViews: RNASegmentIO.recordScreenViews,
  shouldUseBluetooth: RNASegmentIO.shouldUseBluetooth,
  shouldUseLocationServices: RNASegmentIO.shouldUseLocationServices,
  trackApplicationLifecycleEvents: RNASegmentIO.trackApplicationLifecycleEvents,
  trackAttributionData: RNASegmentIO.trackAttributionData,
  trackDeepLinks: RNASegmentIO.trackDeepLinks,
  debug: RNASegmentIO.debug,
}
