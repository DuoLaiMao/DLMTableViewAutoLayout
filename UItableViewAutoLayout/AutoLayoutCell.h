//
//  AutoLayoutCell.h
//  UItableViewAutoLayout
//
//  Created by YangJian on 2018/6/9.
//  Copyright © 2018年 DLM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoLayoutCell : UITableViewCell

+ (CGFloat)heightWithString:(NSString *)str;

- (void)setCellString:(NSString *)str;
@end
