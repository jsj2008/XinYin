//
//  XYPhotoGridCell.m
//  XinYin
//
//  Created by Dream on 13-8-25.
//  Copyright (c) 2013年 snailshellstudio. All rights reserved.
//

#import "XYPhotoGridCell.h"

@implementation XYPhotoGridCell

@synthesize imageView;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 106, 106)];
        [self.contentView addSubview:imageView];
        
        [self.contentView addSubview:imageView];
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)layoutSubviews {
    //
}

- (void)setHighlighted:(BOOL)highlighted {
    if (highlighted) {
        imageView.alpha = 0.5;
    }
    else {
        imageView.alpha = 1;
    }
}

-(void)setSelected:(BOOL)selected{
    if (selected) {
        imageView.alpha = 0.5;
    }
    else {
        imageView.alpha = 1;
    }
}

@end
