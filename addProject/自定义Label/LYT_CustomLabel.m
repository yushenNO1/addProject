//
//  LYT_CustomLabel.m
//  addProject
//
//  Created by 云盛科技 on 2017/9/20.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import "LYT_CustomLabel.h"

@interface LYT_CustomLabel ()
@property(nonatomic,retain)UISlider *progress;
@end

@implementation LYT_CustomLabel
-(UISlider *)progress{
    if (!_progress) {
        _progress = [[UISlider alloc]initWithFrame:CGRectMake(50, 550, 275, 20)];
        _progress.minimumValue = 0;
        _progress.maximumValue = 1;
        [_progress addTarget:self action:@selector(progressValueChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _progress;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //label上字体颜色区分
    [self labelHaveDifferentColor];
    
    //设置进度条线型
    [self configPmgressbarLine];
    
    //设置进度条圆形
    [self configPmgressbarCircular];
    
    [self.view addSubview:self.progress];
}
-(void)progressValueChange:(UISlider *)sender{
    NSLog(@"progressValueChange---%.2f",sender.value);
    
    UILabel *label = [self.view viewWithTag:999444111];
    [label removeFromSuperview];
    //设置进度条线型
    [self configPmgressbarLine];
    

    
    //设置进度条圆形
    [self configPmgressbarCircular];
}
-(void)labelHaveDifferentColor{
    UILabel *FontColorLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 80, 355, 60)];
    FontColorLabel.font = [UIFont systemFontOfSize:14];
    FontColorLabel.numberOfLines = 0;
    [self.view addSubview:FontColorLabel];
    FontColorLabel.text = @"[范例说明] 除了文字颜色以外，与文字对象息息相关的文字大小(size)及字体(font)是整个TextView文字实例的最后一站，这里将延续前一个范例的做法，通过按钮对象的";
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:FontColorLabel.text];
    NSRange redRange = NSMakeRange([[str string]rangeOfString:@"[范例说明]"].location, [[str string] rangeOfString:@"[范例说明]"].length);
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:redRange];
    [FontColorLabel setAttributedText:str];
    [FontColorLabel sizeToFit];
}



-(void)configPmgressbarLine{
    
    UILabel * label = [[ UILabel alloc]initWithFrame:CGRectMake(50, 200, 210, 12)];
    label.tag = 999444111;
    [self.view addSubview:label];
    label.backgroundColor = [UIColor clearColor];
    label.layer.cornerRadius = 5;
    label.layer.masksToBounds = YES;
    label.layer.borderColor = [[UIColor colorWithRed:255/255.0 green:131/255.0 blue:34/255.0 alpha:1]CGColor];
    label.layer.borderWidth = 1.f;
    
    
    CAShapeLayer *progressLayer = [CAShapeLayer layer];//创建一个track(轨迹) shape(形状) layer
    progressLayer.frame = CGRectMake(0, 0, 200, 10);
    progressLayer.fillColor = [[UIColor clearColor]CGColor];//填充色为无色
    progressLayer.strokeColor = [[UIColor colorWithRed:255/255.0 green:131/255.0 blue:34/255.0 alpha:1]CGColor];//指定path的渲染颜色,这里可以设置任意不透明颜色
    progressLayer.opacity = 1; //背景颜色的透明度
    progressLayer.lineCap = kCALineCapRound;//指定线的边缘是圆的
    progressLayer.lineWidth = 10;//线的宽度
    [label.layer addSublayer:progressLayer];
    
    // 创建path
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    // 添加路径[1条点(100,100)到点(200,100)的线段]到path
    [path1 moveToPoint:CGPointMake(-5 , 6)];
    [path1 addLineToPoint:CGPointMake(205 * self.progress.value, 6)];
    [path1 setLineWidth: 10];
    [[UIColor colorWithRed:255/255.0 green:131/255.0 blue:34/255.0 alpha:1] setStroke];
    // 将path绘制出来
    [path1 stroke];
    progressLayer.path = [path1 CGPath];
}

-(void)configPmgressbarCircular{
    
    UIView *circularView = [[UIView alloc]initWithFrame:CGRectMake(100, 300, 200, 200)];
    circularView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:circularView];
    
    CGPoint center = CGPointMake(100, 100);     //中心坐标
    CGFloat radius = 90;                        //半径
    CGFloat start  = - M_PI_2;                  //起点设置π/2
    CGFloat end    = -M_PI_2 + M_PI * 2 * self.progress.value;   //终点设置
    
    /*
     1.获取环形路径（画一个圆形，填充色透明，设置线框宽度为10，这样就获得了一个环形）
     */
    CAShapeLayer *progressLayer = [CAShapeLayer layer];//创建一个track(轨迹) shape(形状) layer
//    progressLayer.frame = CGRectMake(0, 0, 200, 10);
    progressLayer.fillColor = [[UIColor clearColor]CGColor];//填充色为无色
    progressLayer.strokeColor = [[UIColor redColor]CGColor];//指定path的渲染颜色,这里可以设置任意不透明颜色
    progressLayer.opacity = 1; //背景颜色的透明度
    progressLayer.lineCap = kCALineCapRound;//指定线的边缘是圆的
    progressLayer.lineWidth = 10;//线的宽度
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:start endAngle:end clockwise:YES];//上面说明过了用来构建圆形
    progressLayer.path =[path CGPath]; //把path传递給layer，然后layer会处理相应的渲染，整个逻辑和CoreGraph是一致的。
    [circularView.layer addSublayer:progressLayer];
    
    
    //生成渐变色
    CALayer *gradientLayer = [CALayer layer];
    //左侧渐变色
    CAGradientLayer *leftLayer = [CAGradientLayer layer];
    leftLayer.frame = CGRectMake(0, 0, circularView.bounds.size.width / 2, circularView.bounds.size.height);
    // 分段设置渐变色
    leftLayer.locations = @[@0.3, @0.9, @1];
    leftLayer.colors = @[(id)[UIColor yellowColor].CGColor, (id)[UIColor greenColor].CGColor];
    [gradientLayer addSublayer:leftLayer];
    
    
    //右侧渐变色
    CAGradientLayer *rightLayer = [CAGradientLayer layer];
    rightLayer.frame = CGRectMake(circularView.bounds.size.width / 2, 0, circularView.bounds.size.width / 2, circularView.bounds.size.height);
    rightLayer.locations = @[@0.3, @0.9, @1];
    rightLayer.colors = @[(id)[UIColor yellowColor].CGColor, (id)[UIColor redColor].CGColor];
    [gradientLayer addSublayer:rightLayer];
    
    [gradientLayer setMask:progressLayer]; //用progressLayer来截取渐变层
    [circularView.layer addSublayer:gradientLayer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
