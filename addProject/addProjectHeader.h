//
//  addProjectHeader.h
//  addProject
//
//  Created by 云盛科技 on 2017/7/31.
//  Copyright © 2017年 神廷. All rights reserved.
//

#ifndef addProjectHeader_h
#define addProjectHeader_h

//添加常用的宏
#define kScreenWidth        [[UIScreen mainScreen] bounds].size.width           //屏宽
#define kScreenHeight       [[UIScreen mainScreen] bounds].size.height          //屏高
#define kScreenWidth1       ([UIScreen mainScreen].bounds.size.width / 375)     //适配宽度
#define kScreenHeight1      ([UIScreen mainScreen].bounds.size.height / 667)    //适配高度

#define WDH_CGRectMake(x,y,width,height)        CGRectMake((x) * kScreenWidth1, (y) * kScreenHeight1, (width) * kScreenWidth1, (height) * kScreenHeight1)




//添加经常用到的第三方库
#import <AFNetworking.h>            //网络加载
#import <MJRefresh.h>               //刷新加载
#import <UIImageView+WebCache.h>    //图片加载
#import <SVProgressHUD.h>           //加载时的菊花圈
#import <SDCycleScrollView.h>       //轮播图





//自己的封装
#import "LYTBackView.h"             //弹出蒙板
#import "LYTPrivatelyToors.h"       //封装的私有方法
#import "LYTFMDB.h"                 //数据库使用
#import "WDHRequest.h"


#endif /* addProjectHeader_h */
