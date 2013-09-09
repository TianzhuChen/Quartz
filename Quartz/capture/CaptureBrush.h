//
//  CaptureBrush.h
//  Quartz
//
//  Created by iwinad2 on 13-7-26.
//  Copyright (c) 2013年 Iwinad. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <QuartzCore/QuartzCore.h>

#define DRAG_VIEW_WIDTH 15
#define DRAG_VIEW_HEIGHT 15

@interface CaptureBrush : UIControl{
    UIView *_dragView;
    CGRect _orignalRect;
    @protected
    
}
-(void)updateBrush:(CGContextRef)context superFrame:(CGRect)superFrame;
-(void)capturePath:(CGContextRef)context;
-(void)initProperty;
-(void)updateContent;
@end
