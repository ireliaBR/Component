//
//  SettingViewModel.h
//  MainModule
//
//  Created by 范冬冬 on 2018/4/26.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <CommonModule/CommonModule.h>
@class SettingModel;

@interface SettingViewModel : MTBaseViewModel
- (NSInteger)rowCount;
- (SettingModel *)modelWithRow:(NSInteger)row;

- (void)reloadData;
@end
