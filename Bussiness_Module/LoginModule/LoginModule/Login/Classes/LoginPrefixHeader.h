//
//  LoginPrefixHeader.h
//  LoginModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#ifndef LoginPrefixHeader_h
#define LoginPrefixHeader_h

#import <CommonModule/CommonModule.h>

#import "LoginInitialization.h"
#import <Masonry/Masonry.h>


#define UIImageNamed(imageName) [UIImage imageNamed:@#imageName withBundlePath:CurrentBundle(LoginInitialization.class).bundlePath]

#define LocalizedString(key) NSLocalizedStringFromTableInBundle((@#key), nil, CurrentBundle(LoginInitialization.class), nil)

#endif /* LoginPrefixHeader_h */
