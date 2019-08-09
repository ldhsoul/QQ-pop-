//
//  ExampleViewController.m
//  QQ音乐弹幕
//
//  Created by fubang on 2019/8/7.
//  Copyright © 2019 ldh. All rights reserved.
//

#import "ExampleViewController.h"

#import "DemoBarrageViewCell1.h"

@interface ExampleViewController ()



@end

@implementation ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"弹幕列表滚动";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _barrageView = [[DHBarrageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _barrageView.bottomSpacing = [UIApplication sharedApplication].statusBarFrame.size.height + 44.f + 20.f;
    _barrageView.cellClass = [DemoBarrageViewCell1 class];
    [self.view addSubview:_barrageView];
}

#pragma mark -
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static NSInteger index = 0;
    index ++;
    DHBarrageMessage *message = [[DHBarrageMessage alloc] init];
    message.body = [self randomMessage];
    [_barrageView receivedMessage:message];
}

#pragma mark - 模拟数据
- (NSDictionary *)randomMessage {
    static NSInteger index = 0;
    index ++;
    return @{@"color":[self randomColor],
             @"content":[self randomContent],
             @"nickname":[self randomName],
             @"head":[self randomHead],
             @"id":@(index),
             @"type":@(arc4random() % 3)};
}
- (UIColor *)randomColor {
    return [UIColor colorWithRed:arc4random() % 255 / 255.f
                           green:arc4random() % 255 / 255.f
                            blue:arc4random() % 255 / 255.f
                           alpha:1.f];
}
- (NSString *)randomContent {
    static NSArray *array = nil;
    if (!array) {
        array = @[@"老铁666",
                  @"哇塞赛赛赛",
                  @"we are the world",
                  @"如果我是乔碧萝",
                  @"你会给我按下F吗",
                  @"如果我是海佳你会爱我吗",
                  @"我的天天t哪",
                  @"你是真的强👍",];
    }
    return array[arc4random() % array.count];
}
- (NSString *)randomName {
    static NSArray *array = nil;
    if (!array) {
        array = @[@"我们村我最丑。",
                  @"someone敏",
                  @"somebody赖",
                  @"一天零",
                  @"心如刀",];
    }
    return array[arc4random() % array.count];
}

- (NSString *)randomHead {
    static NSArray *array = nil;
    if (!array) {
        array = @[@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1899397357,205586921&fm=27&gp=0.jpg",
                  @"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2951924714,3607611016&fm=27&gp=0.jpg",
                  @"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3069244644,2570574027&fm=27&gp=0.jpg",
                  @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2802691956,955693789&fm=27&gp=0.jpg",
                  @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3336226061,4016676102&fm=27&gp=0.jpg",];
    }
    return array[arc4random() % array.count];
}


@end
