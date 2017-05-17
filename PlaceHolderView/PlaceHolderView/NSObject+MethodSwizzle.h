//
//  NSObject+MethodSwizzle.h
//  PlaceHolderView
//
//  Created by yh on 17/5/16.
//  Copyright © 2017年 yh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (MethodSwizzle)

+ (void)swizzleMethod:(SEL)origSelector withMethod:(SEL)newSelector;

@end
