package com.leo_pharma.analytics;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.segment.analytics.Analytics;
import com.segment.analytics.Properties;
import com.segment.analytics.Traits;

public class SegmentModule extends ReactContextBaseJavaModule {
    public SegmentModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "SegmentModule";
    }

    @ReactMethod
    public void setup(String key, ReadableMap options) {
        Analytics.Builder analyticsBuilder = new Analytics.Builder(getReactApplicationContext(), key);

        if (options == null) {
            Analytics.setSingletonInstance(analyticsBuilder.build());
            return;
        }

        if (options.hasKey("flushAt")) {
            analyticsBuilder.flushQueueSize(options.getInt("flushAt"));
        }

        if (options.hasKey("recordScreenViews") && options.getBoolean("recordScreenViews")) {
            analyticsBuilder.recordScreenViews();
        }

        if (options.hasKey("trackApplicationLifecycleEvents") && options.getBoolean("trackApplicationLifecycleEvents")) {
            analyticsBuilder.trackApplicationLifecycleEvents();
        }

        if (options.hasKey("trackAttributionData") && options.getBoolean("trackAttributionData")) {
            analyticsBuilder.trackAttributionInformation();
        }

        if (BuildConfig.DEBUG) {
            analyticsBuilder.logLevel(Analytics.LogLevel.VERBOSE);
        }

        Analytics.setSingletonInstance(analyticsBuilder.build());
    }

    @ReactMethod
    public void identify(String userId, ReadableMap properties) {
        Traits traits = new Traits();

        if (properties != null) {
            traits.putAll(properties.toHashMap());
        }

        Analytics.with(getReactApplicationContext()).identify(userId, traits, null);
    }

    @ReactMethod
    public void track(String event, ReadableMap properties) {
        Properties segmentProperties = new Properties();

        if (properties != null) {
            segmentProperties.putAll(properties.toHashMap());
        }

        Analytics.with(getReactApplicationContext()).track(event, segmentProperties);
    }

    @ReactMethod
    public void screen(String name, ReadableMap properties) {
        Properties segmentProperties = new Properties();

        if (properties != null) {
            segmentProperties.putAll(properties.toHashMap());
        }

        Analytics.with(getReactApplicationContext()).screen("", name, segmentProperties);
    }

    @ReactMethod
    public void group(String groupId, ReadableMap properties) {
        Traits traits = new Traits();

        if (properties != null) {
            traits.putAll(properties.toHashMap());
        }

        Analytics.with(getReactApplicationContext()).group(groupId, traits, null);
    }

    @ReactMethod
    public void alias(String newId) {
        Analytics.with(getReactApplicationContext()).alias(newId);
    }

    @ReactMethod
    public void reset() {
        Analytics.with(getReactApplicationContext()).reset();
    }

    @ReactMethod
    public void flush() {
        Analytics.with(getReactApplicationContext()).flush();
    }

    @ReactMethod
    public void enable() {
        //TODO?
    }

    @ReactMethod
    public void disable() {
        Analytics.with(getReactApplicationContext()).shutdown(); //TODO?
    }
}