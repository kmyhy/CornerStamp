//
//  UIView+CornerStamp.h
//  CornerStamp
//
//  Created by qq on 2017/6/30.
//  Copyright © 2017年 qq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CornerStamp.h"

@interface UIView (CornerStamp)

@property(strong,nonatomic)CornerStamp* cornerStamp;

-(void)addStamp:(NSString*)text;
-(void)removeStamp;
@end
