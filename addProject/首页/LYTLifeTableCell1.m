//
//  LYTLifeTableCell1.m
//  addProject
//
//  Created by 云盛科技 on 2017/7/24.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import "LYTLifeTableCell1.h"

@implementation LYTLifeTableCell1


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.btn1];
        [self addSubview:self.btn2];
        [self addSubview:self.btn3];
        [self addSubview:self.btn4];
    }
    return self;
}
-(UIButton *)btn1{
    if (!_btn1) {
        _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn1.frame = CGRectMake(3, 3, 183, 100);
        _btn1.backgroundColor = [UIColor redColor];
        _btn1.layer.cornerRadius = 3;
        _btn1.layer.masksToBounds = YES;
    }
    return _btn1;
}
-(UIButton *)btn2{
    if (!_btn2) {
        _btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn2.frame = CGRectMake(189, 3, 183, 100);
        _btn2.backgroundColor = [UIColor redColor];
        _btn2.layer.cornerRadius = 3;
        _btn2.layer.masksToBounds = YES;
    }
    return _btn2;
}
-(UIButton *)btn3{
    if (!_btn3) {
        _btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn3.frame = CGRectMake(3, 106, 183, 100);
        _btn3.backgroundColor = [UIColor redColor];
        _btn3.layer.cornerRadius = 3;
        _btn3.layer.masksToBounds = YES;
    }
    return _btn3;
}
-(UIButton *)btn4{
    if (!_btn4) {
        _btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn4.frame = CGRectMake(189, 106, 183, 100);
        _btn4.backgroundColor = [UIColor redColor];
        _btn4.layer.cornerRadius = 3;
        _btn4.layer.masksToBounds = YES;
    }
    return _btn4;
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
