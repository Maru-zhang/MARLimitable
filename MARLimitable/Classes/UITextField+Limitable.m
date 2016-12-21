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

@implementation UITextField (Limitable)

@dynamic maxLength;

#pragma mark - Getter

- (NSInteger)maxLength
{
    NSValue *maxLengthValue = objc_getAssociatedObject(self, &MARMaxLengthKey);
    if (maxLengthValue) {
        NSInteger maxLength;
        [maxLengthValue getValue:&maxLength];
        return maxLength;
    }
    
    return NSIntegerMax;
}

#pragma mark - Setter

- (void)setMaxLength:(NSInteger)maxLength
{
    if (maxLength < 1) {
        maxLength = NSIntegerMax;
    }
    
    NSValue *value = [NSValue value:&maxLength withObjCType:@encode(NSInteger)];
    objc_setAssociatedObject(self, &MARMaxLengthKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self textFieldTextChanged:self];
    [self removeTarget:self
                action:@selector(textFieldTextChanged:)
      forControlEvents:UIControlEventEditingChanged];
    [self addTarget:self
             action:@selector(textFieldTextChanged:)
   forControlEvents:UIControlEventEditingChanged];
}

#pragma mark - Event

- (void)textFieldTextChanged:(UITextField *)textField
{
    NSInteger maxL = textField.maxLength;
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
