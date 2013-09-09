//
//  CaptureTest.h
//  Quartz
//
//  Created by iwinad2 on 13-7-26.
//  Copyright (c) 2013年 Iwinad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CaptureImage.h"

@interface CaptureTest : UIView{
    CaptureImage *capture;
}
- (IBAction)capture:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *captureBtn;
@property (weak, nonatomic) IBOutlet UIImageView *testImage;
@property (weak, nonatomic) IBOutlet UIView *view1;


@end
