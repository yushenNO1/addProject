//
//  LYTSortChildVC.h
//  addProject
//
//  Created by 云盛科技 on 2017/7/26.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYTSortChildVC : UITableViewController
@property(nonatomic,assign)int index;

@property(nonatomic,copy)void(^tableOffset)(double offset);
@property(nonatomic,copy)void(^addBtnClick)(CGRect rect,UIButton *sender);
@end
