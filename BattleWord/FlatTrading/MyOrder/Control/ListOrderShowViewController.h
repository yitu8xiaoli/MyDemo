//
//  ListOrderShowViewController.h
//  ProjectFramework
//
//  Created by 中链 on 2018/10/16.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "LSBaseViewController.h"
#import "ZJScrollPageViewDelegate.h"

@interface ListOrderShowViewController : LSBaseViewController <ZJScrollPageViewChildVcDelegate>
@property (nonatomic,strong)NSString *RecordTag;

@end
