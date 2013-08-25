//
//  XYPhotoSizeCell.m
//  XinYin
//
//  Created by Dream on 13-8-25.
//  Copyright (c) 2013年 snailshellstudio. All rights reserved.
//

#import "XYPhotoSizeCell.h"

@implementation XYPhotoSizeCell

@synthesize selectView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        selectView = [[UIView alloc] initWithFrame:self.frame];
        selectView.backgroundColor = [UIColor redColor];
       // [self.contentView addSubview:selectView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    //selectView.alpha = 0.5;
    // Configure the view for the selected state
}



@end
