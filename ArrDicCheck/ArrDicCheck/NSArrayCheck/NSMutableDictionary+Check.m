//
//  NSMutableDictionary+Check.m
//  YaoBangMang
//
//  Created by lidashuang on 2017/4/1.
//  Copyright © 2017年 XiaoYaoYao.Ltd. All rights reserved.
//

#import "NSMutableDictionary+Check.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (Check)

+ (void)load {
    
    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(setObject:forKey:));
    Method toMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(xyy_setObject:forKey:));
    method_exchangeImplementations(fromMethod, toMethod);
}

- (void)xyy_setObject:(id)emObject forKey:(NSString *)key {
    if (emObject == nil) {
            NSAssert(NO, @"dic value can not be nil ");
    }else {
        [self xyy_setObject:emObject forKey:key];
    }
}

@end
