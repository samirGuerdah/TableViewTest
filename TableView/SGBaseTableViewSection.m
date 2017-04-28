
//  Created by samir on 28/04/2017.
//  Copyright © 2017 Samir Guerdah. All rights reserved.

#import "SGBaseTableViewSection.h"

@implementation SGBaseTableViewSection

- (instancetype)initWithType:(NSUInteger)type {
   self = [super init];
   if (self) {
      _type = type;
      _rows = @[];
      _state = SGTableViewSectionStateFrozen;
   }
   return self;
}

@end
