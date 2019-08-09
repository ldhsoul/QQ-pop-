//
//  ViewController.m
//  QQ音乐弹幕
//
//  Created by fubang on 2019/8/7.
//  Copyright © 2019 ldh. All rights reserved.
//

#import "ViewController.h"
#import "ExampleViewController.h"
#import "Example2ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - controller
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"example_cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"example_cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = [UIFont systemFontOfSize:12];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"弹幕列表滚动效果";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"QQ音乐弹幕效果";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        ExampleViewController *vc = [[ExampleViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 1) {
        Example2ViewController *vc = [[Example2ViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
