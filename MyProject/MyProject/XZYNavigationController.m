//
//  XZYNavigationController.m
//  MyProject
//
//  Created by Comker on 2019/3/19.
//  Copyright © 2019 Comker. All rights reserved.
//

#import "XZYNavigationController.h"

@interface XZYNavigationController ()
@property(weak,nonatomic)UIImageView*navBarHairLine;
@end

@implementation XZYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

+ (void)initialize {
    
    
    //获取全局的(整个应用程序)导航条
    //凡是使用到UINavigationBar的地方全部设置以下属性 (背景,颜色)
    //UINavigationBar *bar = [UINavigationBar appearance];
    
    
    //获取指定类下的导航条
    UINavigationBar *nav = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[
                                                                                          [self class]
                                                                                          ]
                            ];
    
    
    [nav setBackgroundImage:[UIImage imageNamed:@"wbg.png"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [nav setShadowImage:[UIImage new]];
    
    NSDictionary *dict= @{
                          
                          NSForegroundColorAttributeName : [UIColor blackColor],
                          NSFontAttributeName : [UIFont boldSystemFontOfSize:18]
                          
                          };
    
    [nav setTitleTextAttributes:dict];
    
    
}



@end
