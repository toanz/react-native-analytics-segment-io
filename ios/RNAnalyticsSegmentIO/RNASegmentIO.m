//
//  RNASegmentIO.m
//  RNAnalyticsSegmentIO
//
//  Copyright © 2017 LEO Pharma A/S. All rights reserved.
//

#if __has_include(<Analytics/SEGAnalytics.h>)
#import <Analytics/SEGAnalytics.h>
#elif __has_include("SEGAnalytics.h")
#import "SEGAnalytics.h"
#else
#import "Analytics/SEGAnalytics.h"
#endif

#if __has_include(<React/RCTConvert.h>)
#import <React/RCTConvert.h>
#elif __has_include("RCTConvert.h")
#import "RCTConvert.h"
#else
#import "React/RCTConvert.h"
#endif

#import "RNASegmentIO.h"
#import "RNAIntegrations.h"

@implementation RNASegmentIO

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(setup:(NSString *)key
                  options:(NSDictionary *)options
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
    SEGAnalyticsConfiguration *config = [SEGAnalyticsConfiguration configurationWithWriteKey:key];

    id value = options[@"enableAdvertisingTracking"];
    if (value != nil) {
        config.enableAdvertisingTracking = [RCTConvert BOOL:value];
    }

    value = options[@"flushAt"];
    if (value != nil) {
        config.flushAt = [RCTConvert NSUInteger:value];
    }

    value = options[@"recordScreenViews"];
    if (value != nil) {
        config.recordScreenViews = [RCTConvert BOOL:value];
    }

    value = options[@"shouldUseBluetooth"];
    if (value != nil) {
        config.shouldUseBluetooth = [RCTConvert BOOL:value];
    }

    value = options[@"shouldUseLocationServices"];
    if (value != nil) {
        config.shouldUseLocationServices = [RCTConvert BOOL:value];
    }

    value = options[@"trackApplicationLifecycleEvents"];
    if (value != nil) {
        config.trackApplicationLifecycleEvents = [RCTConvert BOOL:value];
    }

    value = options[@"trackAttributionData"];
    if (value != nil) {
        config.trackAttributionData = [RCTConvert BOOL:value];
    }

    value = options[@"trackDeepLinks"];
    if (value != nil) {
        config.trackDeepLinks = [RCTConvert BOOL:value];
    }

#ifdef SEGTaplyticsIntegrationFactoryImported
    [config use:[SEGTaplyticsIntegrationFactory instance]];
#endif

#ifdef SEGAdjustIntegrationFactoryImported
    [config use:[SEGAdjustIntegrationFactory instance]];
#endif

#ifdef SEGGoogleAnalyticsIntegrationFactoryImported
    [config use:[SEGGoogleAnalyticsIntegrationFactory instance]];
#endif

#ifdef SEGComScoreIntegrationFactoryImported
    [config use:[SEGComScoreIntegrationFactory instance]];
#endif

#ifdef SEGAmplitudeIntegrationFactoryImported
    [config use:[SEGAmplitudeIntegrationFactory instance]];
#endif

#ifdef SEGFacebookAppEventsIntegrationFactoryImported
    [config use:[SEGFacebookAppEventsIntegrationFactory instance]];
#endif

#ifdef SEGMixpanelIntegrationFactoryImported
    [config use:[SEGMixpanelIntegrationFactory instance]];
#endif

#ifdef SEGLocalyticsIntegrationFactoryImported
    [config use:[SEGLocalyticsIntegrationFactory instance]];
#endif

#ifdef SEGFlurryIntegrationFactoryImported
    [config use:[SEGFlurryIntegrationFactory instance]];
#endif

#ifdef SEGQuantcastIntegrationFactoryImported
    [config use:[SEGQuantcastIntegrationFactory instance]];
#endif

#ifdef SEGCrittercismIntegrationFactoryImported
    [config use:[SEGCrittercismIntegrationFactory instance]];
#endif

#ifdef SEGFirebaseIntegrationFactoryImported
    [config use:[SEGFirebaseIntegrationFactory instance]];
#endif

#ifdef SEGAppsFlyerIntegrationFactoryImported
    [config use:[SEGAppsFlyerIntegrationFactory instance]];
#endif

#ifdef BNCBranchIntegrationFactoryImported
    [config use:[BNCBranchIntegrationFactory instance]];
#endif

    [SEGAnalytics setupWithConfiguration:config];
    [SEGAnalytics debug:[RCTConvert BOOL:options[@"debug"]]];
    resolve(@(YES));
}

RCT_EXPORT_METHOD(identify:(NSString *)userId :(NSDictionary *)traits)
{
    [[SEGAnalytics sharedAnalytics] identify:userId traits:traits];
}

RCT_EXPORT_METHOD(track:(NSString *)event properties:(NSDictionary *)properties)
{
    [[SEGAnalytics sharedAnalytics] track:event properties:properties];
}

RCT_EXPORT_METHOD(screen:(NSString *)name :(NSDictionary *)properties)
{
    [[SEGAnalytics sharedAnalytics] screen:name properties:properties];
}

RCT_EXPORT_METHOD(group:(NSString *)groupId :(NSDictionary *)traits)
{
    [[SEGAnalytics sharedAnalytics] group:groupId traits:traits];
}

RCT_EXPORT_METHOD(alias:(NSString *)newId)
{
    [[SEGAnalytics sharedAnalytics] alias:newId];
}

RCT_EXPORT_METHOD(reset)
{
    [[SEGAnalytics sharedAnalytics] reset];
}

RCT_EXPORT_METHOD(flush)
{
    [[SEGAnalytics sharedAnalytics] flush];
}

RCT_EXPORT_METHOD(enable)
{
    [[SEGAnalytics sharedAnalytics] enable];
}

RCT_EXPORT_METHOD(disable)
{
    [[SEGAnalytics sharedAnalytics] disable];
}

@end
