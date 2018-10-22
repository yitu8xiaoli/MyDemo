//
//  DenominatedViewController.h
//  ProjectFramework
//
//  Created by 中链 on 2018/10/9.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "LSBaseViewController.h"

typedef void(^moneyBlock)(NSString *);
@interface DenominatedViewController : LSBaseViewController

@property (nonatomic,copy)moneyBlock mBlock;
-(void)returnMoney:(moneyBlock)mBlock;
@property (nonatomic,strong)NSString *moneyTag;

@end
