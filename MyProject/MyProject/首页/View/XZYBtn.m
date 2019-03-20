//
//  XZYBtn.m
//  MyProject
//
//  Created by Comker on 2019/3/19.
//  Copyright © 2019 Comker. All rights reserved.
//

#import "XZYBtn.h"

@implementation XZYBtn

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)awakeFromNib{
    [super awakeFromNib];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    CGFloat buttonHeight = CGRectGetHeight(self.frame);
    CGFloat buttonWidth = CGRectGetWidth(self.frame);
    
    CGFloat ivHeight = CGRectGetHeight(self.imageView.frame);
    CGFloat ivWidth = CGRectGetWidth(self.imageView.frame);
    
    CGFloat titleHeight = CGRectGetHeight(self.titleLabel.frame);
    CGFloat titleWidth = CGRectGetWidth(self.titleLabel.frame);
    //调整图片
    float iVOffsetY = buttonHeight / 2.0 - (ivHeight + titleHeight) / 2.0;
    float iVOffsetX = buttonWidth / 2.0 - ivWidth / 2.0;
    [self setImageEdgeInsets:UIEdgeInsetsMake(iVOffsetY, iVOffsetX, 0, 0)];
    
    //调整文字
    float titleOffsetY = iVOffsetY + CGRectGetHeight(self.imageView.frame) + 10;
    float titleOffsetX = 0;
    if (CGRectGetWidth(self.imageView.frame) >= (CGRectGetWidth(self.frame) / 2.0)) {
        //如果图片的宽度超过或等于button宽度的一半
        titleOffsetX = -(ivWidth + titleWidth - buttonWidth / 2.0 - titleWidth / 2.0);
    }else {
        titleOffsetX = buttonWidth / 2.0 - ivWidth - titleWidth / 2.0;
    }
    [self setTitleEdgeInsets:UIEdgeInsetsMake(titleOffsetY , titleOffsetX, 0, 0)];
    
    
}
@end
