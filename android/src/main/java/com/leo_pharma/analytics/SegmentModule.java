package com.leo_pharma.analytics;

import android.support.annotation.Nullable;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.segment.analytics.Analytics;
import com.segment.analytics.Properties;
import com.segment.analytics.Traits;

public class SegmentModule extends ReactContextBaseJavaModule {
    private static final String PROPERTY_FLUSH_AT = "flushAt";
    private static final String PROPERTY_RECORD_SCREEN_VIEWS = "recordScreenViews";
    private static final String PROPERTY_TRACK_APPLICATION_LIFECYCLE_EVENTS = "trackApplicationLifecycleEvents";
    private static final String PROPERTY_TRACK_ATTRIBUTION_DATA = "trackAttributionData";

    private Analytics analytics;

    public SegmentModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "SegmentModule";
    }

    @ReactMethod
    public void setup(@Nullable String key, @Nullable ReadableMap options) {
        Analytics.Builder analyticsBuilder = new Analytics.Builder(getReactApplicationContext(), key);

        if (options == null) {
            analytics = analyticsBuilder.build();
            return;
        }

        if (options.hasKey(PROPERTY_FLUSH_AT)) {
            analyticsBuilder.flushQueueSize(options.getInt(PROPERTY_FLUSH_AT));
        }

        if (options.hasKey(PROPERTY_RECORD_SCREEN_VIEWS) && options.getBoolean(PROPERTY_RECORD_SCREEN_VIEWS)) {
            analyticsBuilder.recordScreenViews();
        }

        if (options.hasKey(PROPERTY_TRACK_APPLICATION_LIFECYCLE_EVENTS) && options.getBoolean(PROPERTY_TRACK_APPLICATION_LIFECYCLE_EVENTS)) {
            analyticsBuilder.trackApplicationLifecycleEvents();
        }

        if (options.hasKey(PROPERTY_TRACK_ATTRIBUTION_DATA) && options.getBoolean(PROPERTY_TRACK_ATTRIBUTION_DATA)) {
            analyticsBuilder.trackAttributionInformation();
        }

        analytics = analyticsBuilder.build();
    }

    @ReactMethod
    public void identify(@Nullable String userId, @Nullable ReadableMap properties) {
        Traits traits = new Traits();

        if (properties != null) {
            traits.putAll(properties.toHashMap());
        }

        analytics.identify(userId, traits, null);
    }

    @ReactMethod
    public void track(@Nullable String event, @Nullable ReadableMap properties) {
        Properties segmentProperties = new Properties();

        if (properties != null) {
            segmentProperties.putAll(properties.toHashMap());
        }

        analytics.track(event, segmentProperties);
    }

    @ReactMethod
    public void screen(@Nullable String name, @Nullable ReadableMap properties) {
        Properties segmentProperties = new Properties();

        if (properties != null) {
            segmentProperties.putAll(properties.toHashMap());
        }

        analytics.screen("", name, segmentProperties);
    }

    @ReactMethod
    public void group(@Nullable String groupId, @Nullable ReadableMap properties) {
        Traits traits = new Traits();

        if (properties != null) {
            traits.putAll(properties.toHashMap());
        }

        analytics.group(groupId, traits, null);
    }

    @ReactMethod
    public void alias(@Nullable String newId) {
        analytics.alias(newId);
    }

    @ReactMethod
    public void reset() {
        analytics.reset();
    }

    @ReactMethod
    public void flush() {
        analytics.flush();
    }
}