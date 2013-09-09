//
//  ViewController.h
//  Quartz
//
//  Created by iwinad2 on 13-7-18.
//  Copyright (c) 2013年 Iwinad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CaptureTest.h"

float externTest;
@interface ViewController : UIViewController{
    CaptureTest *captureTest;
}
@property (weak, nonatomic) IBOutlet UIView *testView;

@end
