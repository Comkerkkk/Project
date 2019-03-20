//
//  UIImage+scale.m
//  MyProject
//
//  Created by Comker on 2019/3/19.
//  Copyright © 2019 Comker. All rights reserved.
//

#import "UIImage+scale.h"

@implementation UIImage (scale)
-(UIImage*)ImageWithscaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}
@end
