
//  Created by samir on 28/04/2017.
//  Copyright © 2017 Samir Guerdah. All rights reserved.


#import "SGBaseTableViewRow.h"

@interface SGBaseTableViewRow()
@property (nonatomic, assign) NSUInteger type;
@end

@implementation SGBaseTableViewRow
- (instancetype)initWithType:(NSUInteger)type {
   self = [super init];
   if (self) {
      _type = type;
   }
   return self;
}
@end
