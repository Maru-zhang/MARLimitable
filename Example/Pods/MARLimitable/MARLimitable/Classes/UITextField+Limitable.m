//
//  UITextField+Limitable.m
//  Limitable
//
//  Created by Maru on 2016/12/21.
//  Copyright © 2016年 Alloc. All rights reserved.
//

#import "UITextField+Limitable.h"
#import <objc/runtime.h>

static NSString * const MARMaxLengthKey = @"MARMaxLengthKey";
static NSString * const MARCharRadioKey = @"MARCharRadiokey";

@implementation UITextField (Limitable)

@dynamic mar_maxLength;
@dynamic mar_radio;

#pragma mark - Getter

- (NSInteger)mar_maxLength {
    
    NSValue *maxLengthValue = objc_getAssociatedObject(self, &MARMaxLengthKey);
    if (maxLengthValue) {
        NSInteger maxLength;
        [maxLengthValue getValue:&maxLength];
        return maxLength;
    }
    
    return NSIntegerMax;
}

- (NSInteger)mar_radio {
    
    NSValue *radioValue = objc_getAssociatedObject(self, &MARCharRadioKey);
    if (radioValue) {
        CGFloat radio;
        [radioValue getValue:&MARCharRadioKey];
        return radio;
    }
    return NSINTEGER_DEFINED;
}

#pragma mark - Setter

- (void)setMar_maxLength:(NSInteger)mar_maxLength {
    if (mar_maxLength < 1) {
        mar_maxLength = NSIntegerMax;
    }
    
    NSValue *value = [NSValue value:&mar_maxLength withObjCType:@encode(NSInteger)];
    objc_setAssociatedObject(self, &MARMaxLengthKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self textFieldTextChanged:self];
    [self removeTarget:self
                action:@selector(textFieldTextChanged:)
      forControlEvents:UIControlEventEditingChanged];
    [self addTarget:self
             action:@selector(textFieldTextChanged:)
   forControlEvents:UIControlEventEditingChanged];
}

- (void)setMar_radio:(NSInteger)mar_radio {
    
    if (mar_radio <= 0) {
        mar_radio = NSINTEGER_DEFINED;
    }
    
    NSValue *value = [NSValue value:&mar_radio withObjCType:@encode(NSInteger)];
    objc_setAssociatedObject(self, &MARCharRadioKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Event

- (void)textFieldTextChanged:(UITextField *)textField
{
    NSLog(@"==================");
    NSError *error = NULL;
    
    NSLog(@"%c",textField.text.UTF8String);

    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[\u4e00-\u9fa5]+" options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray <NSTextCheckingResult *>*results = [regex matchesInString:textField.text options:0 range:NSMakeRange(0, [textField.text length])];
    
    __block NSInteger append = 0;
    
    if (results.count) {
        [results enumerateObjectsUsingBlock:^(NSTextCheckingResult * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"%@", [textField.text substringWithRange:obj.range]);
            append += (textField.mar_radio - 1) * [textField.text length];
        }];
    }
    
    NSInteger maxL = textField.mar_maxLength + append;
    NSString *toBeString = textField.text;
    
    NSString *lang = [[textField textInputMode] primaryLanguage];
    if ([lang isEqualToString:@"zh-Hans"]) {
        UITextRange *selectedRange = [textField markedTextRange];
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        if (!position) {
            if (toBeString.length > maxL) {
                textField.text = [toBeString substringToIndex:maxL];
            }
        }
    }
    else {
        if (toBeString.length > maxL) {
            textField.text = [toBeString substringToIndex:maxL];
        }
    }
}

@end
