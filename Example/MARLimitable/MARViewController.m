//
//  MARViewController.m
//  MARLimitable
//
//  Created by Maru-zhang on 12/21/2016.
//  Copyright (c) 2016 Maru-zhang. All rights reserved.
//

#import "MARViewController.h"

@interface MARViewController ()

@end

@implementation MARViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    textField.maxLength = 20;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
