//
//  NSMutableArray+Check.m
//  YaoBangMang
//
//  Created by lidashuang on 2017/4/1.
//  Copyright © 2017年 XiaoYaoYao.Ltd. All rights reserved.
//

#import "NSMutableArray+Check.h"
#import <objc/runtime.h>

@implementation NSMutableArray (Check)

+(void)load {
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{  //方法交换只要一次就好
        Method fromMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndex:));
        Method toMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(xyy_objectAtIndex:));
        method_exchangeImplementations(fromMethod, toMethod);
    });
}

- (id)xyy_objectAtIndex:(NSUInteger)index {
    if (self.count - 1 < index) {
        return nil;
        NSAssert(NO, @"数组越界");
    }else {
        return [self xyy_objectAtIndex:index];
    }
}

@end
