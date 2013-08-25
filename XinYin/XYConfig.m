//
//  XYConfig.m
//  XinYin
//
//  Created by Dream on 13-8-25.
//  Copyright (c) 2013年 snailshellstudio. All rights reserved.
//

#import "XYConfig.h"

@implementation XYConfig

+ (XYConfig *)sharedInstance
{
    static XYConfig *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[XYConfig alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

@synthesize sizeInfoIndex;
@synthesize selectedImages;

@end
