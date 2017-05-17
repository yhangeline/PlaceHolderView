//
//  NSObject+MethodSwizzle.m
//  PlaceHolderView
//
//  Created by yh on 17/5/16.
//  Copyright © 2017年 yh. All rights reserved.
//

#import "NSObject+MethodSwizzle.h"


@implementation NSObject (MethodSwizzle)

+ (void)swizzleMethod:(SEL)origSelector withMethod:(SEL)newSelector
{
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, origSelector);
    Method newMethod = class_getInstanceMethod(class, newSelector);
    
    BOOL didAddMethod = class_addMethod(class,
                                        origSelector,
                                        method_getImplementation(newMethod),
                                        method_getTypeEncoding(newMethod));
    if (didAddMethod)
    {
        class_replaceMethod(class,
                            newSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, newMethod);
    }
}


@end
