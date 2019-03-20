//
//  XZYBannerView.h
//  广告轮播控件
//
//  Created by apple on 2018/12/17.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

#define ScreenHeight    [UIScreen mainScreen].bounds.size.height
#define ScreenWidth     [UIScreen mainScreen].bounds.size.width

@interface XZYBannerView : UIView
/** 轮播的scrollview*/
@property(nonatomic,strong)UIScrollView *scrollView;
/** 页码*/
@property(nonatomic,strong)UIPageControl *pageControl;
/** 轮播时间*/
@property(nonatomic,assign)CGFloat time;

typedef void(^imageClickBlock)(NSInteger index);

/**
 *  初始化图片轮播图方法
 *
 *  @param frame          坐标
 *  @param imageNameArray 图片数组
 *
 *  @return 当前对象
 */
+(instancetype)direcWithtFrame:(CGRect)frame
                      ImageArr:(NSArray *)imageNameArray
            AndImageClickBlock:(imageClickBlock)clickBlock;

//开始定时器
-(void)beginTimer;

//销毁定时器
-(void)stopTimer;

@end

