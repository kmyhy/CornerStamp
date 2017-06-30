//
//  CornerStamp.h
//  CornerStamp
//
//  Created by qq on 2017/6/30.
//  Copyright © 2017年 qq. All rights reserved.
//

#import <UIKit/UIKit.h>


IB_DESIGNABLE
@interface CornerStamp : UIView

@property(strong,nonatomic)IBInspectable UIColor* textColor;
@property(copy,nonatomic)IBInspectable NSString* text;
@property(assign,nonatomic)IBInspectable CGFloat barWidth;
@property(assign,nonatomic)IBInspectable CGFloat barHeight;
@property(assign,nonatomic)IBInspectable CGPoint offset;
@property(strong,nonatomic)IBInspectable UIColor* fillColor;
@property(assign,nonatomic)IBInspectable CGFloat fontSize;

@end
