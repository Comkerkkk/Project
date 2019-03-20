//
//  UIView+frame.m
//  抽屉效果练习
//
//  Created by Comker on 2019/3/13.
//  Copyright © 2019 Comker. All rights reserved.
//

#import "UIView+frame.h"

@implementation UIView (frame)

- (void)setX:(CGFloat)x{
    CGRect frame=self.frame;
    frame.origin.x=x;
    self.frame=frame;
}
- (CGFloat)x{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y{
    CGRect frame=self.frame;
    frame.origin.y=y;
    self.frame=frame;
}
- (CGFloat)y{
    return self.frame.origin.y;
}

- (void)setHeight:(CGFloat)height{
    CGRect frame=self.frame;
    frame.size.height=height;
    self.frame=frame;
}
- (CGFloat)height{
    return self.frame.size.height;
}

- (void)setWidth:(CGFloat)width{
    CGRect frame=self.frame;
    frame.size.width=width;
    self.frame=frame;
}

- (CGFloat)width{
    return self.frame.size.width;
}
@end
