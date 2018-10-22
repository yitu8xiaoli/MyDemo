//
//  PaymentTableViewCell.m
//  ProjectFramework
//
//  Created by 中链 on 2018/9/30.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "PaymentTableViewCell.h"

@implementation PaymentTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = kCellbackColor;
        
        [self.contentView addSubview:self.headImage];
        
        [self.contentView addSubview:self.styleNameLab];
        [self.contentView addSubview:self.nameLab];
        [self.contentView addSubview:self.accountLab];

        
        
    }
    
    return self;
}

-(UIImageView *)headImage
{
    
    if (_headImage == nil) {
        self.headImage = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 16, 16)];
    }
    return _headImage;
}
-(UILabel *)styleNameLab
{
    if (_styleNameLab == nil) {
        //描述
        _styleNameLab = [[UILabel alloc] initWithFrame:CGRectMake(maxX(self.headImage)+12, 11, kScreenW - 60, 23)];
        _styleNameLab.font = [UIFont systemFontOfSize:16.0f];
        _styleNameLab.textColor = RGB(255, 255, 255,0.87);
    }
    return _styleNameLab;
}
-(UILabel *)accountLab
{
    if (_accountLab == nil) {
        //描述
        _accountLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(self.styleNameLab)+14, kScreenW - 30, 25)];
        _accountLab.font = [UIFont systemFontOfSize:18.0f];
        _accountLab.textColor = RGB(255, 255, 255,0.87);
    }
    return _accountLab;
}
-(UILabel *)nameLab
{
    if (_nameLab == nil) {
        //描述
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(self.accountLab)+10, kScreenW - 60, 10)];
        _nameLab.font = [UIFont systemFontOfSize:14.0f];
        _nameLab.textColor = RGB(255, 255, 255,0.56);
    }
    return _nameLab;
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
