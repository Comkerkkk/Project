//
//  HomeVC.m
//  Project
//
//  Created by Comker on 2019/3/19.
//  Copyright © 2019 Comker. All rights reserved.
//

#import "HomeVC.h"
#import "XZYBannerView.h"
#import "XZYBtn.h"
#import <Masonry.h>
@interface HomeVC ()
@property (weak, nonatomic)UIButton *gatheringBtn;
@property (weak, nonatomic)UIButton *assetBtn;
@property(weak,nonatomic)UIScrollView*scrollerView;
@property(weak,nonatomic)XZYBannerView*bannerView;
@property(weak,nonatomic)UIView *contentView;
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title=@"信天下";
    NSLog(@"%f",getRectNavAndStatusHight);
    NSLog(@"%f",kTabbarH);
    NSLog(@"%f",self.view.bounds.size.height);
    NSLog(@"%f",kScreenH);
    [self layoutsubViews];
    
    
}


-(void)layoutsubViews{
    CGFloat padding=8.0;
    CGFloat topBtnH=kScreenW/5;
    CGFloat bannerViewH=kScreenW/7*2;
    
    
    UIScrollView*scrollerView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,kScreenW, kScreenH)];
    
    [self.view addSubview:scrollerView];
    self.scrollerView=scrollerView;
    
    UIView *contentView=[[UIView alloc]initWithFrame:self.scrollerView.bounds];
    contentView.backgroundColor=[UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1.0];
    [self.scrollerView addSubview:contentView];
    self.contentView=contentView;
    scrollerView.contentSize=CGSizeMake(kScreenW,kScreenW+padding*2+20+topBtnH+bannerViewH+getRectNavAndStatusHight+kTabbarH);
    
   
    
    
    
    
    //添加白色背景
    UIView *whiteView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, topBtnH+2*padding+bannerViewH+15)];
    whiteView.backgroundColor=[UIColor whiteColor];
    [self.contentView addSubview:whiteView];
    
    
    //添加付款按钮
    UIButton*gatheringBtn=[[UIButton alloc]init];
    gatheringBtn.frame=CGRectMake(padding, padding, (kScreenW-padding*3)/2, topBtnH);
    [gatheringBtn setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    gatheringBtn.backgroundColor=[UIColor whiteColor];
    [self.contentView addSubview:gatheringBtn];
    self.gatheringBtn=gatheringBtn;
    
    //添加资产按钮
    UIButton*assetBtn=[[UIButton alloc]init];
    assetBtn.frame=CGRectMake(CGRectGetMaxX(self.gatheringBtn.frame)+padding, padding, (kScreenW-padding*3)/2, topBtnH);
    [assetBtn setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
    assetBtn.backgroundColor=[UIColor whiteColor];
    [self.contentView addSubview:assetBtn];
    
    self.assetBtn=assetBtn;
    
    
    //添加轮播控件
    NSMutableArray * images = [NSMutableArray array];
    
    for (NSInteger i = 0; i<4; i++)
    {
        [images addObject:[NSString stringWithFormat:@"%ld.jpg",i+3]];
    }
    
    XZYBannerView * banner =   [XZYBannerView direcWithtFrame:CGRectMake(padding, CGRectGetMaxY(self.gatheringBtn.frame)+padding, kScreenW-2*padding, bannerViewH) ImageArr:images AndImageClickBlock:^(NSInteger index) {
        
        NSLog(@"=== %ld ====",index);
        
    }];
    
    self.bannerView=banner;
    self.bannerView.backgroundColor=[UIColor whiteColor];
    [self.contentView addSubview:self.bannerView];
    
    
    
    //添加九宫格按钮
    NSArray*array=@[@"商学院",@"一键提额",@"卡医生",@"快卡申请",@"分润贷",@"海淘",@"在线客服",@"常见问题",@"积分商城"];
    for (int i=0; i<3; i++) {
        
        for (int j=0; j<3; j++) {
            NSInteger static tag=100;
            XZYBtn*btn=[[XZYBtn alloc]init];
            btn.frame=CGRectMake(j*kScreenW/3, CGRectGetMaxY(self.bannerView.frame)+25+i*kScreenW/3*0.8, kScreenW/3, kScreenW/3*0.8);
            
            btn.tag=tag;
            
            [btn setImage:[[UIImage imageNamed:[NSString stringWithFormat:@"%li",tag]]ImageWithscaleToSize:CGSizeMake(kScreenW/12.5,kScreenW/12.5)] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.titleLabel.font=[UIFont systemFontOfSize:12];
            btn.backgroundColor=[UIColor whiteColor];
            [btn setTitle:array[tag-100] forState:UIControlStateNormal];
           
            
            [self.contentView addSubview:btn];
            tag++;
        }
    }
    
    //分割线
    UIImageView*verticalLine1=[[UIImageView alloc]initWithFrame:CGRectMake(kScreenW/3, CGRectGetMaxY(self.bannerView.frame)+25, 1, kScreenW*0.8)];
    verticalLine1.backgroundColor=[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.03];
    UIImageView*verticalLine2=[[UIImageView alloc]initWithFrame:CGRectMake(kScreenW/3*2, CGRectGetMaxY(self.bannerView.frame)+25, 1, kScreenW*0.8)];
    verticalLine2.backgroundColor=[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.03];
    UIImageView*transverseLine1=[[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.bannerView.frame)+25+kScreenW/3*0.8, kScreenW, 1)];
    transverseLine1.backgroundColor=[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.03];
    UIImageView*transverseLine2=[[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.bannerView.frame)+25+kScreenW/3*2*0.8, kScreenW, 1)];
    transverseLine2.backgroundColor=[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.03];
    [self.contentView addSubview:verticalLine1];
    [self.contentView addSubview:verticalLine2];
    [self.contentView addSubview:transverseLine1];
    [self.contentView addSubview:transverseLine2];
    
    
    
}

-(void)addBannerView{
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [self.bannerView stopTimer];
    NSLog(@"%f",self.view.bounds.size.height);
}

- (void)viewWillAppear:(BOOL)animated{
    [self.bannerView beginTimer];
    NSLog(@"%f",self.view.bounds.size.height);
    NSLog(@"%f",kScreenH);
}
@end
