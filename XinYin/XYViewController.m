//
//  XYViewController.m
//  XinYin
//
//  Created by Dream on 13-8-24.
//  Copyright (c) 2013年 snailshellstudio. All rights reserved.
//

#import "XYViewController.h"
#import "XYNavigationController.h"
#import "XYPhotoSizeSelectViewController.h"
#import "AVLogInViewController.h"

@interface XYViewController ()

@end

@implementation XYViewController

@synthesize infoButton;
@synthesize selectButton;
@synthesize loginButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [selectButton addTarget:self action:@selector(gotoSelectViewController) forControlEvents:UIControlEventTouchUpInside];
    [infoButton addTarget:self action:@selector(gotoInfoViewController) forControlEvents:UIControlEventTouchUpInside];
    [loginButton addTarget:self action:@selector(gotoSignUp) forControlEvents:UIControlEventTouchUpInside];
}

-(void) gotoLogin {
    NSLog(@"gogo login");
    AVLogInViewController *vc = [[AVLogInViewController alloc] init];
    vc.delegate = self;
    [self presentModalViewController:vc animated:YES];
}

-(void) gotoSignUp {
    AVSignUpViewController *vc = [[AVSignUpViewController alloc] init];
    vc.delegate = self;
    [self presentModalViewController:vc animated:YES];
}

-(void) gotoInfoViewController {
    //
}

-(void) gotoSelectViewController {
    XYPhotoSizeSelectViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:kPhotoSizeViewController];
    XYNavigationController *nv = [[XYNavigationController alloc] initWithRootViewController:vc];
    [self.flipboardNavigationController pushViewController:nv];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
