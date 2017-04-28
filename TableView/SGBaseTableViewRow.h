
//  Created by samir on 28/04/2017.
//  Copyright © 2017 Samir Guerdah. All rights reserved.


#import <Foundation/Foundation.h>

@interface SGBaseTableViewRow : NSObject
- (instancetype)initWithType:(NSUInteger)type;
@property (nonatomic, assign, readonly) NSUInteger type;
@end
