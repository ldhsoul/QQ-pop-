//
//  DHBarrageViewCell.m
//  QQ音乐弹幕
//
//  Created by fubang on 2019/8/7.
//  Copyright © 2019 ldh. All rights reserved.
//

#import "DHBarrageViewCell.h"

@implementation DHBarrageViewCell

// 子类重写，返回自身计算后的宽度
- (CGFloat)setupSubviews:(NSInteger)ids {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150.f + arc4random() % 200, self.frame.size.height)];
    view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.5];
    view.layer.cornerRadius = view.frame.size.height * .5;
    view.layer.masksToBounds = YES;
    [self addSubview:view];
    UILabel *label = [[UILabel alloc] initWithFrame:view.bounds];
    label.text = [NSString stringWithFormat:@"这个cell这么长%ld",(long)ids] ;
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label];
    return CGRectGetMaxX(view.frame);
}


@end
