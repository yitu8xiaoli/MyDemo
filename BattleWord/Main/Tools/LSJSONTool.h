//
//  LSJSONTool.h
//  ProjectFramework
//
//  Created by 李帅 on 2018/8/21.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSJSONTool : NSObject

/**
 //对象转化为json字符串
 
 @param obj 对象
 @return 字符串
 */
+(NSString *)coverToJsonStringFromObject:(id)obj;

/**
 //对象转化为字典(忽略属性说明,因为安卓没做好,临时添加的处理)
 
 @param obj 对象
 @return 子弹
 */
+ (NSDictionary*)coverToDictionaryFromObject:(id)obj;

/**
 json字符串转字典
 
 @param jsonString json格式的字符串
 @return 字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 字典转字符串
 
 @param dic 字典
 @return 字符串
 */
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;

/**
 字典转NSData
 
 @param dic 字典
 @return NSData
 */
+ (NSData *)covertToDataWithDict:(NSDictionary *)dic;

/**
 NSData转字典
 
 @param data NSData
 @return 字典
 */
+ (NSDictionary *)covertToDictWithData:(NSData *)data;

@end
