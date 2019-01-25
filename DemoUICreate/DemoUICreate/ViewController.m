//
//  ViewController.m
//  DemoUICreate
//
//  Created by zhangshaoyu on 16/11/15.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"视图";

    self.navigationItem.rightBarButtonItem = InsertBarButtonItemWithButton(CGRectMake(0.0, 0.0, 60.0, 44.0), 0, @"edit", @"done", [UIFont systemFontOfSize:15.0], [UIColor blackColor], [UIColor redColor], [UIColor orangeColor], UIEdgeInsetsZero, nil, nil, nil, UIEdgeInsetsZero, nil, nil, nil, NO, self, @selector(buttonClick:));
    
    // 创建view
    UIView *view = InsertView(nil, CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.bounds), 250.0), [UIColor greenColor], 5.0, [UIColor orangeColor], 5.0);

    // 创建tableview
    UITableView *tableview = InsertTableView(self.view, self.view.bounds, self, self, UITableViewStylePlain, UITableViewCellSeparatorStyleSingleLine);
    tableview.tableHeaderView = view;
    
    
    InsertProgressView(view, CGRectMake(100.0, 10.0, 100.0, 5.0), UIProgressViewStyleDefault, 0.5, [UIColor yellowColor], [UIColor redColor]);
    UILabel *label = InsertLabel(view, CGRectMake(10.0, 20.0, (self.view.bounds.size.width - 10.0 * 2), 20.0), NSTextAlignmentLeft, @"使用自定义方法创建label", [UIFont systemFontOfSize:10.0], [UIColor blackColor], NO);
    label.backgroundColor = [UIColor orangeColor];
    UIActivityIndicatorView *activityView = InsertActivityIndicatorView(view, CGRectMake(10.0, 50.0, 20.0, 20.0), [UIColor whiteColor], [UIColor brownColor], UIActivityIndicatorViewStyleGray);
    [activityView startAnimating];
    InsertPageControl(view, CGRectMake(40.0, 50.0, 60.0, 10.0), 5, 2, [UIColor blackColor], [UIColor redColor]);
    InsertSlider(view, CGRectMake(110.0, 50.0, 100.0, 30.0), nil, nil);
    InsertSwitch(view, CGRectMake(220.0, 50.0, 60.0, 30.0), nil, nil);
    InsertTextField(view, self, CGRectMake(10.0, 90.0, 120.0, 30.0), @"input your name", [UIFont systemFontOfSize:13.0], NSTextAlignmentLeft, UIControlContentVerticalAlignmentCenter, 1.0, [UIColor purpleColor], nil, 3.0, NO, UIKeyboardTypeDefault, UIReturnKeyDone);
    InsertSearchBar(view, CGRectMake(140.0, 90.0, 120.0, 30.0), self, @"search", UISearchBarStyleDefault, [UIColor redColor], [UIColor brownColor], nil);
    InsertSegment(view, @[@"red", @"green", @"brown", @"blue", @"black", @"white"], CGRectMake(10.0, 130.0, 300.0, 40.0), self, @selector(segmentClick:));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
}


- (void)buttonClick:(UIButton *)button
{
    button.selected = !button.selected;
    
    InsertAlertController(self, UIAlertControllerStyleAlert, @"弹窗", @"提示信息与编辑", @[@"大兄弟在哪里", @"小老弟在哪里"], @[@"大兄弟", @"小老弟", @"确定", @"取消"], ^(int index, NSString *title, NSArray *textFields) {
        if (textFields.count > 0) {
            for (UITextField *textfield in textFields) {
                NSLog(@"index = %@, title = %@, text = %@", @(index), title, textfield.text);
            }
        } else {
            NSLog(@"index = %@, title = %@", @(index), title);
        }
    });
}

- (void)segmentClick:(UISegmentedControl *)segment
{
    NSInteger index = segment.selectedSegmentIndex;
    UIView *superview = segment.superview;
    if (0 == index)
    {
        superview.backgroundColor = [UIColor redColor];
    }
    else if (1 == index)
    {
        superview.backgroundColor = [UIColor greenColor];
    }
    else if (2 == index)
    {
        superview.backgroundColor = [UIColor brownColor];
    }
    else if (3 == index)
    {
        superview.backgroundColor = [UIColor blueColor];
    }
    else if (4 == index)
    {
        superview.backgroundColor = [UIColor blackColor];
    }
    else if (5 == index)
    {
        superview.backgroundColor = [UIColor whiteColor];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    if (0 == indexPath.row)
    {
        cell.textLabel.text = @"alert view";
    }
    else if (1 == indexPath.row)
    {
        cell.textLabel.text = @"action sheet";
    }
    else if (2 == indexPath.row)
    {
        cell.textLabel.text = @"alertController view";
    }
    else if (3 == indexPath.row)
    {
        cell.textLabel.text = @"alertController sheet";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (0 == indexPath.row)
    {
        InsertAlert(UIAlertViewStyleDefault, @"温馨提示", @"你点击了", 0, nil, @"取消", @"确认");
    }
    else if (1 == indexPath.row)
    {
        InsertActionSheetWithMoreButton(self.view, nil, UIActionSheetStyleDefault, @"提示", @"cancel", @"警告", @"001", @"002");
    }
    else if (2 == indexPath.row)
    {
        InsertAlertController(self, UIAlertControllerStyleAlert, @"温馨提示", @"alertController view视图", nil, @[@"取消", @"知道了", @"你惨了", @"你赢了"], ^(int index, NSString *title, NSArray *textFields) {
            if ([title isEqualToString:@"取消"])
            {
                NSLog(@"你点击了第 %@ 个按钮，标题是 %@", @(index), title);
            }
            else if ([title isEqualToString:@"知道了"])
            {
                NSLog(@"你点击了第 %@ 个按钮，标题是 %@", @(index), title);
            }
            else if ([title isEqualToString:@"你惨了"])
            {
                NSLog(@"你点击了第 %@ 个按钮，标题是 %@", @(index), title);
            }
            else if ([title isEqualToString:@"你赢了"])
            {
                NSLog(@"你点击了第 %@ 个按钮，标题是 %@", @(index), title);
            }
        });
    }
    else if (3 == indexPath.row)
    {
        InsertAlertController(self, UIAlertControllerStyleActionSheet, @"温馨提示", @"alertController sheet视图", nil, @[@"取消", @"知道了", @"你惨了", @"你赢了"], ^(int index, NSString *title, NSArray *textFields) {
            if ([title isEqualToString:@"取消"])
            {
                NSLog(@"你点击了第 %@ 个按钮，标题是 %@", @(index), title);
            }
            else if ([title isEqualToString:@"知道了"])
            {
                NSLog(@"你点击了第 %@ 个按钮，标题是 %@", @(index), title);
            }
            else if ([title isEqualToString:@"你惨了"])
            {
                NSLog(@"你点击了第 %@ 个按钮，标题是 %@", @(index), title);
            }
            else if ([title isEqualToString:@"你赢了"])
            {
                NSLog(@"你点击了第 %@ 个按钮，标题是 %@", @(index), title);
            }
        });
    }
}

@end
