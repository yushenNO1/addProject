//
//  LYTLocalGoodsDetailCell4.m
//  addProject
//
//  Created by 云盛科技 on 2017/8/7.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import "LYTLocalGoodsDetailCell4.h"

@implementation LYTLocalGoodsDetailCell4

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.countLabel];
        [self addSubview:self.moneyLabel];
    }
    return self;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 5, 120, 20)];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.text = @"套餐内容标题";
    }
    return _titleLabel;
}
-(UILabel *)countLabel{
    if (!_countLabel) {
        _countLabel = [[UILabel alloc]initWithFrame:CGRectMake(135, 5, 120, 20)];
        _countLabel.font = [UIFont systemFontOfSize:14];
        _countLabel.textAlignment = NSTextAlignmentCenter;
        _countLabel.text = @"2份";
    }
    return _countLabel;
}
-(UILabel *)moneyLabel{
    if (!_moneyLabel) {
        _moneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(255, 5, 95, 20)];
        _moneyLabel.font = [UIFont systemFontOfSize:14];
        _moneyLabel.textAlignment = NSTextAlignmentRight;
        _moneyLabel.text = @"¥99";
    }
    return  _moneyLabel;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
