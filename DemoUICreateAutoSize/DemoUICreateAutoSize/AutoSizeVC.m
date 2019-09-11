//
//  AutoSizeVC.m
//  DemoUICreateAutoSize
//
//  Created by zhangshaoyu on 2019/6/14.
//  Copyright © 2019 zhangshaoyu. All rights reserved.
//

#import "AutoSizeVC.h"
#import "SYUIInitMethod.h"
#import "AutoSizeTableViewCell.h"

@interface AutoSizeVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *array;

@end

@implementation AutoSizeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"自适应";
    
    [self setUI];
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
}

- (void)setUI
{
    UITableView *tableView = InsertTableView(self.view, self.view.bounds, self, self, UITableViewStylePlain, UITableViewCellSeparatorStyleNone);
    //
    UIView *headerView = InsertView(nil, CGRectMake(0.0, 0.0, tableView.frame.size.width, CGRectGetHeightAutoSize(240.0)), [UIColor.blackColor colorWithAlphaComponent:0.3], 0.0, nil, 0.0);
    tableView.tableHeaderView = headerView;
    UIView *currentView = InsertImageView(headerView, CGRectMake((headerView.frame.size.width - 120.0) / 2, (headerView.frame.size.height - 120.0) / 2, 120.0, 120.0), [UIImage imageNamed:@"002.jpg"]);
    InsertLabel(headerView, CGRectMake(10.0, (currentView.frame.origin.y + currentView.frame.size.height + 10.0), (headerView.frame.size.width - 20.0), CGRectGetHeightAutoSize(30.0)), NSTextAlignmentCenter, @"番薯大佬", [UIFont systemFontOfSize:15.0], UIColor.blackColor, NO);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return self.array.count;
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return heightAutoSizeTableViewCell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AutoSizeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AutoSizeTableViewCell"];
    if (cell == nil) {
        cell = [[AutoSizeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AutoSizeTableViewCell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"row = %ld", indexPath.row];
    return cell;
}

- (NSArray *)array
{
    if (_array == nil) {
        _array = @[@"",@"",@"",@"",@""];
    }
    return _array;
}

@end
