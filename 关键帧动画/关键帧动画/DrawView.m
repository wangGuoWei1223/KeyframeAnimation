//
//  DrawView.m
//  关键帧动画
//
//  Created by niuwan on 16/8/8.
//  Copyright © 2016年 niuwan. All rights reserved.
//

#import "DrawView.h"

@interface DrawView ()

@property (nonatomic, strong) UIBezierPath *path;

@end

@implementation DrawView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    //touch
    UITouch *touch = [touches anyObject];
    
    //获取手指的触摸点
    CGPoint curP = [touch locationInView:self];
    
    //创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    _path = path;
    
    [path moveToPoint:curP];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    //touch
    UITouch *touch = [touches anyObject];
    
    //获取触摸点
    CGPoint curP = [touch locationInView:self];
    
    //添加 线
    [_path addLineToPoint:curP];
    
    //重绘
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    //创建帧动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    //设置属性
    anim.keyPath = @"position";
    
    //设置路径
    anim.path = _path.CGPath;
    
    //执行时间
    anim.duration = 1.0;
    
    //重复次数
    anim.repeatCount = MAXFLOAT;
    
    //给imgageView 添加动画
    [[[self.subviews firstObject] layer] addAnimation:anim forKey:nil];
}

- (void)drawRect:(CGRect)rect {
    
    [_path stroke];
}


@end
