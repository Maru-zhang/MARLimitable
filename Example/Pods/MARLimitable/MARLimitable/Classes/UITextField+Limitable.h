//
//  UITextField+Limitable.h
//  Limitable
//
//  Created by Maru on 2016/12/21.
//  Copyright © 2016年 Alloc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Limitable)

/// The radio of chinses / english,default is 1.
@property (nonatomic, assign) NSInteger mar_radio;
/// The maximum of field type in,default is infinity.
@property (nonatomic, assign) NSInteger mar_maxLength;

@end
