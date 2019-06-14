//
//  ViewController.m
//  DemoUICreateAutoSize
//
//  Created by zhangshaoyu on 2019/6/14.
//  Copyright © 2019 zhangshaoyu. All rights reserved.
//

#import "ViewController.h"
#import "UIVC.h"
#import "AutoSizeVC.h"

@interface ViewController () 

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *autoItem = [[UIBarButtonItem alloc] initWithTitle:@"auto" style:UIBarButtonItemStyleDone target:self action:@selector(autoClick)];
    UIBarButtonItem *uiItem = [[UIBarButtonItem alloc] initWithTitle:@"ui" style:UIBarButtonItemStyleDone target:self action:@selector(uiClick)];
    self.navigationItem.rightBarButtonItems = @[autoItem, uiItem];
}

- (void)autoClick
{
    AutoSizeVC *nextVC = [[AutoSizeVC alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (void)uiClick
{
    UIVC *nextVC = [[UIVC alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}

@end
