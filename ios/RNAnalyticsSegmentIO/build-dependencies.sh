#!/bin/sh

#  build-dependencies.sh
#  RNAnalyticsSegmentIO
#
#  Copyright © 2017 LEO Pharma A/S. All rights reserved.

# If the Podfile has the `use_frameworks!` flag enabled, the <Product_Name>-umbrella.h will only be resolved after the product has been compiled

main_workspace=$(find ${MAIN_SRCROOT} -name "*.xcworkspace")

# Get the list of folders and schemes in Pods project with name matching one of the Segment's supported integration
segment_regex="(^analytics$)|segment|taplytics|adjust|googleanalytics|googleidfa|comscore|amplitude|fbsdk|mixpanel|localytics|flurry|quantcast|crittercism|firebase|appsflyer|branch|appboy"
segment_pods=$(ls ${MAIN_PODS_ROOT} | grep -iE ${segment_regex} | sed "s,/$,,")
segment_schemes=$(xcodebuild -workspace ${main_workspace} -list | sed '1,/Schemes:/ d' | sed 's/^ *//; /^$/d' | grep -iE ${segment_regex})

for pod in ${segment_pods}; do
    if [[ ${segment_schemes[*]} =~ ${pod} ]]; then
        echo "Compile '${pod}'"
        xcodebuild ONLY_ACTIVE_ARCH=NO -workspace ${main_workspace} -scheme ${pod} -arch ${CURRENT_ARCH} -sdk ${SDK_NAME} -configuration ${CONFIGURATION} -derivedDataPath ${MAIN_BUILD_DIR}
    else
        echo "Copy headers '${pod}'"
        mkdir -p ${SEGMENT_HEADERS_PATH}
        rsync -avm --include='*.h' --exclude='*.framework' -f 'hide,! */' --ignore-existing ${MAIN_PODS_ROOT}/${pod} ${SEGMENT_HEADERS_PATH}

        echo "Copy frameworks '${pod}'"
        mkdir -p ${SEGMENT_FRAMEWORKS_PATH}
        find ${MAIN_PODS_ROOT}/${pod} -name '*.framework' -exec rsync -avm --ignore-existing {} ${SEGMENT_FRAMEWORKS_PATH}/${pod} \;
    fi
done

