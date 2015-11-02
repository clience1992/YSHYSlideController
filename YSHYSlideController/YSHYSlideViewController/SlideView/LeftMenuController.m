//
//  LeftController.m
//  YSHYSlideController
//
//  Created by 杨淑园 on 15/10/30.
//  Copyright © 2015年 yangshuyaun. All rights reserved.
//

#import "LeftMenuController.h"
#import "YSHYSlideViewController.h"
@interface LeftMenuController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation LeftMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view  setBackgroundColor:[UIColor purpleColor]];
    
    self.tableMenu  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, self.view.frame.size.height)];
    self.tableMenu.delegate = self;
    self.tableMenu.dataSource = self;
    self.currentIndex = [NSIndexPath indexPathForRow:0 inSection:0];
    //菜单默认选择第一行
    [self.tableMenu selectRowAtIndexPath:self.currentIndex animated:NO scrollPosition:UITableViewScrollPositionNone];
    [self.view addSubview:self.tableMenu];
}


#pragma  maek - tableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"CellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld个Controller",(long)indexPath.row];
    return  cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        UIViewController *VC = [[UIViewController alloc]init];
        [VC.view setBackgroundColor:[UIColor grayColor]];
        [[YSHYSlideViewController shareInstance] GotoViewController:VC];
    }
    else if(indexPath.row == 1)
    {
        UIViewController *VC = [[UIViewController alloc]init];
        [VC.view setBackgroundColor:[UIColor blueColor]];
        [[YSHYSlideViewController shareInstance] GotoViewController:VC];
    }
    else if ( indexPath.row == 2)
    {
        UIViewController *VC = [[UIViewController alloc]init];
        [VC.view setBackgroundColor:[UIColor yellowColor]];
        [[YSHYSlideViewController shareInstance] GotoViewController:VC];
    }
    else
    {
        UIViewController *VC = [[UIViewController alloc]init];
        [VC.view setBackgroundColor:[UIColor greenColor]];
        [[YSHYSlideViewController shareInstance] GotoViewController:VC];
    }
}




@end
