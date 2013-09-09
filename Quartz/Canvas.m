//
//  Canvas.m
//  Quartz
//
//  Created by iwinad2 on 13-7-18.
//  Copyright (c) 2013年 Iwinad. All rights reserved.
//

#import "Canvas.h"
#import <ImageIO/ImageIO.h>

@implementation Canvas

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        externTest=100;
    }
    return self;
    
}
void MyDrawTransparencyLayer (CGContextRef myContext, float wd,float ht)
{
    CGSize myShadowOffset = CGSizeMake (15, -25);
    
    CGContextSetShadow (myContext, myShadowOffset, 10);
//    CGContextFillRect(myContext, CGRectMake(70, 170, 100, 100));
    //主要用于设置阴影
    CGContextBeginTransparencyLayer (myContext, NULL);
    
    // Your drawing code here
    CGContextSetFillColorWithColor(myContext, [[UIColor redColor] colorWithAlphaComponent:0.8].CGColor);
//    CGContextSetRGBFillColor (myContext, 0, 1, 0, 1);
    CGContextFillRect (myContext, CGRectMake (100,200 ,wd,ht));
    CGContextSetRGBFillColor (myContext, 0, 0, 1, 1);
    CGContextFillRect (myContext, CGRectMake (120,200+ht*0.7,wd,ht));
    CGContextSetRGBFillColor (myContext, 1, 0, 0, 1);
    CGContextFillRect (myContext, CGRectMake (140,200+ht*0.4+ht,wd,ht));
    CGContextEndTransparencyLayer (myContext);
    
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGPoint myStartPoint, myEndPoint;
    CGFloat myStartRadius, myEndRadius;
    CGGradientRef myGradient;
    CGColorSpaceRef myColorspace;
    CGFloat locations[2]={0.0,1.0};
    size_t num_locations = 2;
    CGFloat components[8] = {
        0.7, 0.8, 0.4, 0.9,    // Start colour
                0.9, 0.9, 0.9, 1.0,	// middle colour
        //        0.4, 0.7, 0.9, 0.9
    }; // End colour
    myColorspace=CGColorSpaceCreateDeviceRGB();
    
    //    UIGraphicsBeginImageContextWithOptions(CGSizeMake(200, 200), NO, 0);
    CGContextRef context=UIGraphicsGetCurrentContext();
    //    CGContextSetShouldAntialias(context, TRUE);
    //    CGContextSetAllowsAntialiasing(context, TRUE);
    
    MyDrawTransparencyLayer(context, 100, 100);
    
    CGContextSaveGState(context);
    //变形移动
    //    CGContextRotateCTM(context, 45);
        CGContextTranslateCTM(context, 0, 30);
    //创建渐变色
    myGradient=CGGradientCreateWithColorComponents(myColorspace, components, locations, num_locations);
    myStartPoint=CGPointMake(100, 100);
    myStartRadius=50;
    myEndPoint=myStartPoint;
    myEndRadius=30;
    
    
    //    CGContextSetFillColorWithColor(context,[UIColor redColor].CGColor);
    CGContextMoveToPoint(context, myStartPoint.x, myStartPoint.y);
    CGContextAddArc(context, myStartPoint.x, myStartPoint.y, 50, 0,angleToRadian(30) , 0);
    //    CGContextFillPath(context);
    CGContextMoveToPoint(context, myStartPoint.x, myStartPoint.y);
    CGContextAddArc(context, myStartPoint.x, myStartPoint.y, 50, angleToRadian(50),angleToRadian(100) , 0);
    //闭合路径结束路径
    //    CGContextClosePath(context);
    //遮罩
        CGContextClip(context);
    CGContextFillPath(context);
    
    //采用默认颜色的阴影（先指定阴影后绘图）
    CGContextSetShadow(context, CGSizeMake(15, 15), 5);
    //一个圆框
    CGContextMoveToPoint(context, 200, 80);
    CGContextSetLineWidth(context, 5);
//    CGContextAddEllipseInRect(context, CGRectMake(200, 0, 100, 80));
//    CGContextStrokePath(context);
    //==上面两行
    CGContextStrokeEllipseInRect(context, CGRectMake(200, 0, 100, 80));
    
    //指定颜色阴影（先指定阴影后绘图）
    CGContextSetShadowWithColor(context, CGSizeMake(15, 15), 5, [UIColor redColor].CGColor);
    
    //画一个矩形框
    CGContextMoveToPoint(context, 50, 0);
//    CGContextAddRect(context, CGRectMake(0, 0, 20, 20));
//    CGContextFillPath(context);
    //==上面两行
    CGContextFillRect(context, CGRectMake(0, 0, 20, 20));
    
    //圆环
    CGContextDrawRadialGradient(context,
                                myGradient,
                                myStartPoint, myStartRadius, myEndPoint, myEndRadius, 0);
    CGContextSetShadowWithColor(context, CGSizeMake(33, 33), 3, NULL);
    //线行渐变
    CGContextDrawLinearGradient(context, myGradient, CGPointMake(0, 30), CGPointMake(50, 30), kCGGradientDrawsBeforeStartLocation);
    
    CGContextRestoreGState(context);
    
    CGColorSpaceRelease(myColorspace);
    CGGradientRelease(myGradient);
}


@end
