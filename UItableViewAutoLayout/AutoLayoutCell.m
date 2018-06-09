//
//  AutoLayoutCell.m
//  UItableViewAutoLayout
//
//  Created by YangJian on 2018/6/9.
//  Copyright © 2018年 DLM. All rights reserved.
//

#import "AutoLayoutCell.h"
#import <Masonry/Masonry.h>

@interface AutoLayoutCell ()
@property (strong, nonatomic) UILabel *contentLabel;

@end

@implementation AutoLayoutCell

+ (CGFloat)heightWithString:(NSString *)str
{
    static AutoLayoutCell *offscreenCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        offscreenCell = [[AutoLayoutCell alloc] init];
    });
    [offscreenCell setCellString:str];
    [offscreenCell setNeedsUpdateConstraints];
    [offscreenCell updateConstraintsIfNeeded];
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    offscreenCell.bounds = CGRectMake(0, 0, screenWidth, CGRectGetHeight(offscreenCell.bounds));
    [offscreenCell setNeedsLayout];
    [offscreenCell layoutIfNeeded];
    CGSize size = [offscreenCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    CGFloat height = size.height;
    
    return height+1;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.contentLabel];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(10, 16, 10, 16));
        }];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.contentView layoutIfNeeded];
    self.contentLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.contentLabel.bounds);
}

- (void)setCellString:(NSString *)str
{
    self.contentLabel.text = str;
}

#pragma mark - getter
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.textColor = [UIColor blueColor];
        _contentLabel.numberOfLines = 0;
        _contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
    }
    
    return _contentLabel;
}

@end
