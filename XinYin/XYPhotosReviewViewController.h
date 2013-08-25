//
//  XYPhotosEditViewController.h
//  XinYin
//
//  Created by Dream on 13-8-25.
//  Copyright (c) 2013年 snailshellstudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYPhotosReviewViewController : UIViewController

@property (nonatomic, retain) IBOutlet UITableView *_tableView;
@property (nonatomic, retain) NSMutableArray *images;
@property (nonatomic) int sizeInfoIndex;
@property (nonatomic, retain) NSArray *sizeTypes;

@end
