//
//  DefaultView.m
//  PlaceHolderView
//
//  Created by yh on 17/5/16.
//  Copyright © 2017年 yh. All rights reserved.
//

#import "DefaultView.h"

@implementation DefaultView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        self.imageView.image = [UIImage imageNamed:@"placeHolderImage"];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.imageView.center = self.center;
        [self addSubview:self.imageView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
        self.titleLabel.textColor = [UIColor grayColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.center = CGPointMake(self.center.x, self.center.y+120);
        self.titleLabel.text = @"暂无相关数据^_^";
        [self addSubview:self.titleLabel];
    }
    return self;
}

@end
