//
//  LYTSudokuView.h
//  addProject
//
//  Created by 云盛科技 on 2017/8/3.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LYTSudokuView;

@protocol LYTSudokuDelegate 

-(void)clickBtnIndex:(NSInteger)index WithBtnInfo:(NSString *)info changeView:(LYTSudokuView *)sudokuView;

@end


typedef enum : NSUInteger {
    LYTSudokuBtnSelectSingle,
    LYTSudokuBtnSelectMultiple,
} LYTSudokuBtnSelectType;


@interface LYTSudokuView : UIView<LYTSudokuDelegate>

//第几块
@property(nonatomic,assign)NSInteger selectIndex;
//显示view高度
@property(nonatomic,assign)NSInteger viewHight;
//存储路径数组
@property(nonatomic,retain)NSArray *routeArr;

@property(nonatomic,assign)LYTSudokuBtnSelectType selectType;


@property(nonatomic,retain)id <LYTSudokuDelegate>delegate;


-(void)configViewWithDataArr:(NSArray *)arr selectIndex:(NSInteger)index;

@end
