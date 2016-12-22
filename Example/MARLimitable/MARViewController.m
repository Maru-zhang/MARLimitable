//
//  MARViewController.m
//  MARLimitable
//
//  Created by Maru-zhang on 12/21/2016.
//  Copyright (c) 2016 Maru-zhang. All rights reserved.
//

#import "MARViewController.h"
#import <UITextField+Limitable.h>

@interface MARViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField_1;
@property (weak, nonatomic) IBOutlet UITextField *textField_2;
@property (weak, nonatomic) IBOutlet UITextField *textField_3;

@end

@implementation MARViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.textField_1.mar_maxLength = 20;
    self.textField_2.mar_maxLength = 5;
    self.textField_3.mar_maxLength = 10;
    
    self.textField_2.mar_radio = 3;
    
    NSString *str = @"abc";
    NSString *str1 = @"哈";
    NSLog(@"====> str: %@",[str dataUsingEncoding:NSUTF8StringEncoding]);
    NSLog(@"====> str: %ld",[str1 lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
    
}

- (IBAction)tapAction:(id)sender {
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
