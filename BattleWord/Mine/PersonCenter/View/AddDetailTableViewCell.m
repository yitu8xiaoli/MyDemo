//
//  AddDetailTableViewCell.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/9.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "AddDetailTableViewCell.h"

@implementation AddDetailTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = kCellbackColor;
        
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.titleDetailLab];
        
        
        
    }
    
    return self;
}
-(UILabel *)titleLab
{
    if (_titleLab == nil) {
        //描述
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 11, kScreenW-30, 25)];
        _titleLab.font = [UIFont systemFontOfSize:18.0f];
        _titleLab.textColor = RGB(255, 255, 255,1.0);
        //        _titleLab.backgroundColor = [UIColor redColor];
    }
    return _titleLab;
}
-(UILabel *)titleDetailLab
{
    if (_titleDetailLab == nil) {
        //描述
        _titleDetailLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(_titleLab)+3, kScreenW-30, 17)];
        _titleDetailLab.font = [UIFont systemFontOfSize:12.0f];
        _titleDetailLab.textColor = RGB(255, 255, 255,1.0);
        //        _titleLab.backgroundColor = [UIColor redColor];
    }
    return _titleDetailLab;
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
