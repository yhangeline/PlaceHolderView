//
//  UICollectionView+PlaceHolderView.m
//  PlaceHolderView
//
//  Created by yh on 17/5/17.
//  Copyright © 2017年 yh. All rights reserved.
//

#import "UICollectionView+PlaceHolderView.h"

#import "NSObject+MethodSwizzle.h"
#import "DefaultView.h"

@implementation UICollectionView (PlaceHolderView)


+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(reloadData) withMethod:@selector(yh_reloadData)];
    });
}

- (void)yh_reloadData
{
    if (self.enablePlaceHolderView) {
        NSInteger sectionCount =  [self.dataSource respondsToSelector:@selector(numberOfSectionsInCollectionView:)] ? [self.dataSource numberOfSectionsInCollectionView:self] : 1;
        NSInteger rowCount = 0;
        for (int i = 0; i < sectionCount; i++) {
            rowCount += [self.dataSource collectionView:self numberOfItemsInSection:i];
        }
        if (rowCount == 0) {
            if (!self.firstReload) {
                self.firstReload = YES;
                if ([self.yh_PlaceHolderView isKindOfClass:[DefaultView class]]) {
                    DefaultView *defaultView = (DefaultView *)self.yh_PlaceHolderView;
                    defaultView.titleLabel.text = @"加载数据中...";
                }
            }else{
                if ([self.yh_PlaceHolderView isKindOfClass:[DefaultView class]]) {
                    DefaultView *defaultView = (DefaultView *)self.yh_PlaceHolderView;
                    defaultView.titleLabel.text = @"暂无相关数据";
                }
                
            }
            [self addSubview:self.yh_PlaceHolderView];
        }
        else
        {
            [self.yh_PlaceHolderView removeFromSuperview];
        }
    }
    [self yh_reloadData];
}


- (void)setEnablePlaceHolderView:(BOOL)enblePlaceHolderView
{
    objc_setAssociatedObject(self, @selector(enablePlaceHolderView), @(enblePlaceHolderView), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)enablePlaceHolderView
{
    NSNumber *number = objc_getAssociatedObject(self, @selector(enablePlaceHolderView));
    return number.boolValue;
}
- (void)setFirstReload:(BOOL)firstReload
{
    objc_setAssociatedObject(self, @selector(firstReload), @(firstReload), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)firstReload
{
    NSNumber *number = objc_getAssociatedObject(self, @selector(firstReload));
    return number.boolValue;
}
- (void)setYh_PlaceHolderView:(UIView *)yh_PlaceHolderView
{
    objc_setAssociatedObject(self, @selector(yh_PlaceHolderView), yh_PlaceHolderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)yh_PlaceHolderView
{
    UIView *placeHolder = objc_getAssociatedObject(self, @selector(yh_PlaceHolderView));
    if (!placeHolder) {
        placeHolder  = [[DefaultView alloc] initWithFrame:self.bounds];

        self.yh_PlaceHolderView = placeHolder;
    }
    return placeHolder;
}

@end
