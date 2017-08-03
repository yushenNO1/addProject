//
//  LYTSudokuView.h
//  addProject
//
//  Created by 云盛科技 on 2017/8/3.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LYTSudokuBtnSelectSingle,
    LYTSudokuBtnSelectMultiple,
} LYTSudokuBtnSelectType;


@interface LYTSudokuView : UIView

//第几块
@property(nonatomic,assign)NSInteger selectIndex;


@property(nonatomic,assign)LYTSudokuBtnSelectType selectType;
@property(nonatomic,copy)void (^frame_hight)(float hight);


-(void)configViewWithDataArr:(NSArray *)arr;

@end
