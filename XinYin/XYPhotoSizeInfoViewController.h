//
//  XYPhotoSizeInfoViewController.h
//  XinYin
//
//  Created by Dream on 13-8-25.
//  Copyright (c) 2013年 snailshellstudio. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface XYPhotoSizeInfoViewController : UIViewController<SwipeViewDataSource, SwipeViewDelegate>

@property (nonatomic, strong) IBOutlet SwipeView *scrollView;

@property (nonatomic, strong) IBOutlet UIPageControl *pageController;

@property (nonatomic, strong) IBOutlet UIButton *selectButton;

@property (nonatomic, retain) NSMutableArray *dateSource;
@property (nonatomic) int sizeInfoIndex;


@end
