
//  Created by samir on 28/04/2017.
//  Copyright © 2017 Samir Guerdah. All rights reserved.

#import <Foundation/Foundation.h>

@class SGBaseTableViewRow;

typedef NS_ENUM(NSInteger, SGTableViewSectionState) {
   SGTableViewSectionStateOpened,
   SGTableViewSectionStateClosed,
   SGTableViewSectionStateFrozen
} ;

@interface SGBaseTableViewSection : NSObject

- (instancetype)initWithType:(NSUInteger)type;

@property (nonatomic, assign) SGTableViewSectionState state;
@property (nonatomic, assign) NSUInteger type;
@property (nonatomic, strong) NSArray <SGBaseTableViewRow *> *rows;
@end
