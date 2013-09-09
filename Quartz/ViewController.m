//
//  ViewController.m
//  Quartz
//
//  Created by iwinad2 on 13-7-18.
//  Copyright (c) 2013年 Iwinad. All rights reserved.
//

#import "ViewController.h"

#import <QuartzCore/QuartzCore.h>
#import "UIImage+ImageEffects.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    UIGraphicsBeginImageContext(CGSizeMake(320, 118));
//    [self.testView.layer renderInContext:UIGraphicsGetCurrentContext()];
//    UIImage *img=UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIImageView *v=[[UIImageView alloc] initWithImage:img];
//    [self.view addSubview:v];
    externTest=99;
    [self.testView removeFromSuperview];
    captureTest=[[[UINib nibWithNibName:@"CaptureTest" bundle:nil] instantiateWithOwner:nil options:nil] lastObject];
   [self.view addSubview:captureTest];
    
    //毛玻璃效果
//    UIImage *img=[UIImage imageNamed:@"test1"];
//    UIImageView *imgview=[[UIImageView alloc] initWithFrame:self.view.frame];
//    imgview.image=[[img resizableImageWithCapInsets:UIEdgeInsetsMake(10, 0, 10, 10)] applyLightEffect];
//    [self.view addSubview:imgview];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
