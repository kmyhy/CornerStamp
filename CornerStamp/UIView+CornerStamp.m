//
//  UIView+CornerStamp.m
//  CornerStamp
//
//  Created by qq on 2017/6/30.
//  Copyright © 2017年 qq. All rights reserved.
//

#import "UIView+CornerStamp.h"
#import <objc/runtime.h>

@implementation UIView (CornerStamp)

@dynamic cornerStamp;

// MARK: - Getter/Setter

-(void)setCornerStamp:(CornerStamp*)stamp{
    objc_setAssociatedObject(self, @selector(cornerStamp), stamp, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(CornerStamp*)cornerStamp{
    return  objc_getAssociatedObject(self, @selector(cornerStamp));
}

-(void)addStamp:(NSString *)text frame:(CGRect)frame{
    if(self.cornerStamp == nil){
        self.cornerStamp = [[CornerStamp alloc]initWithFrame:frame];
        [self addSubview:self.cornerStamp];
    }
    self.cornerStamp.text = text;
}
-(void)removeStamp{
    if(self.cornerStamp){
        [self.cornerStamp removeFromSuperview];
        self.cornerStamp = nil;
    }
}
@end
