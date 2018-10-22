//
//  IntervalTableViewCell.h
//  ProjectFramework
//
//  Created by 中链 on 2018/10/17.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntervalTableViewCell : UITableViewCell

@property (nonatomic,strong)UILabel *titleLab;
@property (nonatomic,strong)UITextField *beginText;;
@property (nonatomic,strong)UITextField *allText;;
@property (nonatomic, strong) UIView *lineOneView;
@property (nonatomic,strong)UILabel *otherLab;

@property (nonatomic, strong) UIView *lineView;
@end
