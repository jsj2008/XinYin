//
//  XYConfig.h
//  XinYin
//
//  Created by Dream on 13-8-25.
//  Copyright (c) 2013年 snailshellstudio. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kBackButtonTitle @"返回"
#define kNextButtonTitle @"下一步"

#define kPhotoSizeViewController @"photoSizeVC"
#define kPhotoSizeViewInfoController @"photoSizeInfoVC"
#define kAlbumsViewController @"AlbumsVC"
#define kPhotoSelectViewController @"photoSelectVC"
#define kPhotoReviewViewController @"photoReviewVC"



@interface XYConfig : NSObject

// save the user selected images
@property (nonatomic) int sizeInfoIndex ;

@property (nonatomic, retain) NSMutableArray *selectedImages;

+ (XYConfig *)sharedInstance ;

@end
