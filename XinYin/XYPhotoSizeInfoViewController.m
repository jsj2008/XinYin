//
//  XYPhotoSizeInfoViewController.m
//  XinYin
//
//  Created by Dream on 13-8-25.
//  Copyright (c) 2013年 snailshellstudio. All rights reserved.
//

#import "XYPhotoSizeInfoViewController.h"
#import "XYAlbumsViewController.h"

@interface XYPhotoSizeInfoViewController ()

@end

@implementation XYPhotoSizeInfoViewController

@synthesize scrollView;
@synthesize selectButton;
@synthesize pageController;
@synthesize dateSource;

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
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:kBackButtonTitle style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    self.navigationItem.leftBarButtonItem = backButton;
    
    
    self.dateSource = [NSMutableArray array];
    for (int i = 0; i < 10; i++)
    {
        [self.dateSource addObject:[UIColor colorWithRed:rand()/(float)RAND_MAX
                                               green:rand()/(float)RAND_MAX
                                                blue:rand()/(float)RAND_MAX
                                               alpha:1.0f]];
    }
    
    scrollView.dataSource = self;
    scrollView.delegate = self;
    scrollView.alignment = SwipeViewAlignmentCenter;
    scrollView.pagingEnabled = YES;
    scrollView.wrapEnabled = NO;
    scrollView.itemsPerPage = 1;
    scrollView.truncateFinalPage = YES;
    
    pageController.numberOfPages = scrollView.numberOfPages;
    pageController.defersCurrentPageDisplay = YES;
    
    [selectButton addTarget:self action:@selector(gotoAlbumsViewController) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismiss {
    [self.flipboardNavigationController popViewController];
}

#pragma mark- Swipe
- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView
{
    return [self.dateSource count];
}
- (void)swipeViewCurrentItemIndexDidChange:(SwipeView *)swipeView
{
    //update page control page
    pageController.currentPage = swipeView.currentPage;
}

-(UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
        view.backgroundColor = [dateSource objectAtIndex:index];
        //view.alpha = index*0.2 + 0.2;
    }
    
    return view;
}

#pragma mark- Goto Albums

-(void) gotoAlbumsViewController {
    XYAlbumsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:kAlbumsViewController];
    XYNavigationController *nv = [[XYNavigationController alloc] initWithRootViewController:vc];
    [self.flipboardNavigationController pushViewController:nv];
}


@end
