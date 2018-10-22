//
//  NSDictionary+YTExtension.m
//  Project
//
//  Created by 李帅 on 2017/2/14.
//  Copyright © 2017年 YiTu. All rights reserved.
//

#import "NSDictionary+LSExtension.h"

@implementation NSDictionary (LSExtension)

/**
 将dict转换成jsonstring
 
 @param dict dict
 @return jsonstring
 */
+ (NSString *)ls_dictionaryToJSONstringWithDict:(NSDictionary *)dict {
    NSData *josnData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonStr = [[NSString alloc] initWithData:josnData encoding:NSUTF8StringEncoding];
    return jsonStr;
}

@end
