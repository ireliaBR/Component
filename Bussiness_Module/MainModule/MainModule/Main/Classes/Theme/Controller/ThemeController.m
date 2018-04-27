//
//  ThemeController.m
//  MainModule
//
//  Created by 范冬冬 on 2018/4/26.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "ThemeController.h"

// 系统库头文件


// 第三方库头文件
#import <MTTheme/MTTheme.h>

// 自定义模块的头文件
#import "MainPrefixHeader.h"
#import "ThemeCell.h"
#import "ThemeModel.h"
#import "ThemeViewModel.h"
#import "ThemeLanguageManager.h"

@interface ThemeController ()<UITableViewDelegate
, UITableViewDataSource>
@property (nonatomic, strong) MTTableView *tableView;
@property (nonatomic, strong) ThemeViewModel *viewModel;
@end

@implementation ThemeController
#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xffffff);
    
    // titleView
    MTLabel *label = ({
        MTLabel *label = [MTLabel new];
        label.font = MTFont(16);
        [label theme_setTextIdentifier:@"ThemeController.titleView.text" moduleName:@"main"];
        [label theme_setTextColorIdentifier:@"ThemeController.titleView.textColor" moduleName:@"main"];
        label;
    });
    self.navigationItem.titleView = label;
    
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark - Custom Accessors
- (MTTableView *)tableView {
    if (!_tableView) {
        _tableView = [[MTTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:ThemeCell.class forCellReuseIdentifier:NSStringFromClass(ThemeCell.class)];
    }
    return _tableView;
}

- (ThemeViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [ThemeViewModel modelWithViewController:self];
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
    return [ThemeCell getCellHeightWithModel:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(ThemeCell.class) forIndexPath:indexPath];
    cell.model = [self.viewModel modelWithRow:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ThemeModel *model = [self.viewModel modelWithRow:indexPath.row];
    [ThemeLanguageManager.manager setTheme:model.name];
    [self.viewModel changeSelectedTheme:model.name];
    [self.tableView reloadData];
}

@end
