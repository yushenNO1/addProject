//
//  LYTLocalGoodsDetailCell3.m
//  addProject
//
//  Created by 云盛科技 on 2017/8/7.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import "LYTLocalGoodsDetailCell3.h"

@implementation LYTLocalGoodsDetailCell3

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.adressLabel];
        [self addSubview:self.detailAdress];
        [self addSubview:self.line];
        [self addSubview:self.teleBtn];
    }
    return self;
}
-(UILabel *)adressLabel{
    if (!_adressLabel) {
        _adressLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, 200, 20)];
        _adressLabel.font = [UIFont systemFontOfSize:16];
        _adressLabel.text = @"商家店铺名称";
    }
    return _adressLabel;
}
-(UILabel *)detailAdress{
    if (!_detailAdress) {
        _detailAdress = [[UILabel alloc]initWithFrame:CGRectMake(15, 30, 200, 20)];
        _detailAdress.font = [UIFont systemFontOfSize:14];
        _detailAdress.text = @"商家详细地址";
    }
    return _detailAdress;
}
-(UILabel *)line{
    if (!_line) {
        _line = [[UILabel alloc]initWithFrame:CGRectMake(314, 10, 1, 40)];
        _line.backgroundColor = [UIColor grayColor];
    }
    return  _line;
}
-(UIButton *)teleBtn{
    if (!_teleBtn) {
        _teleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _teleBtn.frame = CGRectMake(325, 10, 40, 40);
        _teleBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:64/255.0 blue:98/255.0 alpha:1];
    }
    return _teleBtn;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
