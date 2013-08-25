//
//  XYPhotoSizeSelectViewController.m
//  XinYin
//
//  Created by Dream on 13-8-25.
//  Copyright (c) 2013年 snailshellstudio. All rights reserved.
//

#import "XYPhotoSizeSelectViewController.h"
#import "XYPhotoSizeCell.h"
#import "XYPhotoSizeInfoViewController.h"

@interface XYPhotoSizeSelectViewController ()

@end

@implementation XYPhotoSizeSelectViewController

@synthesize _tableView;
@synthesize dateSource;

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
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:kBackButtonTitle style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    self.navigationItem.leftBarButtonItem = backButton;
    
    dateSource = [[NSMutableArray alloc] init];
    [dateSource addObject:@"10x10 CM"];
    [dateSource addObject:@"20x20 CM"];
    [dateSource addObject:@"30x40 CM"];
    [dateSource addObject:@"50x60 CM"];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    
}

#pragma mark- Table View Delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cell";
    XYPhotoSizeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[XYPhotoSizeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = [dateSource objectAtIndex:indexPath.row];
    cell.textLabel.textAlignment = UITextAlignmentCenter;
    cell.textLabel.textColor = [UIColor grayColor];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dateSource.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSelector:@selector(gotoPhotoSizeInfoViewController:) withObject:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismiss {
    [self.flipboardNavigationController popViewController];
}

- (void)viewDidUnload {
    [self set_tableView:nil];
    [super viewDidUnload];
}

-(void) gotoPhotoSizeInfoViewController:(NSIndexPath *) indexPath {
    XYPhotoSizeInfoViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:kPhotoSizeViewInfoController];
    vc.sizeInfoIndex = indexPath.row;
    XYNavigationController *nv = [[XYNavigationController alloc] initWithRootViewController:vc];
    [self.flipboardNavigationController pushViewController:nv];
}
@end
