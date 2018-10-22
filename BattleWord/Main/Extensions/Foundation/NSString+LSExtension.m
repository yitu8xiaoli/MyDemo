//
//  NSString+lsExtension.m
//  Project
//
//  Created by 李帅 on 2017/2/10.
//  Copyright © 2017年 YiTu. All rights reserved.
//

#import "NSString+LSExtension.h"
#import <AdSupport/ASIdentifierManager.h>
#include <sys/sysctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <net/if_dl.h>

@implementation NSString (LSExtension)

#pragma mark - 字符串长宽计算

/**
 *  根据相应的宽度求出对应string的高度
 *
 *  @param string 文字内容
 *  @param width  最大宽度
 *  @param font   字体大小
 *  @param mode   换行模式
 *
 *  @return 返回高度, 有些许偏差,可根据View的上下size关系,加1 - 10
 */
+ (CGSize)ls_caculateHeightOfString:(NSString *)string
                        withMaxWidth:(CGFloat)width
                            withFont:(UIFont *)font {
 
    CGSize size = CGSizeMake(width, MAXFLOAT);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByCharWrapping];
    CGRect frame = [string boundingRectWithSize:size
                                      options:
                    NSStringDrawingTruncatesLastVisibleLine |
                    NSStringDrawingUsesLineFragmentOrigin |
                    NSStringDrawingUsesFontLeading
                                   attributes:@{NSFontAttributeName : font, NSParagraphStyleAttributeName : style} context:nil];
    CGRect calFrame = CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height);
    return calFrame.size;
}

#pragma mark - 汉字相关操作

/** 汉字转拼音*/
+ (NSString*)ls_chineseToPinyin:(NSString*)chineseString {
    NSMutableString *pinyin = [chineseString mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    return [[pinyin lowercaseString] stringByReplacingOccurrencesOfString:@" " withString:@""];
}

/** 汉字转带声调的拼音*/
+ (NSString *)ls_chineseToPinyinWithShengDiao:(NSString *)chineseString {
    NSMutableString *string = [chineseString mutableCopy];
    CFStringTransform((CFMutableStringRef)string, NULL, kCFStringTransformMandarinLatin, NO);
    
    return string;
}

/** 检测是否是汉字输入*/
+ (BOOL)ls_isChinese:(NSString *)chineseString {
    unichar c = [chineseString characterAtIndex:0];
    if (c >=0x4E00 && c <=0x9FFF) {
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - 常规校验

/**
 手机号是否合法

 @param telNumber 手机号
 @return 是否合法
 */
+ (BOOL)ls_checkTelNumberValidate:(NSString *)telNumber {
    NSString* number = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];
    return [numberPre evaluateWithObject:telNumber];
}

/**
 身份证号是否合法

 @param identityNum 身份证号
 @return 是否合法
 */
+ (BOOL)ls_checkIdentityValidate:(NSString *)identityNum {
    BOOL flag;
    if (identityNum.length <= 0) {
        flag = NO;
        return flag;
    }

    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityNum];
}



/**
 获取当前时间

 @return 返回时间
 */
+ (NSString *)ls_getCurrentTime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    NSString *startTime = dateTime;
    return startTime;
}

#pragma mark - 标识符获取

+ (NSString *)ls_getMacString {
    int mib[6];
    size_t len;
    char *buf;
    unsigned char *ptr;
    struct if_msghdr *ifm;
    struct sockaddr_dl *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        free(buf);
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *macString = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                           *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return macString;
}

// 获取idfa标示
+ (NSString *)ls_getIdfaString {
    
    NSBundle *adSupportBundle = [NSBundle bundleWithPath:@"/System/Library/Frameworks/AdSupport.framework"];
    [adSupportBundle load];
    
    if (adSupportBundle == nil) {
        return @"";
    }
    else{
        Class asIdentifierMClass = NSClassFromString(@"ASIdentifierManager");
        if(asIdentifierMClass == nil){
            return @"";
        }
        else {
            ASIdentifierManager *asIM = [[asIdentifierMClass alloc] init];
            if (asIM == nil) {
                return @"";
            }
            else{
                if(asIM.advertisingTrackingEnabled){
                    return [asIM.advertisingIdentifier UUIDString];
                }
                else{
                    return [asIM.advertisingIdentifier UUIDString];
                }
            }
        }
    }
}

// 获取idfv标示
+ (NSString *)ls_getIdfvString {
    if([[UIDevice currentDevice] respondsToSelector:@selector(identifierForVendor)]) {
        return [[UIDevice currentDevice].identifierForVendor UUIDString];
    }
    return @"";
}
// 自动生成属性声明的代码
+ (void)jd_propertyCodeWithDictionary:(NSDictionary *)dict
{
    NSMutableString *strM = [NSMutableString string];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSString *str;
        NSLog(@"%@",[obj class]);
        
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFString")]||
            [obj isKindOfClass:NSClassFromString(@"NSTaggedPointerString")]||
            [obj isKindOfClass:NSClassFromString(@"__NSCFConstantString")])
        {
            str =[NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;",key];
        }
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")]) {
            
            str = [NSString stringWithFormat:@"@property (nonatomic, assign) int %@;",key];
        }
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFArray")]) {
            
            str = [NSString stringWithFormat:@"@property (nonatomic, copy) NSArray *%@;",key];
        }
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFDictionary")]) {
            
            str = [NSString stringWithFormat:@"@property (nonatomic, copy) NSDictionary *%@;",key];
        }
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            
            str = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;",key];
        }
        [strM appendFormat:@"\n%@\n",str];
        
    }];
    
    NSLog(@"%@",strM);
}

@end
