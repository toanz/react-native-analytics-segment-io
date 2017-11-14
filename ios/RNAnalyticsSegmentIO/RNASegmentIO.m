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
    config.enableAdvertisingTracking = [RCTConvert BOOL:options[@"enableAdvertisingTracking"]];
    config.flushAt = [RCTConvert NSUInteger:options[@"flushAt"]];
    config.recordScreenViews = [RCTConvert BOOL:options[@"recordScreenViews"]];
    config.shouldUseBluetooth = [RCTConvert BOOL:options[@"shouldUseBluetooth"]];
    config.shouldUseLocationServices = [RCTConvert BOOL:options[@"shouldUseLocationServices"]];
    config.trackApplicationLifecycleEvents = [RCTConvert BOOL:options[@"trackApplicationLifecycleEvents"]];
    config.trackAttributionData = [RCTConvert BOOL:options[@"trackAttributionData"]];
    config.trackDeepLinks = [RCTConvert BOOL:options[@"trackDeepLinks"]];

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
