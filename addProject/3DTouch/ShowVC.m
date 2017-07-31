//
//  ShowVC.m
//  满意
//
//  Created by 云盛科技 on 2016/10/20.
//  Copyright © 2016年 云盛科技. All rights reserved.
//

#import "ShowVC.h"

@interface ShowVC ()
@property(nonatomic,retain)UILabel *pressLabel;

@end

@implementation ShowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, self.view.bounds.size.width-100, 40)];
    label.text = _Str;
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
    _pressLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, 200, 40)];
//    label.text = _Str;
    [self.view addSubview:_pressLabel];
    

    
}
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    // setup a list of preview actions
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"你瞅啥" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Aciton1");
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"瞅你咋滴" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Aciton2");
    }];
    
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"再瞅一个看看" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Aciton3");
    }];
    
    NSArray *actions = @[action1,action2,action3];
    
    // and return them (return the array of actions instead to see all items ungrouped)
    return actions;
}

//按住移动or压力值改变时的回调
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"------");
    NSArray *arrayTouch = [touches allObjects];
    UITouch *touch = (UITouch *)[arrayTouch lastObject];
    //通过tag确定按压的是哪个view，注意：如果按压的是label，将label的userInteractionEnabled属性设置为YES
//    if (touch.view.tag == 105) {
        NSLog(@"move压力 ＝ %f",touch.force);
        //红色背景的label显示压力值
        _pressLabel.text = [NSString stringWithFormat:@"压力%f",touch.force];
        //红色背景的label上移的高度＝压力值*100
//        _bottom.constant = ((UITouch *)[arrayTouch lastObject]).force * 100;
//    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
