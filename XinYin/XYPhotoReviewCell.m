//
//  XYPhotoReviewCell.m
//  XinYin
//
//  Created by Dream on 13-8-25.
//  Copyright (c) 2013年 snailshellstudio. All rights reserved.
//

#import "XYPhotoReviewCell.h"

@implementation XYPhotoReviewCell

@synthesize size;
@synthesize imageView;
@synthesize imageAsset;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setCellImageAsset:(ALAsset *)_imageAsset{
    
    if (imageView == nil) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        [self.contentView addSubview:imageView];
        imageView.backgroundColor = [UIColor redColor];
    }
    
    self.imageAsset = _imageAsset;
    ALAssetRepresentation *rep = self.imageAsset.defaultRepresentation;
    UIImage *image = [UIImage imageWithCGImage: rep.fullResolutionImage];
    imageView.image =image;
    NSLog(@"-->%@", image);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
