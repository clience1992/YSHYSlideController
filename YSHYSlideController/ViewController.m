//
//  ViewController.m
//  YSHYSlideController
//
//  Created by 杨淑园 on 15/11/2.
//  Copyright © 2015年 yangshuyaun. All rights reserved.
//

#import "ViewController.h"
@implementation ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UIViewController * mainVC = [[UIViewController alloc]init
                                 ];
    [mainVC.view setBackgroundColor:[UIColor grayColor]];
    
    [self setMainViewController:mainVC];
}



@end
