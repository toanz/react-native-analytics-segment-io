import { NativeModules } from 'react-native'

const RNAnalyticsSegmentIO = NativeModules.RNAnalyticsSegmentIO

export default {
  setup: function (key, options = {}) {
    if (!options.flushAt) options.flushAt = 20

    RNAnalyticsSegmentIO.setup(key, options)
  },

  identify: function (userId, traits = {}) {
    RNAnalyticsSegmentIO.identify(userId, traits)
  },

  track: function (event, properties = {}) {
    RNAnalyticsSegmentIO.track(event, properties)
  },

  screen: function (name, properties = {}) {
    RNAnalyticsSegmentIO.screen(name, properties)
  },

  group: function (groupId, traits = {}) {
    RNAnalyticsSegmentIO.group(groupId, traits)
  },

  alias: function (newId) {
    RNAnalyticsSegmentIO.alias(newId)
  },

  reset: function () {
    RNAnalyticsSegmentIO.reset()
  },

  flush: function () {
    RNAnalyticsSegmentIO.flush()
  },

  enable: function () {
    RNAnalyticsSegmentIO.enable()
  },

  disable: function () {
    RNAnalyticsSegmentIO.disable()
  }
}
