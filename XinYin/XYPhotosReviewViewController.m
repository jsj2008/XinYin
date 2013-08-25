//
//  XYPhotosEditViewController.m
//  XinYin
//
//  Created by Dream on 13-8-25.
//  Copyright (c) 2013年 snailshellstudio. All rights reserved.
//

#import "XYPhotosReviewViewController.h"
#import "XYPhotoReviewCell.h"

@interface XYPhotosReviewViewController ()

@end

@implementation XYPhotosReviewViewController

@synthesize  _tableView;
@synthesize images;
@synthesize sizeInfoIndex;
@synthesize sizeTypes;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    sizeInfoIndex = [XYConfig sharedInstance].sizeInfoIndex;
    sizeTypes = @[@"{80,80}",
                  @"{100,100}",
                  @"{80,100}",
                  @"{100,120}"];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark- Table View Delegate
-(CGFloat) heightForReviewCell {
    CGSize  size = CGSizeFromString([sizeTypes objectAtIndex:sizeInfoIndex]);
    CGFloat h = size.height + 20.0f;
    NSLog(@"H: %f", h);
    return h;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cell";
    XYPhotoReviewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[XYPhotoReviewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.size = CGSizeFromString([sizeTypes objectAtIndex:sizeInfoIndex]);
    }
    /*
    cell.textLabel.text = [images objectAtIndex:indexPath.row];
    cell.textLabel.textAlignment = UITextAlignmentCenter;
    cell.textLabel.textColor = [UIColor grayColor];
     */
    [cell setCellImageAsset:[images objectAtIndex:indexPath.row]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self heightForReviewCell];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return images.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
    [self performSelector:@selector(gotoPhotoSizeInfoViewController:) withObject:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
     */
}




@end
