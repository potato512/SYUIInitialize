//
//  UIVC.m
//  DemoUICreateAutoSize
//
//  Created by zhangshaoyu on 2019/6/14.
//  Copyright © 2019 zhangshaoyu. All rights reserved.
//

#import "UIVC.h"
#import "SYUIInitMethod.h"

@interface UIVC () <UITextFieldDelegate, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

@end

@implementation UIVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"视图";
    
    self.navigationItem.rightBarButtonItem = UIBarButtonItemInitializeWithButton(CGRectMake(0.0, 0.0, 60.0, 44.0), 0, @"edit", @"done", [UIFont systemFontOfSize:15.0], [UIColor blackColor], [UIColor redColor], [UIColor orangeColor], UIEdgeInsetsZero, nil, nil, nil, UIEdgeInsetsZero, nil, nil, nil, NO, self, @selector(buttonClick:));
    
    // 创建view
    UIView *view = UIViewInitialize(nil, CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.bounds), 250.0), [UIColor greenColor], 5.0, [UIColor orangeColor], 5.0);
    
    // 创建tableview
    UITableView *tableview = UITableViewInitialize(self.view, self.view.bounds, self, self, UITableViewStylePlain, UITableViewCellSeparatorStyleSingleLine);
    tableview.tableHeaderView = view;
    
    
    UIProgressViewInitialize(view, CGRectMake(100.0, 10.0, 100.0, 5.0), UIProgressViewStyleDefault, 0.5, [UIColor yellowColor], [UIColor redColor]);
    UILabel *label = UILabelInitialize(view, CGRectMake(10.0, 20.0, (self.view.bounds.size.width - 10.0 * 2), 20.0), NSTextAlignmentLeft, @"使用自定义方法创建label", [UIFont systemFontOfSize:10.0], [UIColor blackColor], NO);
    label.backgroundColor = [UIColor orangeColor];
    UIActivityIndicatorView *activityView = UIActivityIndicatorViewInitialize(view, CGRectMake(10.0, 50.0, 20.0, 20.0), [UIColor whiteColor], [UIColor brownColor], UIActivityIndicatorViewStyleGray);
    [activityView startAnimating];
    UIPageControlInitialize(view, CGRectMake(40.0, 50.0, 60.0, 10.0), 5, 2, [UIColor blackColor], [UIColor redColor]);
    UISliderInitialize(view, CGRectMake(110.0, 50.0, 100.0, 30.0), nil, nil);
    UISwitchInitialize(view, CGRectMake(220.0, 50.0, 60.0, 30.0), nil, nil);
    UITextFieldInitialize(view, self, CGRectMake(10.0, 90.0, 120.0, 30.0), @"input your name", [UIFont systemFontOfSize:13.0], NSTextAlignmentLeft, UIControlContentVerticalAlignmentCenter, 1.0, [UIColor purpleColor], nil, 3.0, NO, UIKeyboardTypeDefault, UIReturnKeyDone);
    UISearchBarInitialize(view, CGRectMake(140.0, 90.0, 120.0, 30.0), self, @"search", UISearchBarStyleDefault, [UIColor redColor], [UIColor brownColor], nil);
    UISegmentedControlInitialize(view, @[@"red", @"green", @"brown", @"blue", @"black", @"white"], CGRectMake(10.0, 130.0, 300.0, 40.0), self, @selector(segmentClick:));
    UILabel *label1 = UILabelInitialize(view, CGRectMake(10, 180, view.frame.size.width - 20, 30), NSTextAlignmentLeft, @"自定义标签自适应宽高", [UIFont systemFontOfSize:13.0], UIColor.blackColor, YES);
    label1.backgroundColor = UIColor.orangeColor;
    UILabel *label2 = UILabelInitialize(view, CGRectMake(10, 220, view.frame.size.width - 20, 30), NSTextAlignmentLeft, @"自定义标签宽度", [UIFont systemFontOfSize:13.0], UIColor.blackColor, NO);
    UILabelReloadSize(label2, UIAutoSizelabelHorizontal);
    label2.backgroundColor = UIColor.yellowColor;
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
}

- (void)buttonClick:(UIButton *)button
{
    button.selected = !button.selected;
    
    UIAlertControllerInitialize(self, UIAlertControllerStyleAlert, @"弹窗", @"提示信息与编辑", @[@"大兄弟在哪里", @"小老弟在哪里"], @[@"取消", @"大兄弟", @"小老弟", @"确定"], ^(int index, NSString *title, NSArray *textFields) {
        if (textFields.count > 0) {
            for (UITextField *textfield in textFields) {
                NSLog(@"title = %@, text = %@", title, textfield.text);
            }
        } else {
            NSLog(@"title = %@", title);
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
        UIAlertControllerInitialize(self, UIAlertControllerStyleAlert, @"温馨提示", @"你点击了", nil, @[@"取消", @"确认"], NULL);
    }
    else if (1 == indexPath.row)
    {
        UIAlertControllerInitialize(self, UIAlertControllerStyleActionSheet, @"提示", nil, nil, @[@"提示", @"cancel", @"警告", @"001", @"002"], NULL);
    }
    else if (2 == indexPath.row)
    {
        UIAlertControllerInitialize(self, UIAlertControllerStyleAlert, @"温馨提示", @"alertController view视图", nil, @[@"取消", @"知道了", @"你惨了", @"你赢了"], ^(int index, NSString *title, NSArray *textFields) {
            if ([title isEqualToString:@"取消"]) {
                NSLog(@"你点击了 标题是 %@", title);
            } else if ([title isEqualToString:@"知道了"]) {
                NSLog(@"你点击了 标题是 %@", title);
            } else if ([title isEqualToString:@"你惨了"]) {
                NSLog(@"你点击了 标题是 %@", title);
            } else if ([title isEqualToString:@"你赢了"]) {
                NSLog(@"你点击了 标题是 %@", title);
            }
        });
    }
    else if (3 == indexPath.row)
    {
        UIAlertControllerInitialize(self, UIAlertControllerStyleActionSheet, @"温馨提示", @"alertController sheet视图", nil, @[@"取消", @"知道了", @"你惨了", @"你赢了"], ^(int index, NSString *title, NSArray *textFields) {
            if ([title isEqualToString:@"取消"]) {
                NSLog(@"你点击了 标题是 %@", title);
            } else if ([title isEqualToString:@"知道了"]) {
                NSLog(@"你点击了 标题是 %@", title);
            } else if ([title isEqualToString:@"你惨了"]) {
                NSLog(@"你点击了 标题是 %@", title);
            } else if ([title isEqualToString:@"你赢了"]) {
                NSLog(@"你点击了 标题是 %@", title);
            }
        });
    }
}

@end
