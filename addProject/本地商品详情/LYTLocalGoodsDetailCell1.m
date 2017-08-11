//
//  LYTLocalGoodsDetailCell1.m
//  addProject
//
//  Created by 云盛科技 on 2017/8/7.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import "LYTLocalGoodsDetailCell1.h"

@implementation LYTLocalGoodsDetailCell1

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.YLabel];
        [self addSubview:self.moneyLabel];
        [self addSubview:self.countLabel];
        [self addSubview:self.goBuy];
    }
    return self;
}
-(UILabel *)YLabel{
    if (!_YLabel) {
        _YLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 100, 20)];
        _YLabel.font = [UIFont systemFontOfSize:16];
        _YLabel.text = @"¥";
    }
    return _YLabel;
}
-(UILabel *)moneyLabel{
    if (!_moneyLabel) {
        _moneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 10, 70, 30)];
        _moneyLabel.font = [UIFont systemFontOfSize:23];
        _moneyLabel.text = @"989";
    }
    return _moneyLabel;
}
-(UILabel *)countLabel{
    if (!_countLabel) {
        _countLabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 20, 100, 20)];
        _countLabel.font = [UIFont systemFontOfSize:14];
        _countLabel.text = @"已售200";
    }
    return  _countLabel;
}
-(UIButton *)goBuy{
    if (!_goBuy) {
        _goBuy = [UIButton buttonWithType:UIButtonTypeCustom];
        _goBuy.frame = CGRectMake(375 - 100, 10, 90, 30);
        _goBuy.backgroundColor = [UIColor colorWithRed:255/255.0 green:64/255.0 blue:98/255.0 alpha:1];
        _goBuy.layer.cornerRadius = 5;
        _goBuy.layer.masksToBounds = YES;
        [_goBuy setTitle:@"立即购买" forState:UIControlStateNormal];
        _goBuy.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _goBuy;
}


@end
