//
//  KSTableNodeController.m
//  KSAsyncKit
//
//  Created by saeipi on 2020/7/14.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import "KSTableNodeController.h"
#import "KSCellNode.h"
@interface KSTableNodeController ()<ASTableDelegate, ASTableDataSource>

@property (nonatomic, strong) ASTableNode *tableNode;

@end

@implementation KSTableNodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ASTableNode *tableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
    _tableNode = tableNode;
    tableNode.dataSource = self;
    tableNode.delegate = self;
    tableNode.frame = self.view.bounds;
    [self.view addSubnode:tableNode];//等效：[self.view addSubview:_tableNode.view];
    //ASTableNode 不会暴露所有UITableView的的属性，所以你必须通过 tableNode 底层的 UITableView 实例去设置 UITableView 的特殊属性。
    tableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;

    //无限滚动需要
    //将 leadingScreensForBatching 设置为 1.0 表示当用户滚动还剩 1 个全屏就到达页尾时，开始抓取新的一批数据。
    tableNode.view.leadingScreensForBatching = 1.0;  // default of 2.0
}

- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return 100;
}
/**
 *  不支持复用
 *  该方法优先于 tableNode:nodeForRowAtIndexPath:
 */
- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    KSCellNodeModel *data = [[KSCellNodeModel alloc] init];
    data.text = [NSString stringWithFormat:@"index %ld",(long)indexPath.row];
    data.imgUrl = @"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3833403208,864463412&fm=26&gp=0.jpg";
    ASCellNode *(^cellBlock)(void) = ^ASCellNode *() {
        KSCellNode *cellNote = [[KSCellNode alloc] initWithData:data];
        return cellNote;
    };
    return cellBlock;
}

- (ASSizeRange)tableNode:(ASTableNode *)tableNode constrainedSizeForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGSize min = CGSizeMake(width, 380);
    CGSize max = CGSizeMake(width, CGFLOAT_MAX);
    return ASSizeRangeMake(min, max);
}

- (void)tableNode:(ASTableNode *)tableNode didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableNode deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - 无限滚动
- (BOOL)shouldBatchFetchForTableNode:(ASTableNode *)tableNode {
    return YES;
}

@end
