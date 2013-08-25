//
//  XYNavigationController.m
//  XinYin
//
//  Created by Dream on 13-8-25.
//  Copyright (c) 2013年 snailshellstudio. All rights reserved.
//

#import "XYNavigationController.h"

@interface XYNavigationController ()

@end

@implementation XYNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    /*
    self.view.layer.masksToBounds = NO;
    //self.layer.cornerRadius = 8; // if you like rounded corners
    self.view.layer.shadowOffset = CGSizeMake(-2, 0);
    self.view.layer.shadowRadius = 3;
    self.view.layer.shadowOpacity = 1.0;
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dismiss{
    [self.flipboardNavigationController popViewController];
}
@end
