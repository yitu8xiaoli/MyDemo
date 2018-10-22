//
//  NetWorkTools.m
//  InvestDangFinancialLc
//
//  Created by 李帅 on 2018/8/16.
//  Copyright © 2018年 yuanyutouzi. All rights reserved.
//

#import "NetWorkTools.h"
#import "AFHTTPSessionManager.h"
#import <SAMKeychain.h>
#import "CXDDes_UzHDbIVDOoYuYuanObj.h"


#define SecretKey @"12345678"///aes加密key
#define kSystemVersion             [[UIDevice currentDev∫ice] systemVersion]
static NetWorkTools *_instance = nil;

//测试地址
static NSString * const TestUrl = @"http://app-api.test.ddanglc.com";

//正式地址//
static NSString * const NormalUrl = @"http://app-api.paipailicai.cn";

@implementation NetWorkTools


#pragma 我重写allocWithZone，为了只分配一次内存，如果重写，类方法和alloc init创建的单例分配的内存可能不一样。就不是真正意义上的单利
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone ];
        
    });
    return _instance;
    
}
+(instancetype) sharedInstance
{
    if (_instance == nil)
    {
        _instance = [[super alloc]init];
        
    }
    return _instance;
    
}

#pragma 为防止copy出现内存可能不一样的问题,还要重写copyWithZone``mutableCopyWithZone
-(id)copyWithZone:(NSZone *)zone
{
    return _instance;
    
}
-(id)mutableCopyWithZone:(NSZone *)zone
{
    return _instance;
}

#pragma post 请求
-(void)PostHttpDataWithUrlStr:(NSString *)url Dic:(NSDictionary *)dic SuccessBlock:(SuccessBlock)successBlock FailureBlock:(FailedBlock)failureBlock
{
//    //处理公共参数
    //准备参数
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970];
    long long totalMilliseconds = interval*1000;//获取时间戳
    NSString *SERVICE_NAME = @"stone";
    NSString *deviceId = [SAMKeychain passwordForService:SERVICE_NAME account:@"UUID"];
    if (deviceId == nil) {
        deviceId = [NSUUID UUID].UUIDString;
        [SAMKeychain setPassword:deviceId forService:SERVICE_NAME account:@"UUID"];
    }//获取uuid
    NSDictionary *submitDic = @{
                                @"versionName":@"2.3.1",//版本名称
                                @"appType":@"1001",//app类型
                                @"deviceType":@"1",//1代表iOS 2代表安卓
                                @"timestamp":@(totalMilliseconds),//时间戳
                                @"deviceSerialId":deviceId,//设备序列号
                                @"supperUserId":@"",//推广来源ID
                                @"channel":@"AppStore",//渠道
                                @"phoneSystemVersion":kSystemVersion,//手机系统版本
                                @"deviceUniqueId":@""//ios 的 idfa
                                };
    //----将接口需要提交参数合并入一个字典中
    NSMutableDictionary *parametersDic = [submitDic mutableCopy];
    [parametersDic addEntriesFromDictionary:dic];
    /** 将参数格式处理为服务器要求格式,并进行aes加密 **/
    NSDictionary *encryptionDic = [self encryptionParameters:parametersDic];
    /** 添加一个字段,告诉服务器是测试环境还是线上环境 **/
    NSMutableDictionary *isEncDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Y",@"isEnc", nil];
    [isEncDic addEntriesFromDictionary:encryptionDic];
    /** AFN相关设置  **/
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions: NSJSONReadingMutableContainers];//返回格式类型设置
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain", nil];//如果接收类型不一致请替换一致
    /**请求接口拼接**/
    NSString *subStr = [NSString stringWithFormat:@"%@%@",NormalUrl,url];
    [manager POST:subStr parameters:isEncDic progress:^(NSProgress * _Nonnull uploadProgress)
    {} success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        /** 成功处理事件的回调 */
        if (successBlock)
        {
            NSString *isEnc = kFormat(@"%@", responseObject[@"isEnc"]);
            NSString *resText = kFormat(@"%@", responseObject[@"resText"]);
            //正式环境,需要进行解密
            if([isEnc isEqualToString:@"Y"])
            {///des解密
                if(resText.length){
                    NSString *jsonStr = [CXDDes_UzHDbIVDOoYuYuanObj decode:resText key:kDesKey];
                    NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
                    responseObject = [NSJSONSerialization JSONObjectWithData:data
                                                                     options:NSJSONReadingMutableContainers
                                                                       error:nil];
                    successBlock(responseObject);//解密后返回
                }else{
                    NSError * error = [[NSError alloc]initWithDomain:NSXMLParserErrorDomain
                                                                code:10000
                                                            userInfo:@{NSLocalizedDescriptionKey:@"数据异常"}];
                    if(failureBlock){
                        failureBlock(error);
                    }
                }
            }else{
                //测试环境
                successBlock(responseObject);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        /** 失败事件的回调 */
        if (failureBlock)
        { failureBlock(error);
            failureBlock(error);
        }
    } ];
}

/** Get 请求 */
-(void)GetHttpDataWithUrlStr:(NSString *)url Dic:(NSDictionary *)dic SuccessBlock:(SuccessBlock)successBlock FailureBlock:(FailedBlock)failureBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"text/html",@"text/plain",nil];
    [manager GET:url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress)
    {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject)
    {
        /** 这里是处理事件的回调 */
        if (successBlock) { successBlock(responseObject);
            
        }
        
    }failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        /** 这里是处理事件的回调 */
        if (failureBlock)
        { failureBlock(error);
            
        }
    } ];
}

#pragma mark 对数据格式进行相关处理,符合上传服务器要求
- (id)encryptionParameters:(NSDictionary *)dic { ///加密
    NSMutableArray *parts = [NSMutableArray array];
    for (NSString *key in [dic allKeys]) {
        NSString *part = [NSString stringWithFormat:@"%@=%@", key, [dic valueForKey:key]];
        [parts addObject: part];
    }
    NSDictionary *encryptionDic = [NSDictionary dictionaryWithObject:[[parts componentsJoinedByString: @"&"] aes128WithBase64Etencrypt:SecretKey] forKey:@"content"];
    return encryptionDic;
}








@end
