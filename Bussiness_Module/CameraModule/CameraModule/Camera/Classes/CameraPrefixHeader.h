//
//  CameraPrefixHeader.h
//  CameraModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#ifndef CameraPrefixHeader_h
#define CameraPrefixHeader_h

#import <CommonModule/CommonModule.h>

#import "CameraInitialization.h"
#import <Masonry/Masonry.h>


#define UIImageNamed(imageName) [UIImage imageNamed:@#imageName withBundlePath:CurrentBundle(CameraInitialization.class).bundlePath]

#define LocalizedString(key) NSLocalizedStringFromTableInBundle((@#key), nil, CurrentBundle(CameraInitialization.class), nil)

#endif /* CameraPrefixHeader_h */
