//
//  CaptureTest.m
//  Quartz
//
//  Created by iwinad2 on 13-7-26.
//  Copyright (c) 2013年 Iwinad. All rights reserved.
//

#import "CaptureTest.h"

@implementation CaptureTest

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if(self){
        
    }
    return self;
}
-(void)didMoveToSuperview{
    capture=[[CaptureImage alloc] initWithImageView:self.view1 dragRect:self.view1.frame brushModel:kCircleBrush];
//    [self insertSubview:capture aboveSubview:_testImage];
    [self insertSubview:capture belowSubview:_captureBtn];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)capture:(id)sender {
    self.testImage.image=[capture caputerImage];
    CGRect fr=self.testImage.frame;
    fr.size.width=100;
    fr.size.height=100;
    self.testImage.frame=fr;
//    UIImageView *img=[[UIImageView alloc] initWithImage:[capture caputerImage]];
//    img.center=CGPointMake(200, 400);
//    [self addSubview:img];
}
@end
