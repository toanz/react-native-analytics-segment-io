//
//  RNAIntegrations.h
//  RNAnalyticsSegmentIO
//
//  Copyright © 2017 LEO Pharma A/S. All rights reserved.
//

// <Segment-Integration-Name/SegmentIntegrationHeader.h> is used for default pod integration
// <Segment_Integration_Name/SegmentIntegrationHeader.h> is used when 'use_frameworks!' is added to the Podfile (since clang module names have to be valid c99ext identifiers)
// SegmentIntegrationHeader.h is used when files are directly added to the project (e.g. when having 'use_frameworks!' and using static libraries)

#if __has_include(<Segment-Taplytics/SEGTaplyticsIntegrationFactory.h>)
#import <Segment-Taplytics/SEGTaplyticsIntegrationFactory.h>
#define SEGTaplyticsIntegrationFactoryImported
#elif __has_include(<Segment_Taplytics/SEGTaplyticsIntegrationFactory.h>)
#import <Segment_Taplytics/SEGTaplyticsIntegrationFactory.h>
#define SEGTaplyticsIntegrationFactoryImported
#elif __has_include("SEGTaplyticsIntegrationFactory.h")
#import "SEGTaplyticsIntegrationFactory.h"
#define SEGTaplyticsIntegrationFactoryImported
#endif

#if __has_include(<Segment-Adjust/SEGAdjustIntegrationFactory.h>)
#import <Segment-Adjust/SEGAdjustIntegrationFactory.h>
#define SEGAdjustIntegrationFactoryImported
#elif __has_include(<Segment_Adjust/SEGAdjustIntegrationFactory.h>)
#import <Segment_Adjust/SEGAdjustIntegrationFactory.h>
#define SEGAdjustIntegrationFactoryImported
#elif __has_include("SEGAdjustIntegrationFactory.h")
#import "SEGAdjustIntegrationFactory.h"
#define SEGAdjustIntegrationFactoryImported
#endif

#if __has_include(<Segment-GoogleAnalytics/SEGGoogleAnalyticsIntegrationFactory.h>)
#import <Segment-GoogleAnalytics/SEGGoogleAnalyticsIntegrationFactory.h>
#define SEGGoogleAnalyticsIntegrationFactoryImported
#elif __has_include(<Segment_GoogleAnalytics/SEGGoogleAnalyticsIntegrationFactory.h>)
#import <Segment_GoogleAnalytics/SEGGoogleAnalyticsIntegrationFactory.h>
#define SEGGoogleAnalyticsIntegrationFactoryImported
#elif __has_include("SEGGoogleAnalyticsIntegrationFactory.h")
#import "SEGGoogleAnalyticsIntegrationFactory.h"
#define SEGGoogleAnalyticsIntegrationFactoryImported
#endif

#if __has_include(<Segment-ComScore/SEGComScoreIntegrationFactory.h>)
#import <Segment-ComScore/SEGComScoreIntegrationFactory.h>
#define SEGComScoreIntegrationFactoryImported
#elif __has_include(<Segment_ComScore/SEGComScoreIntegrationFactory.h>)
#import <Segment_ComScore/SEGComScoreIntegrationFactory.h>
#define SEGComScoreIntegrationFactoryImported
#elif __has_include("SEGComScoreIntegrationFactory.h")
#import "SEGComScoreIntegrationFactory.h"
#define SEGComScoreIntegrationFactoryImported
#endif

#if __has_include(<Segment-Amplitude/SEGAmplitudeIntegrationFactory.h>)
#import <Segment-Amplitude/SEGAmplitudeIntegrationFactory.h>
#define SEGAmplitudeIntegrationFactoryImported
#elif __has_include(<Segment_Amplitude/SEGAmplitudeIntegrationFactory.h>)
#import <Segment_Amplitude/SEGAmplitudeIntegrationFactory.h>
#define SEGAmplitudeIntegrationFactoryImported
#elif __has_include("SEGAmplitudeIntegrationFactory.h")
#import "SEGAmplitudeIntegrationFactory.h"
#define SEGAmplitudeIntegrationFactoryImported
#endif

#if __has_include(<Segment-Facebook-App-Events/SEGFacebookAppEventsIntegrationFactory.h>)
#import <Segment-Facebook-App-Events/SEGFacebookAppEventsIntegrationFactory.h>
#define SEGFacebookAppEventsIntegrationFactoryImported
#elif __has_include(<Segment_Facebook_App_Events/SEGFacebookAppEventsIntegrationFactory.h>)
#import <Segment_Facebook_App_Events/SEGFacebookAppEventsIntegrationFactory.h>
#define SEGFacebookAppEventsIntegrationFactoryImported
#elif __has_include("SEGFacebookAppEventsIntegrationFactory.h")
#import "SEGFacebookAppEventsIntegrationFactory.h"
#define SEGFacebookAppEventsIntegrationFactoryImported
#endif

#if __has_include(<Segment-Mixpanel/SEGMixpanelIntegrationFactory.h>)
#import <Segment-Mixpanel/SEGMixpanelIntegrationFactory.h>
#define SEGMixpanelIntegrationFactoryImported
#elif __has_include(<Segment_Mixpanel/SEGMixpanelIntegrationFactory.h>)
#import <Segment_Mixpanel/SEGMixpanelIntegrationFactory.h>
#define SEGMixpanelIntegrationFactoryImported
#elif __has_include("SEGMixpanelIntegrationFactory.h")
#import "SEGMixpanelIntegrationFactory.h"
#define SEGMixpanelIntegrationFactoryImported
#endif

#if __has_include(<Segment-Localytics/SEGLocalyticsIntegrationFactory.h>)
#import <Segment-Localytics/SEGLocalyticsIntegrationFactory.h>
#define SEGLocalyticsIntegrationFactoryImported
#elif __has_include(<Segment_Localytics/SEGLocalyticsIntegrationFactory.h>)
#import <Segment_Localytics/SEGLocalyticsIntegrationFactory.h>
#define SEGLocalyticsIntegrationFactoryImported
#elif __has_include("SEGLocalyticsIntegrationFactory.h")
#import "SEGLocalyticsIntegrationFactory.h"
#define SEGLocalyticsIntegrationFactoryImported
#endif

#if __has_include(<Segment-Flurry/SEGFlurryIntegrationFactory.h>)
#import <Segment-Flurry/SEGFlurryIntegrationFactory.h>
#define SEGFlurryIntegrationFactoryImported
#elif __has_include(<Segment_Flurry/SEGFlurryIntegrationFactory.h>)
#import <Segment_Flurry/SEGFlurryIntegrationFactory.h>
#define SEGFlurryIntegrationFactoryImported
#elif __has_include("SEGFlurryIntegrationFactory.h")
#import "SEGFlurryIntegrationFactory.h"
#define SEGFlurryIntegrationFactoryImported
#endif

#if __has_include(<Segment-Quantcast/SEGQuantcastIntegrationFactory.h>)
#import <Segment-Quantcast/SEGQuantcastIntegrationFactory.h>
#define SEGQuantcastIntegrationFactoryImported
#elif __has_include(<Segment_Quantcast/SEGQuantcastIntegrationFactory.h>)
#import <Segment_Quantcast/SEGQuantcastIntegrationFactory.h>
#define SEGQuantcastIntegrationFactoryImported
#elif __has_include("SEGQuantcastIntegrationFactory.h")
#import "SEGQuantcastIntegrationFactory.h"
#define SEGQuantcastIntegrationFactoryImported
#endif

#if __has_include(<Segment-Crittercism/SEGCrittercismIntegrationFactory.h>)
#import <Segment-Crittercism/SEGCrittercismIntegrationFactory.h>
#define SEGCrittercismIntegrationFactoryImported
#elif __has_include(<Segment_Crittercism/SEGCrittercismIntegrationFactory.h>)
#import <Segment_Crittercism/SEGCrittercismIntegrationFactory.h>
#define SEGCrittercismIntegrationFactoryImported
#elif __has_include("SEGCrittercismIntegrationFactory.h")
#import "SEGCrittercismIntegrationFactory.h"
#define SEGCrittercismIntegrationFactoryImported
#endif

#if __has_include(<Segment-Firebase/SEGFirebaseIntegrationFactory.h>)
#import <Segment-Firebase/SEGFirebaseIntegrationFactory.h>
#define SEGFirebaseIntegrationFactoryImported
#elif __has_include(<Segment_Firebase/SEGFirebaseIntegrationFactory.h>)
#import <Segment_Firebase/SEGFirebaseIntegrationFactory.h>
#define SEGFirebaseIntegrationFactoryImported
#elif __has_include("SEGFirebaseIntegrationFactory.h")
#import "SEGFirebaseIntegrationFactory.h"
#define SEGFirebaseIntegrationFactoryImported
#endif

#if __has_include(<segment-appsflyer-ios/SEGAppsFlyerIntegrationFactory.h>)
#import <segment-appsflyer-ios/SEGAppsFlyerIntegrationFactory.h>
#define SEGAppsFlyerIntegrationFactoryImported
#elif __has_include(<segment_appsflyer_ios/SEGAppsFlyerIntegrationFactory.h>)
#import <segment_appsflyer_ios/SEGAppsFlyerIntegrationFactory.h>
#define SEGAppsFlyerIntegrationFactoryImported
#elif __has_include("SEGAppsFlyerIntegrationFactory.h")
#import "SEGAppsFlyerIntegrationFactory.h"
#define SEGAppsFlyerIntegrationFactoryImported
#endif

#if __has_include(<Segment-Branch/BNCBranchIntegrationFactory.h>)
#import <Segment-Branch/BNCBranchIntegrationFactory.h>
#define BNCBranchIntegrationFactoryImported
#elif __has_include(<Segment_Branch/BNCBranchIntegrationFactory.h>)
#import <Segment_Branch/BNCBranchIntegrationFactory.h>
#define BNCBranchIntegrationFactoryImported
#elif __has_include("BNCBranchIntegrationFactory.h")
#import "BNCBranchIntegrationFactory.h"
#define BNCBranchIntegrationFactoryImported
#endif

#if __has_include(<Segment-Appboy/SEGAppboyIntegrationFactory.h>)
#import <Segment-Appboy/SEGAppboyIntegrationFactory.h>
#define SEGAppboyIntegrationFactoryImported
#elif __has_include(<Segment_Appboy/SEGAppboyIntegrationFactory.h>)
#import <Segment_Appboy/SEGAppboyIntegrationFactory.h>
#define SEGAppboyIntegrationFactoryImported
#elif __has_include("SEGAppboyIntegrationFactory.h")
#import "SEGAppboyIntegrationFactory.h"
#define SEGAppboyIntegrationFactoryImported
#endif

#if __has_include(<Segment-Intercom/SEGIntercomIntegrationFactory.h>)
#import <Segment-Intercom/SEGIntercomIntegrationFactory.h>
#define SEGIntercomIntegrationFactoryImported
#elif __has_include(<Segment_Intercom/SEGIntercomIntegrationFactory.h>)
#import <Segment_Intercom/SEGIntercomIntegrationFactory.h>
#define SEGIntercomIntegrationFactoryImported
#elif __has_include("SEGIntercomIntegrationFactory.h")
#import "SEGIntercomIntegrationFactory.h"
#define SEGIntercomIntegrationFactoryImported
#endif
