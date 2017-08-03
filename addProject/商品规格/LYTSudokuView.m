//
//  LYTSudokuView.m
//  addProject
//
//  Created by 云盛科技 on 2017/8/3.
//  Copyright © 2017年 神廷. All rights reserved.
//



#import "LYTSudokuView.h"

@interface LYTSudokuBtn : UIButton

@property(nonatomic,assign)BOOL LYTIsSelect;

@end
@implementation LYTSudokuBtn

+(instancetype)buttonWithType:(UIButtonType)buttonType{
    LYTSudokuBtn *btn = [super buttonWithType:buttonType];
    if (btn) {
        btn.LYTIsSelect = NO;
    }
    return btn;
}

@end


@interface LYTSudokuView()

@property(nonatomic,retain)NSMutableArray *btnArr;

@end

@implementation LYTSudokuView

-(NSMutableArray *)btnArr{
    if (!_btnArr) {
        _btnArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _btnArr;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.selectType = LYTSudokuBtnSelectSingle;
    }
    return self;
}

-(void)configViewWithDataArr:(NSArray *)arr{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 20)];
    titleLabel.text = @"标题";
    titleLabel.font = [UIFont systemFontOfSize:18];
    [self addSubview:titleLabel];
    
    double location_X = 10 ;
    double location_Y = 40 ;
    NSLog(@"_btnTitleArr---%@",arr);
    for (int i = 0; i < arr.count; i ++) {
        LYTSudokuBtn *btn = [LYTSudokuBtn buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor grayColor];
        btn.layer.borderWidth = 1.0f;
        btn.layer.borderColor = [[UIColor redColor]CGColor];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget: self action:@selector(LYTSudokuBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnArr addObject:btn];
        
        CGRect strRect = [arr[i] boundingRectWithSize:CGSizeMake(0, 20) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
//        NSLog(@"strRect---%@",NSStringFromCGRect(strRect));
        double XLoc = location_X + strRect.size.width + 20;
        NSLog(@"XLoc---%f    self----%f",XLoc,self.frame.size.width);
        if (XLoc <= self.frame.size.width) {
            btn.frame = CGRectMake(location_X , location_Y, strRect.size.width + 10, 20);
            location_X = location_X + strRect.size.width + 20;
        }else{
            location_Y = location_Y + 30;
            location_X = 10;
            btn.frame = CGRectMake(location_X , location_Y, strRect.size.width + 10, 20);
            location_X = location_X + strRect.size.width + 20;
        }
        
        NSLog(@"btn.frame-----%@",NSStringFromCGRect(btn.frame));
        [self addSubview:btn];

    }
//    self.frame = CGRectMake(0, 0, self.frame.size.width, location_Y + 20);
    NSLog(@"最后的高度---%f",location_Y + 20);
    
    self.frame_hight(location_Y + 20);
    
}
-(void)LYTSudokuBtnClick:(LYTSudokuBtn *)sender{
    
    if ((self.selectType == LYTSudokuBtnSelectSingle)) {
        for (UIButton *btn in self.btnArr) {
            btn.backgroundColor = [UIColor grayColor];
            
        }
        sender.backgroundColor = [UIColor yellowColor];
    }else{
        sender.LYTIsSelect = !sender.LYTIsSelect;
        if (sender.LYTIsSelect) {
            sender.backgroundColor = [UIColor yellowColor];
        }else{
            sender.backgroundColor = [UIColor grayColor];
        }
    }
    
    
    
    
}
@end
