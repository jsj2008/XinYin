//
//  XYAlbumsViewController.m
//  XinYin
//
//  Created by Dream on 13-8-25.
//  Copyright (c) 2013年 snailshellstudio. All rights reserved.
//

#import "XYAlbumsViewController.h"
#import "XYPhotoSelectViewController.h"

@interface XYAlbumsViewController ()

@end

@implementation XYAlbumsViewController

@synthesize albums;
@synthesize _tableView;
@synthesize ai;
@synthesize lib;

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
    
    
    albums = [[NSMutableArray alloc] init];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.alpha = 0;
    [self initAlbumsData];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //[self initAlbumsData];
}

-(void) initAlbumsData {
    lib = [[ALAssetsLibrary alloc] init];
    [ai startAnimating];
    [lib enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group) {
            NSMutableArray *imgs = [[NSMutableArray alloc] init];
            [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                if (result) {
                    [imgs addObject:result];
                }else{
                    NSDictionary *dict = @{@"group": [group valueForProperty:@"ALAssetsGroupPropertyName"], @"images":imgs};
                    [albums addObject:dict];
                }
            }];
            
        }else{
            albums =(NSMutableArray *) [[albums reverseObjectEnumerator] allObjects];
            [ai stopAnimating];
            [self reloadAfterGetData];
        }
        
    } failureBlock:^(NSError *error) {
        //
    }];
}

-(void) reloadAfterGetData {
    _tableView.alpha = 1;
    [_tableView reloadData];
}

-(void)dismiss {
    [self.flipboardNavigationController popViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- Table View Delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    NSDictionary *dict = [albums objectAtIndex:indexPath.row];
    int t = [[dict objectForKey:@"images"] count];
    ALAsset *image =(ALAsset *) [[dict objectForKey:@"images"] lastObject];
    cell.textLabel.text = [dict objectForKey:@"group"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d Photos", t];
    cell.textLabel.textAlignment = UITextAlignmentCenter;
    cell.textLabel.textColor = [UIColor grayColor];
    //cell.imageView.image = [UIImage imageWithCGImage:[image thumbnail] scale:1.0 orientation:[[image defaultRepresentation] orientation]];
    cell.imageView.image = [UIImage imageWithCGImage:image.thumbnail];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return albums.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self performSelector:@selector(gotoPhotoSelectViewController:) withObject:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
     
}

#pragma mark- Goto Albums

-(void) gotoPhotoSelectViewController :(NSIndexPath *) indexPath{
    XYPhotoSelectViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:kPhotoSelectViewController];
    vc.images = [[albums objectAtIndex:indexPath.row] objectForKey:@"images"];
    XYNavigationController *nv = [[XYNavigationController alloc] initWithRootViewController:vc];
    
    [self.flipboardNavigationController pushViewController:nv];
}

@end
