//
//  SettingController.m
//  MainModule
//
//  Created by 范冬冬 on 2018/4/26.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "SettingController.h"

// 系统库头文件


// 第三方库头文件
#import <MTTheme/MTTheme.h>
#import <MTRouter/MTRouter.h>

// 自定义模块的头文件
#import "MainPrefixHeader.h"
#import "SettingTableViewCell.h"
#import "SettingModel.h"
#import "SettingViewModel.h"

@interface SettingController ()<UITableViewDelegate
, UITableViewDataSource>
@property (nonatomic, strong) MTTableView *tableView;
@property (nonatomic, strong) SettingViewModel *viewModel;
@end

@implementation SettingController
#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xffffff);
    
    // titleView
    MTLabel *label = ({
        MTLabel *label = [MTLabel new];
        label.font = MTFont(16);
        [label theme_setTextIdentifier:@"SettingController.titleView.text" moduleName:@"main"];
        [label theme_setTextColorIdentifier:@"SettingController.titleView.textColor" moduleName:@"main"];
        label;
    });
    self.navigationItem.titleView = label;
    
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    [self.viewModel reloadData];
    [self.tableView reloadData];
}

#pragma mark - Custom Accessors
- (MTTableView *)tableView {
    if (!_tableView) {
        _tableView = [[MTTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:SettingTableViewCell.class forCellReuseIdentifier:NSStringFromClass(SettingTableViewCell.class)];
    }
    return _tableView;
}

- (SettingViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [SettingViewModel modelWithViewController:self];
    }
    return _viewModel;
}

#pragma mark - IBActions


#pragma mark - Public


#pragma mark - Private
- (void)setupUI {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - Protocol conformance
#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.rowCount;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [SettingTableViewCell getCellHeightWithModel:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(SettingTableViewCell.class) forIndexPath:indexPath];
    cell.model = [self.viewModel modelWithRow:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SettingModel *model = [self.viewModel modelWithRow:indexPath.row];
    [MTRouter.router pushUrl:model.routerAddress animated:YES pushNavCtrl:self.navigationController];
}

@end
