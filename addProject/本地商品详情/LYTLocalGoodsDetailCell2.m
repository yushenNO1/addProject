//
//  LYTLocalGoodsDetailCell2.m
//  addProject
//
//  Created by 云盛科技 on 2017/8/7.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import "LYTLocalGoodsDetailCell2.h"

@implementation LYTLocalGoodsDetailCell2

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.duiImg];
        [self addSubview:self.duiImg1];
        [self addSubview:self.label];
        [self addSubview:self.label1];
    }
    return self;
}
-(UIImageView *)duiImg{
    if (!_duiImg) {
        _duiImg = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 15 , 15)];
        _duiImg.backgroundColor = [UIColor redColor];
    }
    return _duiImg;
}
-(UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, 100, 15)];
        _label.font = [UIFont systemFontOfSize:14];
        _label.text = @"随时退";
    }
    return  _label;
}
-(UIImageView *)duiImg1{
    if (!_duiImg1) {
        _duiImg1 = [[UIImageView alloc]initWithFrame:CGRectMake(15, 35, 15 , 15)];
        _duiImg1.backgroundColor = [UIColor redColor];
    }
    return _duiImg1;
}
-(UILabel *)label1{
    if (!_label1) {
        _label1 = [[UILabel alloc]initWithFrame:CGRectMake(40, 35, 200, 15)];
        _label1.font = [UIFont systemFontOfSize:14];
        _label1.text = @"过期自动退";
    }
    return  _label1;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
