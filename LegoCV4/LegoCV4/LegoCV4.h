//
//  LegoCV4.h
//  LegoCV4
//
//  Created by Dal Rupnik on 14/01/2017.
//  Copyright © 2017 Unified Sense. All rights reserved.
//

@import Foundation;

//! Project version number for LegoCV4.
FOUNDATION_EXPORT double LegoCV4VersionNumber;

//! Project version string for LegoCV4.
FOUNDATION_EXPORT const unsigned char LegoCV4VersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <LegoCV4/PublicHeader.h>

#if __has_include("OCVCore.h")
#import "OCVCore.h"
#endif

#if __has_include("OCVImageProcessing.h")
#import "OCVImageProcessing.h"
#endif

#if __has_include("OCVVideo.h")
#import "OCVVideo.h"
#endif
