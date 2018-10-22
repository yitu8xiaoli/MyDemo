//
//  ModifyNameViewController.h
//  ProjectFramework
//
//  Created by 中链 on 2018/10/9.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "LSBaseViewController.h"

typedef void(^returnNameText)(NSString *);
@interface ModifyNameViewController : LSBaseViewController
@property (nonatomic,copy)returnNameText returnText;

-(void)returnText:(returnNameText)block;

@end
