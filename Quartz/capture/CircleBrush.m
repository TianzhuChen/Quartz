//
//  CircleBrush.m
//  Quartz
//
//  Created by iwinad2 on 13-8-6.
//  Copyright (c) 2013年 Iwinad. All rights reserved.
//

#import "CircleBrush.h"

@implementation CircleBrush

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        self.backgroundColor=[[UIColor blueColor] colorWithAlphaComponent:0.5];
        _strokeColor=[UIColor redColor].CGColor;
        _captureColor=[[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)updateBrush:(CGContextRef)context superFrame:(CGRect)superFrame{
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetStrokeColorWithColor(context, _strokeColor);
    CGContextSetFillColorWithColor(context, _captureColor);
    CGContextSetLineWidth(context, 0);
    
    CGContextAddRect(context, CGRectMake(0, 0, CGRectGetWidth(superFrame),CGRectGetHeight(superFrame)));
    CGContextAddEllipseInRect(context, self.frame);
    CGContextClosePath(context);
    CGContextEOFillPath(context);
    CGContextStrokeEllipseInRect(context,self.frame);
}
-(void)capturePath:(CGContextRef)context{
    CGContextAddEllipseInRect(context, CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)));
    CGContextClip(context);
}
@end
