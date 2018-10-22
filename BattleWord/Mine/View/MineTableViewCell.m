//
//  MineTableViewCell.m
//  ProjectFramework
//
//  Created by apple on 2018/9/28.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "MineTableViewCell.h"

@implementation MineTableViewCell
//重写init方法构建cell内容
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = kMainbackColor;

        [self.contentView addSubview:self.headImage];
        [self.contentView addSubview:self.titleLab];
       
        [self.contentView addSubview:self.arrowImage];
        [self.contentView addSubview:self.lineView];
        
        
    }
    
    return self;
}


-(UIImageView *)headImage
{
    
    if (_headImage == nil) {
        self.headImage = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 22, 22)];
    }
    return _headImage;
}
-(UILabel *)titleLab
{
    if (_titleLab == nil) {
        //描述
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(47, 15, kScreenW/2-14, 23)];
        _titleLab.font = [UIFont systemFontOfSize:16.0f];
        _titleLab.textColor = RGB(255, 255, 255,1.0);
        //        _titleLab.backgroundColor = [UIColor redColor];
    }
    return _titleLab;
}


-(UIImageView *)arrowImage
{
    if (_arrowImage == nil) {
        
        _arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenW -25, 17, 18,18)];
        
        // _arrowImage.image = [UIImage imageNamed:@"right_arrow"];
    }
    return _arrowImage;
}
-(UIView *)lineView
{
    
    if (_lineView == nil) {
        self.lineView = [[UIImageView alloc]initWithFrame:CGRectMake(45, maxY(_titleLab)+12, kScreenW-45, 0.5)];
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
