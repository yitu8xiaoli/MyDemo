//
//  NSDictionary+YTExtension.h
//  Project
//
//  Created by 李帅 on 2017/2/14.
//  Copyright © 2017年 YiTu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (LSExtension)

/**
 将dict转换成jsonstring

 @param dict dict
 @return jsonstring
 */
+ (NSString *)ls_dictionaryToJSONstringWithDict:(NSDictionary *)dict;

@end
