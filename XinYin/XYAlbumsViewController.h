//
//  XYAlbumsViewController.h
//  XinYin
//
//  Created by Dream on 13-8-25.
//  Copyright (c) 2013年 snailshellstudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface XYAlbumsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) IBOutlet UITableView *_tableView;
@property (nonatomic, retain) NSMutableArray *albums;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *ai;

@property (nonatomic, retain) ALAssetsLibrary *lib;

@end
