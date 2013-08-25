//
//  XYPhotoSizeSelectViewController.h
//  XinYin
//
//  Created by Dream on 13-8-25.
//  Copyright (c) 2013年 snailshellstudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYNavigationController.h"

@interface XYPhotoSizeSelectViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *_tableView;

@property (nonatomic, retain) NSMutableArray *dateSource;

@end
