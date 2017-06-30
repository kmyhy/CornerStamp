//
//  CornerStamp.m
//  CornerStamp
//
//  Created by qq on 2017/6/30.
//  Copyright © 2017年 qq. All rights reserved.
//

#import "CornerStamp.h"

@implementation CornerStamp

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self setup];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setup];
    }
    return self;
}
-(instancetype)init{
    CGRect rect = CGRectMake(0, 0, 220, 220);
    self = [self initWithFrame:rect];
    return self;
}
-(void)setup{
    self.text = @"特价";
    self.textColor = [UIColor whiteColor];
    self.fontSize = 14;
    self.barWidth = 200;
    self.barHeight = 30;
    self.fillColor = [UIColor redColor];
    self.backgroundColor = [UIColor clearColor];
    
    self.offset= CGPointMake(30, 30);
    self.userInteractionEnabled = NO;
}
- (void)drawRect:(CGRect)frame {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(frame) + _offset.x, CGRectGetMinY(frame) + _offset.y);// 将 corner stamp 的中心锚点挪到左上角，再挪到 offset

    CGContextRotateCTM(context, -45 * M_PI / 180);
    
    CGRect textRect = CGRectMake(-_barWidth/2, -_barHeight/2, _barWidth, _barHeight);// 绘制时，整个 bar 的中心对齐左上角 0，0
    UIBezierPath* textPath = [UIBezierPath bezierPathWithRect: textRect];
    [_fillColor setFill];
    [textPath fill];
    {
        NSString* textContent = _text;
        NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        textStyle.alignment = NSTextAlignmentCenter;
        
        NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: _fontSize], NSForegroundColorAttributeName: _textColor, NSParagraphStyleAttributeName: textStyle};
        
        CGFloat textTextHeight = [textContent boundingRectWithSize: CGSizeMake(textRect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: textFontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, textRect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(textRect), CGRectGetMinY(textRect) + (CGRectGetHeight(textRect) - textTextHeight) / 2, CGRectGetWidth(textRect), textTextHeight) withAttributes: textFontAttributes];
        CGContextRestoreGState(context);
    }
    
    CGContextRestoreGState(context);
}

@end
