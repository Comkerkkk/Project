//
//  XZYBannerView.m
//  广告轮播控件
//
//  Created by apple on 2018/12/17.
//  Copyright © 2018 apple. All rights reserved.
//

#import "XZYBannerView.h"

@interface XZYBannerView()<UIScrollViewDelegate>


//轮播图片名字的数组
@property(strong,nonatomic) NSArray *imageArr;

//定时器
@property(strong,nonatomic) NSTimer *timer;

@property(strong,nonatomic) imageClickBlock clickBlock;
@end

//获取ScrollView的X值偏移量
#define contentOffSet_x self.scrollView.contentOffset.x
//获取ScrollView的宽度
#define frame_width self.scrollView.frame.size.width
//获取ScrollView的contentSize宽度
#define contentSize_x self.scrollView.contentSize.width

@implementation XZYBannerView

#pragma mark 静态初始化方法
+(instancetype)direcWithtFrame:(CGRect)frame
                      ImageArr:(NSArray *)imageNameArray
            AndImageClickBlock:(imageClickBlock)clickBlock;
{
    //
    return [[XZYBannerView alloc]initWithtFrame:frame
                                       ImageArr:imageNameArray
                             AndImageClickBlock:clickBlock];
}

#pragma mark 默认初始化方法
-(instancetype)initWithtFrame:(CGRect)frame
                     ImageArr:(NSArray *)imageNameArray
           AndImageClickBlock:(imageClickBlock)clickBlock;
{
    if(self=[self initWithFrame:frame])
    {
        
        //设置ScrollView的contentSize
        self.scrollView.contentSize = CGSizeMake((imageNameArray.count+2)*frame_width,0);
        
        self.pageControl.numberOfPages = imageNameArray.count;
        
        //设置滚动图片数组
        self.imageArr=imageNameArray;
        
        //设置图片点击的Block
        self.clickBlock=clickBlock;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //初始化scrollview
        self.scrollView=[[UIScrollView alloc]init];
        self.scrollView.delegate=self;
        self.scrollView.pagingEnabled=YES;
        self.scrollView.frame=self.bounds;
        self.scrollView.scrollsToTop=NO;
        self.scrollView.contentOffset=CGPointMake(frame_width, 0);
        self.scrollView.showsVerticalScrollIndicator=NO;
        self.scrollView.showsHorizontalScrollIndicator=NO;
        [self addSubview:self.scrollView];
        
        //页码控件初始化
        self.pageControl=[[UIPageControl alloc]init];
        self.pageControl.userInteractionEnabled=NO;
        self.pageControl.frame=CGRectMake(0,self.frame.size.height-30, self.frame.size.width, 30);
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        [self addSubview:self.pageControl];
        
        self.time = 2.0;
    }
    return self;
}
#pragma mark 初始化定时器
-(void)beginTimer{
    if(_timer==nil){
        _timer=[NSTimer scheduledTimerWithTimeInterval:self.time target:self selector:@selector(changePage) userInfo:nil repeats:YES];
        
        [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

#pragma mark 销毁定时器
-(void)stopTimer
{
    [self.timer invalidate];
    self.timer=nil;
}

#pragma mark 重写time的set方法
-(void)setTime:(CGFloat)time
{
    if(time>0)
    {
        _time = time;
        [self stopTimer];
        [self beginTimer];
    }
}
-(void)changePage{
    //获取并且计算当前页码
    CGPoint currentConOffSet=self.scrollView.contentOffset;
    currentConOffSet.x+=frame_width;
    
    //动画改变当前页码
    [UIView animateWithDuration:0.5 animations:^{
        self.scrollView.contentOffset=currentConOffSet;
    }completion:^(BOOL finished) {
        [self updataWhenFirstOrLast];
    }];
}

#pragma mark 判断是否第一或者最后一个图片,改变坐标
-(void)updataWhenFirstOrLast
{
    //当图片移动到最后一张时，动画结束移动到第二张图片的位置
    if(contentOffSet_x>=contentSize_x-frame_width)
    {
        self.scrollView.contentOffset=CGPointMake(frame_width, 0);
    }
    //当图片移动到第一张时，动画结束移动到倒数第二张的位置
    else if (contentOffSet_x<=0)
    {
        self.scrollView.contentOffset=CGPointMake(contentSize_x-2*frame_width, 0);
    }
    
    //更新PageControl
    [self updataPageControl];
}
#pragma mark 更新PageControl
-(void)updataPageControl
{
    NSInteger index=(contentOffSet_x-frame_width)/frame_width;
    self.pageControl.currentPage=index;
}

#pragma mark 图片点击事件
-(void)imageClick:(UITapGestureRecognizer *)tap
{
    UIView *view=tap.view;
    if(self.clickBlock)
    {
        self.clickBlock(view.tag);
    }
}
/**
 *  我们也要使用到UIScrollViewDelegate，通过代理方法来控制轮播图的变化，和定时器开启与关闭！
 */
#pragma mark-========================UIScrollViewDelegate=====================

#pragma mark 开始拖拽代理
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

#pragma mark 结束拖拽代理
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self beginTimer];
}

#pragma mark 结束滚动代理
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //当最后或者最前一张图片时改变坐标
    [self updataWhenFirstOrLast];
}



#pragma mark 重写图片名字的数组
-(void)setImageArr:(NSArray *)imageArr
{
    _imageArr=imageArr;
    
    [self addImageToScrollView];
    
    [self beginTimer];
}



/**
 *   很明显我们该如何实现图片的填充到轮播图上呢，那么通过下面的方法就可以了：
 */
#pragma mark 根据图片名添加图片到ScrollView
-(void)addImageToScrollView
{
    //创建一个可变数组
    NSMutableArray *imgMArr=[NSMutableArray arrayWithArray:self.imageArr];
    //添加第一个和最后一个对象到对应可变数组的最后一个位置和第一个位置
    [imgMArr insertObject:[self.imageArr lastObject] atIndex:0];
    [imgMArr addObject:[self.imageArr firstObject]];
    
    NSInteger tag=-1;
    if (imgMArr.count == 0)
    {
        return;
    }
    for (NSString *name in imgMArr) {
        //将传进来的图片名在本地初始化
        UIImageView *imgView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:name]];
        
        //设置图片的坐标
        imgView.frame=CGRectMake(self.frame.size.width*(tag+1), 0, self.frame.size.width, self.frame.size.height);
        
        //如果本地没有这张图片进行网络请求
        if(imgView.image ==nil)
        {
            [imgView sd_setImageWithURL:[NSURL URLWithString:name] placeholderImage:nil];
            
        }
        //让图片进行裁剪显示
        imgView.contentMode = UIViewContentModeScaleToFill;
        //添加手势
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageClick:)];
        
        //开启用户交互
        imgView.userInteractionEnabled=YES;
        
        [self.scrollView addSubview:imgView];
        
        [imgView addGestureRecognizer:tap];
        //设置tag
        imgView.tag = tag;
        tag++;
        
    }
    
    
    self.pageControl.numberOfPages = self.imageArr.count;
}

@end
