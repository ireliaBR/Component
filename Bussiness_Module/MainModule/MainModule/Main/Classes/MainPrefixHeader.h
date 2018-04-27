//
//  MainPrefixHeader.h
//  MainModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#ifndef MainPrefixHeader_h
#define MainPrefixHeader_h

#import <CommonModule/CommonModule.h>

#import "MainInitialization.h"
#import <Masonry/Masonry.h>


#define UIImageNamed(imageName) [UIImage imageNamed:@#imageName withBundlePath:CurrentBundle(MainInitialization.class).bundlePath]

#define LocalizedString(key) NSLocalizedStringFromTableInBundle((@#key), nil, CurrentBundle(MainInitialization.class), nil)


#endif /* MainPrefixHeader_h */
