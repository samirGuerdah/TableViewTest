
//  Created by samir on 30/04/2017.
//  Copyright © 2017 Samir Guerdah. All rights reserved.

#import "SGHomeHeaderView.h"

@implementation SGHomeHeaderView

+ (UIView *)loadView {
   NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SGHomeHeaderView class]) owner:self options:nil];
   return nibs.firstObject;
}

@end
