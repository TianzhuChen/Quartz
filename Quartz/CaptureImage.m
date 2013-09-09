//
//  CaptureImage.m
//  Quartz
//
//  Created by Tianzhu on 13-7-21.
//  Copyright (c) 2013年 Iwinad. All rights reserved.
//

#import "CaptureImage.h"
#import "RectangeBrush.h"

@implementation CaptureImage

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _selfRect=CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
    }
    return self;
}
-(id)initWithImageView:(UIView *)imageView dragRect:(CGRect)dragRect captureBrush:(CaptureBrush *)brush{
    self=[super initWithFrame:dragRect];
    //CGRectMake(0, 0, CGRectGetWidth(imageView.frame), CGRectGetHeight(imageView.frame))
    if(self){
        self.backgroundColor=[UIColor clearColor];
        [self addSubview:_brush];
        
        _dragRect=dragRect;
        _image=imageView;
        _isEnableDrag=YES;
        UIPanGestureRecognizer *panGesture=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
        [self addGestureRecognizer:panGesture];
        
        
    }
    return self;
}
-(id)initWithImageView:(UIView *)imageView dragRect:(CGRect)dragRect brushModel:(BrushModel)brushModel{
    if(brushModel==kRectangeBrush)
    {
        _brush=[[RectangeBrush alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    }else if(brushModel==kCircleBrush)
    {
        _brush=[[CircleBrush alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    }
    return [self initWithImageView:imageView dragRect:dragRect captureBrush:_brush];
}
-(CGRect)getBurshFrame{
    return _brush.frame;
}
-(UIImage *)caputerImage{
    
    UIImage *sourceImage;
    CGContextRef context;
    if([_image isKindOfClass:[UIImageView class]]){
        sourceImage=((UIImageView *)_image).image;
    }else{
        UIGraphicsBeginImageContext(_image.frame.size);
        context=UIGraphicsGetCurrentContext();
        [_image.layer renderInContext:context];
        sourceImage=UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    CGImageRef imgRef=CGImageCreateWithImageInRect(sourceImage.CGImage, _brush.frame);

    UIGraphicsBeginImageContext(_brush.frame.size);
    context=UIGraphicsGetCurrentContext();
    [_brush capturePath:context];
    CGContextTranslateCTM(context, 0, CGRectGetHeight(_brush.frame));
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawImage(context, CGRectMake(0, 0, CGRectGetWidth(_brush.frame), CGRectGetHeight(_brush.frame)), imgRef);
   
    UIImage *captureImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRelease(imgRef);
    return captureImage;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context=UIGraphicsGetCurrentContext();
    [_brush updateBrush:context superFrame:self.frame];
}

-(void)panGestureRecognizer:(UIPanGestureRecognizer *)pan{
    if(pan.state==UIGestureRecognizerStateBegan)
    {
        if(!CGRectContainsPoint(_brush.frame, [pan locationInView:self]))
        {
            _isEnableDrag=NO;
        }
        _brushDragBeganRect=_brush.frame;
    }else if (pan.state==UIGestureRecognizerStateChanged)
    {
        if(_isEnableDrag)
        {
            CGPoint p=[pan translationInView:self];
            CGRect nRect=CGRectOffset(_brushDragBeganRect, p.x, p.y);
            
//            if(CGRectGetMinX(nRect)>=0 && CGRectGetMinY(nRect)>=0 && CGRectGetMaxX(nRect)<=CGRectGetWidth(self.frame) && CGRectGetMaxY(nRect)<=CGRectGetHeight(self.frame)){
                _brush.frame=nRect;
                [self setNeedsDisplay];
//            }
        }
    }else if(pan.state==UIGestureRecognizerStateEnded)
    {
        _isEnableDrag=YES;
    }
}
@end
