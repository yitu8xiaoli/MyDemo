//
//  NodeTableViewCell.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/8.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "NodeTableViewCell.h"

@implementation NodeTableViewCell
//重写init方法构建cell内容
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = kCellbackColor;
        
        [self.contentView addSubview:self.titleLab];
        
        [self.contentView addSubview:self.lineView];
        
        
    }
    
    return self;
}

-(UILabel *)titleLab
{
    if (_titleLab == nil) {
        //描述
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, kScreenW/2-14, 23)];
        _titleLab.font = [UIFont systemFontOfSize:14.0f];
        _titleLab.textColor = RGB(255, 255, 255,1.0);
        //        _titleLab.backgroundColor = [UIColor redColor];
    }
    return _titleLab;
}

-(UIView *)lineView
{
    
    if (_lineView == nil) {
        self.lineView = [[UIImageView alloc]initWithFrame:CGRectMake(15, maxY(_titleLab)+12, kScreenW-15, 0.5)];
        self.lineView.backgroundColor = RGB(255, 255, 255,0.5);
        self.lineView.alpha = 0.5;
    }
    return _lineView;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
