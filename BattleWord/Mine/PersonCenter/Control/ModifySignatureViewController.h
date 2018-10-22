//
//  ModifySignatureViewController.h
//  ProjectFramework
//
//  Created by 中链 on 2018/10/9.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "LSBaseViewController.h"

typedef void(^returnSignBlock)(NSString *);
@interface ModifySignatureViewController : LSBaseViewController

@property (nonatomic,copy)returnSignBlock signBlock;

-(void)returnSign:(returnSignBlock)signBlock;

@end
