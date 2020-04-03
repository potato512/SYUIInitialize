//
//  AutoSizeTableViewCell.m
//  DemoUICreateAutoSize
//
//  Created by zhangshaoyu on 2019/6/14.
//  Copyright © 2019 zhangshaoyu. All rights reserved.
//

#import "AutoSizeTableViewCell.h"

@implementation MessageModel

@end

@implementation AutoSizeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect = self.frame;
        rect.size = CGSizeMake(UIScreen.mainScreen.bounds.size.width, heightAutoSizeTableViewCell);
        self.frame = rect;
        
        self.icomImageView = UIImageViewInitialize(self.contentView, CGRectMake(10, 10, heightAutoSizeTableViewCell - 20, heightAutoSizeTableViewCell - 20), nil);
        self.titleLabel = UILabelInitialize(self.contentView, CGRectMake(self.icomImageView.frame.origin.x + self.icomImageView.frame.size.width + 10, self.icomImageView.frame.origin.y, (self.frame.size.width - self.icomImageView.frame.origin.x - self.icomImageView.frame.size.width - 20) / 2, self.icomImageView.frame.size.height / 2), NSTextAlignmentLeft, nil, SYUIFontAutoSize(15), UIColor.blackColor, NO);
        self.timeLabel = UILabelInitialize(self.contentView, CGRectMake(self.titleLabel.frame.origin.x + self.titleLabel.frame.size.width, self.titleLabel.frame.origin.y, self.titleLabel.frame.size.width, self.titleLabel.frame.size.height), NSTextAlignmentRight, nil, SYUIFontAutoSize(11), UIColor.lightGrayColor, NO);
        self.contentLabel = UILabelInitialize(self.contentView, CGRectMake(self.titleLabel.frame.origin.x, self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height, self.frame.size.width - self.titleLabel.frame.origin.x - 10, self.titleLabel.frame.size.height), NSTextAlignmentLeft, nil, SYUIFontAutoSize(13), UIColor.blackColor, NO);
    }
    return self;
}

@end
