//
//  LYTLifeTableCell2.m
//  addProject
//
//  Created by 云盛科技 on 2017/7/24.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import "LYTLifeTableCell2.h"

@implementation LYTLifeTableCell2
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.img];
        [self addSubview:self.titleLabel];
        [self addSubview:self.fromLabel];
        [self addSubview:self.contentLabel];
        [self addSubview:self.moneyLabel];
        [self addSubview:self.distanceLabel];
        [self addSubview:self.soldLabel];
    }
    return self;
}

- (UIImageView *)img
{
    if (!_img) {
        CGRect frame = CGRectMake(10 * kScreenWidth1, 10* kScreenHeight1, 80 * kScreenWidth1, 80* kScreenHeight1);
        self.img = [[UIImageView alloc] init];
        _img.frame = frame;
        _img.backgroundColor = [UIColor blackColor];
    }
    return _img;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        CGRect frame = CGRectMake(100 * kScreenWidth1, 10* kScreenHeight1, 175 * kScreenWidth1, 20* kScreenHeight1);
        _titleLabel = [[UILabel alloc]initWithFrame:frame];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor colorWithRed:78 / 255.0 green:78 / 255.0 blue:78 / 255.0 alpha:1];
        _titleLabel.text = @"小魔仙服装有限公司";
    }
    return _titleLabel;
}

- (UILabel *)fromLabel {
    if (!_fromLabel) {
        CGRect frame = CGRectMake(100 * kScreenWidth1, 30* kScreenHeight1, 30 * kScreenWidth1, 16* kScreenHeight1);
        _fromLabel = [[UILabel alloc]initWithFrame:frame];
        _fromLabel.backgroundColor = [UIColor colorWithRed:249/255.0 green:130/255.0 blue:62/255.0 alpha:1.0];
        _fromLabel.font = [UIFont systemFontOfSize:12];
        _fromLabel.textColor = [UIColor whiteColor];
        _fromLabel.textAlignment = NSTextAlignmentCenter;
        _fromLabel.layer.cornerRadius = 2;
        _fromLabel.layer.masksToBounds = YES;
        _fromLabel.text = @"自营";
    }
    return _fromLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        CGRect frame = CGRectMake(100 * kScreenWidth1, 46* kScreenHeight1, 175 * kScreenWidth1, 20* kScreenHeight1);
        _contentLabel = [[UILabel alloc]initWithFrame:frame];
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.textColor = [UIColor colorWithRed:78 / 255.0 green:78 / 255.0 blue:78 / 255.0 alpha:1];
        _contentLabel.text = @"小魔仙服装有限公司";
    }
    return _contentLabel;
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        CGRect frame = CGRectMake(100 * kScreenWidth1, 60* kScreenHeight1, 175 * kScreenWidth1, 30* kScreenHeight1);
        _moneyLabel = [[UILabel alloc]initWithFrame:frame];
        _moneyLabel.font = [UIFont systemFontOfSize:18];
        _moneyLabel.textColor = [UIColor colorWithRed:78 / 255.0 green:78 / 255.0 blue:78 / 255.0 alpha:1];
        _moneyLabel.text = @"¥98";
    }
    return _moneyLabel;
}

- (UILabel *)distanceLabel {
    if (!_distanceLabel) {
        CGRect frame = CGRectMake(200 * kScreenWidth1, 10* kScreenHeight1, 165 * kScreenWidth1, 20* kScreenHeight1);
        _distanceLabel = [[UILabel alloc]initWithFrame:frame];
        _distanceLabel.font = [UIFont systemFontOfSize:12];
        _distanceLabel.textColor = [UIColor colorWithRed:78 / 255.0 green:78 / 255.0 blue:78 / 255.0 alpha:1];
        _distanceLabel.textAlignment = NSTextAlignmentRight;
        _distanceLabel.text = @"6.7km";
    }
    return _distanceLabel;
}

- (UILabel *)soldLabel {
    if (!_soldLabel) {
        CGRect frame = CGRectMake(200 * kScreenWidth1, 70* kScreenHeight1, 165 * kScreenWidth1, 20* kScreenHeight1);
        _soldLabel = [[UILabel alloc]initWithFrame:frame];
        _soldLabel.font = [UIFont systemFontOfSize:12];
        _soldLabel.textColor = [UIColor colorWithRed:78 / 255.0 green:78 / 255.0 blue:78 / 255.0 alpha:1];
        _soldLabel.textAlignment = NSTextAlignmentRight;
        _soldLabel.text = @"已售200";
    }
    return _soldLabel;
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
