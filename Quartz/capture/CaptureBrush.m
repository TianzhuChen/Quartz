//
//  CaptureBrush.m
//  Quartz
//
//  Created by iwinad2 on 13-7-26.
//  Copyright (c) 2013年 Iwinad. All rights reserved.
//

#import "CaptureBrush.h"

@implementation CaptureBrush

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor=[[UIColor whiteColor] colorWithAlphaComponent:0.0];
        _orignalRect=frame;
        [self initProperty];
    }
    return self;
}

-(void)initProperty{
    _dragView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, DRAG_VIEW_WIDTH, DRAG_VIEW_HEIGHT)];
    _dragView.frame=CGRectOffset(_dragView.frame, CGRectGetWidth(self.frame)-DRAG_VIEW_WIDTH,CGRectGetHeight(self.frame)-DRAG_VIEW_HEIGHT);
    _dragView.backgroundColor=[UIColor grayColor];
    _dragView.autoresizingMask=UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self addSubview:_dragView];
    UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
    [_dragView addGestureRecognizer:pan];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
float lengths[]={5,5};
float lineOffset=0;
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context);
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextSetLineDash(context, 0, lengths, 2);
    CGContextSetLineWidth(context, 3.0);
    CGContextMoveToPoint(context, -lineOffset, -lineOffset);
    CGContextAddLineToPoint(context, CGRectGetWidth(self.frame)+lineOffset, -lineOffset);
    CGContextAddLineToPoint(context, CGRectGetWidth(self.frame)+lineOffset, CGRectGetHeight(self.frame)+lineOffset);
    CGContextAddLineToPoint(context, -lineOffset, CGRectGetHeight(self.frame)+lineOffset);
    CGContextClosePath(context);
    CGContextStrokePath(context);
}
-(void)panGestureRecognizer:(UIPanGestureRecognizer *)pan{
    if(pan.state==UIGestureRecognizerStateBegan)
    {
        _orignalRect=self.frame;
    }else if(pan.state==UIGestureRecognizerStateChanged)
    {
        CGPoint p=[pan translationInView:self];
        self.frame=CGRectMake(_orignalRect.origin.x, _orignalRect.origin.y, _orignalRect.size.width+p.x, _orignalRect.size.height+p.y);
        [self updateContent];
    }else if(pan.state==UIGestureRecognizerStateEnded)
    {
        
    }
}
-(void)layoutSubviews{
    _dragView.frame=CGRectMake(CGRectGetWidth(self.frame)-DRAG_VIEW_WIDTH, CGRectGetHeight(self.frame)-DRAG_VIEW_HEIGHT, DRAG_VIEW_WIDTH, DRAG_VIEW_HEIGHT);
}
-(void)updateContent{
    [self.superview setNeedsDisplay];
    [self setNeedsLayout];
}
-(void)updateBrush:(CGContextRef)context superFrame:(CGRect)superFrame{};
-(void)capturePath:(CGContextRef)context{};
@end
