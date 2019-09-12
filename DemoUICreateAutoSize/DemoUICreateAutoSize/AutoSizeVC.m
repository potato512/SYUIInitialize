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
#import "SYAutoSizeCGRect.h"

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
    CGFloat size = CGRectGetWidthAutoSize(120.0);
    UIView *currentView = InsertImageView(headerView, CGRectMake((headerView.frame.size.width - size) / 2, (headerView.frame.size.height - size) / 2, size, size), [UIImage imageNamed:@"002.jpg"]);
    NSString *text = [NSString stringWithFormat:@"番薯大佬 sacle %@\nsize %@, layoutSize %@", NSStringFromCGPoint (UIAutoSize.layoutScale), NSStringFromCGSize(UIScreen.mainScreen.bounds.size), NSStringFromCGSize(UIAutoSize.layoutSize)];
    InsertLabel(headerView, CGRectMake(10.0, (currentView.frame.origin.y + currentView.frame.size.height + 10.0), (headerView.frame.size.width - 20.0), CGRectGetHeightAutoSize(40.0)), NSTextAlignmentCenter, text, UIFontAutoSize(15), UIColor.blackColor, YES);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
    
//    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return heightAutoSizeTableViewCell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    AutoSizeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AutoSizeTableViewCell"];
//    if (cell == nil) {
//        cell = [[AutoSizeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AutoSizeTableViewCell"];
//        cell.textLabel.font = UIFontAutoSize(13);
//    }
//    cell.textLabel.text = [NSString stringWithFormat:@"row = %ld", indexPath.row];
//    return cell;
    
    AutoSizeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AutoSizeTableViewCell"];
    if (cell == nil) {
        cell = [[AutoSizeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AutoSizeTableViewCell"];
    }
    MessageModel *model = self.array[indexPath.row];
    cell.icomImageView.image = [UIImage imageNamed:model.imageName];
    cell.titleLabel.text = model.title;
    cell.contentLabel.text = model.detail;
    cell.timeLabel.text = model.time;
    
    return cell;
}

- (NSArray *)array
{
    if (_array == nil) {
        NSArray *times = @[@"2019-09-11", @"2019-08-13", @"2019-08-31", @"2019-09-09", @"2019-09-03"];
        NSArray *details = @[@"注册-验证-激活-添加车辆", @"反馈信息：问题描述、操作流程、期望结果、问题截图", @"UI：登录业务车型放大、空调关闭预约Icon放在右下角", @"云服务已成功激活，感谢您的使用！"];
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        for (int i = 0; i < 20; i++) {
            MessageModel *model = [[MessageModel alloc] init];
            model.imageName = @"002.jpg";
            model.title = [NSString stringWithFormat:@"标题：每 %@ 个", @(i)];
            model.detail = details[arc4random() % details.count];
            model.time = times[arc4random() % times.count];
            
            [temp addObject:model];
        }
        _array = [NSArray arrayWithArray:temp];
    }
    return _array;
}

@end
