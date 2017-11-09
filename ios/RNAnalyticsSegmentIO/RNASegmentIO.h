//
//  RNASegmentIO.h
//  RNAnalyticsSegmentIO
//
//  Copyright © 2017 LEO Pharma A/S. All rights reserved.
//

#if __has_include(<React/RCTBridgeModule.h>)
#import <React/RCTBridgeModule.h>
#elif __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import "React/RCTBridgeModule.h"
#endif

@interface RNASegmentIO : NSObject <RCTBridgeModule>

@end
