//
//  VersionInstructionsTableViewCell.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/8.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "VersionInstructionsTableViewCell.h"

@implementation VersionInstructionsTableViewCell
//重写init方法构建cell内容
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = kCellbackColor;
        
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.titleShowLab];
        [self.contentView addSubview:self.arrowImage];
        [self.contentView addSubview:self.lineView];
        
        
    }
    
    return self;
}

-(UILabel *)titleLab
{
    if (_titleLab == nil) {
        //描述
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 11, kScreenW/2-15, 23)];
        _titleLab.font = [UIFont systemFontOfSize:16.0f];
        _titleLab.textColor = RGB(255, 255, 255,1.0);
        //        _titleLab.backgroundColor = [UIColor redColor];
    }
    return _titleLab;
}
-(UILabel *)titleShowLab
{
    if (_titleShowLab == nil) {
        //描述
        _titleShowLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(_titleLab), kScreenW/2-15, 17)];
        _titleShowLab.font = [UIFont systemFontOfSize:12.0f];
        _titleShowLab.textColor = RGB(255, 255, 255,0.5);
        _titleShowLab.textAlignment = NSTextAlignmentLeft;
        //        _titleLab.backgroundColor = [UIColor redColor];
    }
    return _titleShowLab;
}

-(UIImageView *)arrowImage
{
    if (_arrowImage == nil) {
        
        _arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenW -25, 24, 18, 18)];
        
        // _arrowImage.image = [UIImage imageNamed:@"right_arrow"];
    }
    return _arrowImage;
}

-(UIView *)lineView
{
    
    if (_lineView == nil) {
        self.lineView = [[UIImageView alloc]initWithFrame:CGRectMake(15, maxY(_titleShowLab)+10, kScreenW-15, 0.5)];
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
