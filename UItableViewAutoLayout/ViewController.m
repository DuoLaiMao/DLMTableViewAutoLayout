//
//  ViewController.m
//  UItableViewAutoLayout
//
//  Created by YangJian on 2018/6/9.
//  Copyright © 2018年 DLM. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "AutoLayoutCell.h"

static NSString *cellContent = @"跟谁学是一家中国领先的互联网教育科技公司，于2014年6月由陈向东带领创建，团队成员主要由来自新东方等著名教育培训机构及百度、阿里、腾讯等顶级互联网公司的精英组成。2015年3月30日，宣布A轮融资5000万美元，刷新了中国创业公司A轮融资纪录。2015年11月，获得福布斯发布的“福布斯2015中国成长最快科技公司”。目前，旗下拥有跟谁学、高途课堂、成蹊商学院、金囿学堂、微师等产品。";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [AutoLayoutCell heightWithString:cellContent];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AutoLayoutCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identify" forIndexPath:indexPath];
    [cell setCellString:cellContent];
    
    return cell;
}

#pragma mark - getter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 0;
        [_tableView registerClass:[AutoLayoutCell class] forCellReuseIdentifier:@"identify"];
    }
    return _tableView;
}

@end
