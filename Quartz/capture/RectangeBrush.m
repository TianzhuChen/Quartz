//
//  RectangeBrush.m
//  Quartz
//
//  Created by iwinad2 on 13-7-26.
//  Copyright (c) 2013年 Iwinad. All rights reserved.
//

#import "RectangeBrush.h"


@implementation RectangeBrush

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _strokeColor=[UIColor redColor].CGColor;
        _captureColor=[[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
}
-(void)updateBrush:(CGContextRef)context superFrame:(CGRect)superFrame{
    CGContextSetStrokeColorWithColor(context, _strokeColor);
    CGContextSetFillColorWithColor(context, _captureColor);
    CGContextSetLineWidth(context, 0);
    
    CGContextAddRect(context, CGRectMake(0, 0, CGRectGetWidth(superFrame),CGRectGetHeight(superFrame)));
    CGContextAddRect(context,self.frame);
    CGContextClosePath(context);
    CGContextEOFillPath(context);
    CGContextStrokeRect(context, self.frame);
}
-(void)capturePath:(CGContextRef)context{
//    CGContextAddEllipseInRect(context, CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)));
//    CGContextClip(context);
}
@end
