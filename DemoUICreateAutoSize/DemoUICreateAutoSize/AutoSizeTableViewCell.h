//
//  AutoSizeTableViewCell.h
//  DemoUICreateAutoSize
//
//  Created by zhangshaoyu on 2019/6/14.
//  Copyright © 2019 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYAutoSizeCGRect.h"

NS_ASSUME_NONNULL_BEGIN

#define heightAutoSizeTableViewCell CGRectGetHeightAutoSize(60)

@interface MessageModel : NSObject

@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSString *time;

@end

@interface AutoSizeTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *icomImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@end

NS_ASSUME_NONNULL_END
