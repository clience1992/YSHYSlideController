//
//  MainViewController.h
//  YSHYSlideController
//
//  Created by 杨淑园 on 15/10/29.
//  Copyright © 2015年 yangshuyaun. All rights reserved.
//

#import <UIKit/UIKit.h>
#define  kScreenWidth [UIScreen mainScreen].bounds.size.width
#define  kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface YSHYSlideViewController : UINavigationController<UINavigationControllerDelegate>
@property (nonatomic, assign)NSInteger menuWidth;
@property (nonatomic, strong)UIViewController *leftMenu;
+(YSHYSlideViewController *)shareInstance;
-(void)setMainViewController:(UIViewController *)ViewController;
-(void)GotoViewController:(UIViewController *)viewController;
@end
