//
//  ViewController.m
//  KSAsyncKit
//
//  Created by saeipi on 2020/7/14.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import "ViewController.h"
#import "KSTableViewCell.h"
#import "KSCell.h"
#import "UIViewController+Category.h"
#import "KSTableNodeController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *datas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return self.datas.count;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KSTableViewCell *cell = [KSTableViewCell initWithTableView:tableView];
    KSCell *data = _datas[indexPath.row];
    cell.textLabel.text = data.title;
    return cell;
}

//UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    KSCell *data = _datas[indexPath.row];
    switch (data.type) {
        case KSCellTypeTableNode:
            [self enterTableNodeController];
            break;
        default:
            break;
    }
}

-(void)enterTableNodeController {
    KSTableNodeController *ctrl = [[KSTableNodeController alloc] init];
    [self pushViewController:ctrl];
}

//懒加载
-(NSMutableArray *)datas {
    if (_datas == nil) {
        _datas = [KSCell constructData];
    }
    return _datas;
}

@end
