//
//  OCVOutputArray.h
//  LegoCV4
//
//  Created by Dal Rupnik on 24/01/2017.
//  Copyright © 2017 Unified Sense. All rights reserved.
//

#import "OCVInputArray.h"

@interface OCVOutputArray : OCVInputArray

@property (nonatomic, readonly) BOOL isFixedSize;
@property (nonatomic, readonly) BOOL isFixedType;

@property (nonatomic, readonly) BOOL isNeeded;

@end
