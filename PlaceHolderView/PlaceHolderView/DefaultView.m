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
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        imageView.image = [UIImage imageNamed:@"placeHolderImage"];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.center = self.center;
        [self addSubview:imageView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.center = CGPointMake(self.center.x, self.center.y+120);
        [self addSubview:_titleLabel];
    }
    return self;
}

@end
