# YSHYSlideController
这是一个实现侧滑菜单的小demo,只需进行简单的配置就可实现侧滑的菜单的效果 目前还不支持自定义menu 后续我会继续修改更新

在AppDele中导入
#import "YSHYSlideViewController.h"
#import "LeftMenuController.h"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
- 
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];

    //设置菜单Controller
    
    LeftMenuController * leftMenu = [[LeftMenuController alloc]init];
    
    [YSHYSlideViewController shareInstance].leftMenu = leftMenu;
    
    //设置mainController
    
    UIViewController * mainController = [[UIViewController alloc]init];
    
    [[YSHYSlideViewController shareInstance] setMainViewController:mainController];
    
    self.window.rootViewController = [YSHYSlideViewController shareInstance];
    
    [self.window makeKeyAndVisible];
    
    return YES;
    
}

下面是演示效果

![image](https://github.com/DecembeGrirl/YSHYSlideController/blob/master/YSHYSlideController/YSHYSlideViewController/YSHYSlideView.gif)

如果发现问题或者有任何建议欢迎大家提出来,让我们发扬开源精神一起改进
