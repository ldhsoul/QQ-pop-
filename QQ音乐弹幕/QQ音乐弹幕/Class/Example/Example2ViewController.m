//
//  Example2ViewController.m
//  QQ音乐弹幕
//
//  Created by fubang on 2019/8/9.
//  Copyright © 2019 ldh. All rights reserved.
//

#import "Example2ViewController.h"
#import "DemoBarrageViewCell2.h"

@interface Example2ViewController ()

@end

@implementation Example2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"QQ音乐弹幕pop效果";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.barrageView = [[DHBarrageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.barrageView.bottomSpacing = [UIApplication sharedApplication].statusBarFrame.size.height + 44.f + 20.f;
    self.barrageView.cellClass = [DemoBarrageViewCell2 class];
    [self.view addSubview:self.barrageView];
}



@end
