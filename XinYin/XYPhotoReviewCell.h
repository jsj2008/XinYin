//
//  XYPhotoReviewCell.h
//  XinYin
//
//  Created by Dream on 13-8-25.
//  Copyright (c) 2013年 snailshellstudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface XYPhotoReviewCell : UITableViewCell

@property (nonatomic) CGSize size;
@property (nonatomic, retain) UIImageView *imageView ;
@property (nonatomic, retain) ALAsset *imageAsset;

-(void) setCellImageAsset:(ALAsset *)_imageAsset ;

@end
