//
//  ViewController.m
//  关键帧动画
//
//  Created by niuwan on 16/8/8.
//  Copyright © 2016年 niuwan. All rights reserved.
//

#import "ViewController.h"

#define angle2Radion(angle) ((angle) / 180.0 * M_PI)

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    [self keyframeAnimation];
    
}

- (void)keyframeAnimation {
    
    //创建帧动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    //动画的属性
    anim.keyPath = @"transform.rotation";
    
    //属性值
    anim.values = @[@(angle2Radion(-10)), @(angle2Radion(10)), @(angle2Radion(-10))];
    
    //重发次数
    anim.repeatCount = MAXFLOAT;
    
    //修改锚点的位置
    //    _imageView.layer.anchorPoint = CGPointZero;
    
    [_imageView.layer addAnimation:anim forKey:nil];

}

@end
