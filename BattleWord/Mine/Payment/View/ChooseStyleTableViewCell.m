//
//  ChooseStyleTableViewCell.m
//  ProjectFramework
//
//  Created by 中链 on 2018/9/30.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "ChooseStyleTableViewCell.h"

@implementation ChooseStyleTableViewCell
//重写init方法构建cell内容
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = kCellbackColor;

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
        self.headImage = [[UIImageView alloc]initWithFrame:CGRectMake(15, 17, 16, 16)];
    }
    return _headImage;
}
-(UILabel *)titleLab
{
    if (_titleLab == nil) {
        //描述
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(maxX(_headImage)+12, 14, kScreenW/2-14, 23)];
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
        self.lineView = [[UIImageView alloc]initWithFrame:CGRectMake(43, maxY(_titleLab)+13, kScreenW-43, 0.5)];
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
