//
//  TabBarController.m
//  Project
//
//  Created by Comker on 2019/3/19.
//  Copyright © 2019 Comker. All rights reserved.
//

#import "TabBarController.h"
#import "HomeVC.h"
#import "MineVC.h"
#import "ApplyVC.h"
#import "OptimizationVC.h"
#import "LoginVC.h"
#import "XZYNavigationController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HomeVC*homeVC=[[HomeVC alloc]init];
    MineVC*mineVC=[[MineVC alloc]init];
    ApplyVC*applyVC=[[ApplyVC alloc]init];
    OptimizationVC*optimizationVC=[[OptimizationVC alloc]init];
    
    XZYNavigationController*homeNav=[[XZYNavigationController alloc]initWithRootViewController:homeVC];
    XZYNavigationController*mineNav=[[XZYNavigationController alloc]initWithRootViewController:mineVC];
    XZYNavigationController*applyNav=[[XZYNavigationController alloc]initWithRootViewController:applyVC];
    XZYNavigationController*optimizationNav=[[XZYNavigationController alloc]initWithRootViewController:optimizationVC];
    
    homeNav.tabBarItem.title=@"首页";
    mineNav.tabBarItem.title=@"我的";
    applyNav.tabBarItem.title=@"分享赚钱";
    optimizationNav.tabBarItem.title=@"账单优化";
    
    homeNav.tabBarItem.image=[[[UIImage imageNamed:@"首页"]ImageWithscaleToSize:CGSizeMake(kScreenW/20, kScreenW/20)]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeNav.tabBarItem.selectedImage=[[[UIImage imageNamed:@"首页（蓝色）"]ImageWithscaleToSize:CGSizeMake(kScreenW/20, kScreenW/20)]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    mineNav.tabBarItem.image=[[[UIImage imageNamed:@"我的"]ImageWithscaleToSize:CGSizeMake(kScreenW/20, kScreenW/20)]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mineNav.tabBarItem.selectedImage=[[[UIImage imageNamed:@"我的（蓝色）"]ImageWithscaleToSize:CGSizeMake(kScreenW/20, kScreenW/20)]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    
    optimizationNav.tabBarItem.image=[[[UIImage imageNamed:@"账单优化"] ImageWithscaleToSize:CGSizeMake(kScreenW/20, kScreenW/20)]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    optimizationNav.tabBarItem.selectedImage=[[[UIImage imageNamed:@"账单优化（蓝色）"]ImageWithscaleToSize:CGSizeMake(kScreenW/20, kScreenW/20)]imageWithRenderingMode:UIImageRenderingModeAutomatic];
    
    applyNav.tabBarItem.image=[[[UIImage imageNamed:@"分享赚钱"]ImageWithscaleToSize:CGSizeMake(kScreenW/20, kScreenW/20)]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    applyNav.tabBarItem.selectedImage=[[[UIImage imageNamed:@"分享赚钱（蓝色）"]ImageWithscaleToSize:CGSizeMake(kScreenW/20, kScreenW/20)]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSArray*vcArray=[NSArray arrayWithObjects:homeNav,optimizationNav,applyNav, mineNav, nil];
    
    
    self.viewControllers=vcArray;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
+(void)initialize{
    UITabBar*bar=[UITabBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    [bar setBarTintColor:[UIColor whiteColor]];
    bar.translucent=NO;
}
@end
