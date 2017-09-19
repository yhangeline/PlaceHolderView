//
//  DefaultView.h
//  PlaceHolderView
//
//  Created by yh on 17/5/16.
//  Copyright © 2017年 yh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DefaultView : UIView

/**
 自定义站位图中lable的text，首次加载显示加载中，后边如果没数据显示空占位图
 */
@property (nonatomic, strong) UILabel *titleLabel;

@end
