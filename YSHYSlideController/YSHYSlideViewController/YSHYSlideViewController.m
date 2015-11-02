//
//  MainViewController.m
//  YSHYSlideController
//
//  Created by 杨淑园 on 15/10/29.
//  Copyright © 2015年 yangshuyaun. All rights reserved.
//

#import "YSHYSlideViewController.h"
static YSHYSlideViewController *signletonInstance;

@interface YSHYSlideViewController ()

@end

@implementation YSHYSlideViewController

+(YSHYSlideViewController *)shareInstance
{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        signletonInstance = [[self alloc] init];
    });
    return  signletonInstance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationBar.hidden = YES;
    signletonInstance = self;
    self.delegate = self;
    //禁止NavigationController中的系统自带pop效果
    self.interactivePopGestureRecognizer.enabled = NO;
    [self ConfigUI];
}
-(void)ConfigUI
{
    self.menuWidth = 200;
    
    self.view.layer.shadowColor =[UIColor darkGrayColor].CGColor;
    self.view.layer.shadowOpacity = 1;
    self.view.layer.shadowRadius =10;
    self.view.layer.shouldRasterize = YES;
    //添加手势
    UISwipeGestureRecognizer *swipRightGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(PanGestureRespond:)];
    swipRightGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipRightGesture];
    
    UISwipeGestureRecognizer *swipLeftGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(PanGestureRespond:)];
    swipLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipLeftGesture];
    
}
#pragma mark - 设置
-(void)setMainViewController:(UIViewController *)ViewController
{
    [super pushViewController:ViewController animated:YES];
}

-(void)PanGestureRespond:(UISwipeGestureRecognizer * )gesture
{
    if(gesture.direction == UISwipeGestureRecognizerDirectionRight)
    {
        [UIView animateWithDuration:0.25 animations:^{
            [self.view setFrame:CGRectMake(self.menuWidth, 0, self.view.frame.size.width, self.view.frame.size.height)];
            [self.view.window insertSubview:self.leftMenu.view atIndex:0];
        }];
        
    }
    else if(gesture.direction ==UISwipeGestureRecognizerDirectionLeft)
    {
        [UIView animateWithDuration:0.25 animations:^{
            [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        } completion:^(BOOL finished) {
            [self.leftMenu.view removeFromSuperview];
        }];
    }
}
#pragma mark - 跳转到选中的Controller 中
-(void)GotoViewController:(UIViewController *)viewController
{
    [super popToRootViewControllerAnimated:NO];
    [UIView animateWithDuration:0.25 animations:^{
        [super pushViewController:viewController animated:NO];
        [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    } completion:^(BOOL finished) {
       
        [self.leftMenu.view removeFromSuperview];
    }];
}

-(void)GotoRootViewController
{
    [super popToRootViewControllerAnimated:NO];
    [UIView animateWithDuration:0.25 animations:^{
//        [super pushViewController:viewController animated:NO];
        [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    } completion:^(BOOL finished) {
        
        [self.leftMenu.view removeFromSuperview];
    }];
}




@end
