//
//  CaptureImage.h
//  Quartz
//
//  Created by Tianzhu on 13-7-21.
//  Copyright (c) 2013年 Iwinad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CaptureBrush.h"
#import "CircleBrush.h"
typedef enum {
    kRectangeBrush,
    kCircleBrush,

}BrushModel;

@interface CaptureImage : UIControl{
    UIView *_image;
    CGRect _dragRect;
    BOOL _isEnableDrag;
    CaptureBrush *_brush;
    
    CGRect _brushDragBeganRect;
    CGRect _selfRect;
    
}
-(id)initWithImageView:(UIView *)imageView dragRect:(CGRect)dragRect captureBrush:(CaptureBrush *)brush;
-(id)initWithImageView:(UIView *)imageView dragRect:(CGRect)dragRect brushModel:(BrushModel)brushModel;
-(UIImage *)caputerImage;
-(CGRect)getBurshFrame;
@end
