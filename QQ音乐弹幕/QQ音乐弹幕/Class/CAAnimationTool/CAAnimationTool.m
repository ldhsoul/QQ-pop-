//
//  CAAnimationTool.m
//  QQ音乐弹幕
//
//  Created by fubang on 2019/8/7.
//  Copyright © 2019 ldh. All rights reserved.
//

#import "CAAnimationTool.h"


@implementation CAAnimationTool

#pragma mark -

/// 缩放
+ (CABasicAnimation *)scaleAnimationFromValue:(CGFloat)fromValue toValue:(CGFloat)tovalue duration:(CGFloat)duration{

    CABasicAnimation *animScale = [[CABasicAnimation alloc]init];
    animScale.keyPath = @"transform.scale";
    animScale.fromValue = @(fromValue);
    animScale.toValue = @(tovalue);
    animScale.duration = duration;
    animScale.removedOnCompletion = NO;
    animScale.fillMode = kCAFillModeForwards;
    
    return animScale;
}

/// 平移-y
+ (CABasicAnimation *)positionYAnimationFromValue:(CGFloat)fromValue toValue:(CGFloat)tovalue duration:(CGFloat)duration{
    
    CABasicAnimation *animy = [CABasicAnimation animation];
    animy.keyPath = @"position.y";
    animy.fromValue = @(fromValue);
    animy.toValue = @(tovalue);
    animy.duration = duration;
    animy.removedOnCompletion = NO;
    animy.fillMode = kCAFillModeForwards;
    
    return animy;
}

/// 平移-x
+ (CABasicAnimation *)positionXAnimationFromValue:(CGFloat)fromValue toValue:(CGFloat)tovalue duration:(CGFloat)duration{
    
    CABasicAnimation *animy = [CABasicAnimation animation];
    animy.keyPath = @"position.x";
    animy.fromValue = @(fromValue);
    animy.toValue = @(tovalue);
    animy.duration = duration;
    animy.removedOnCompletion = NO;
    animy.fillMode = kCAFillModeForwards;
    
    return animy;
}

/// 透明度
+ (CABasicAnimation *)opacityAnimationFromValue:(CGFloat)fromValue toValue:(CGFloat)tovalue duration:(CGFloat)duration {
    
    CABasicAnimation *opacity = [[CABasicAnimation alloc] init];
    opacity.keyPath = @"opacity";
    opacity.fromValue = @(fromValue);
    opacity.toValue = @(tovalue);
    opacity.duration = duration;
    opacity.removedOnCompletion = NO;
    opacity.fillMode = kCAFillModeForwards;
    
    return opacity;
}

@end
