//
//  NetWorkTools.h
//  InvestDangFinancialLc
//
//  Created by 李帅 on 2018/8/16.
//  Copyright © 2018年 yuanyutouzi. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^SuccessBlock) (id responseObject);
typedef void (^FailedBlock) (id error);

@interface NetWorkTools : NSObject
+(instancetype) sharedInstance;


/** Post 请求
param url  需要拼接入 url的后缀
param  dic  需要传入的参数


 */
-(void)PostHttpDataWithUrlStr:(NSString *)url Dic:(NSDictionary *)dic  SuccessBlock:(SuccessBlock)successBlock FailureBlock:(FailedBlock)failureBlock;





/** Get 请求 */   //暂未用到
-(void)GetHttpDataWithUrlStr:(NSString *)url Dic:(NSDictionary *)dic SuccessBlock:(SuccessBlock)successBlock FailureBlock:(FailedBlock)failureBlock;







@end
