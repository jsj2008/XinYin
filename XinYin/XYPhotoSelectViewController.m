//
//  XYPhotoSelectViewController.m
//  XinYin
//
//  Created by Dream on 13-8-25.
//  Copyright (c) 2013年 snailshellstudio. All rights reserved.
//

#import "XYPhotoSelectViewController.h"
#import "XYPhotoGridCell.h"
#import "XYPhotosReviewViewController.h"


CGSize CollectionViewCellSize = { .height = 106, .width = 106 };
NSString *CollectionViewCellIdentifier = @"cellId";

@interface XYPhotoSelectViewController ()

@end

@implementation XYPhotoSelectViewController

@synthesize _gridView;
@synthesize images;
@synthesize selectedImages;

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
    
    UIBarButtonItem *confirmButton = [[UIBarButtonItem alloc] initWithTitle:kNextButtonTitle style:UIBarButtonItemStylePlain target:self action:@selector(gotoPhotoReviewViewController)];
    self.navigationItem.rightBarButtonItem = confirmButton;
    
    
    selectedImages = [[NSMutableArray alloc] init];
    [self createGridView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismiss {
    [self.flipboardNavigationController popViewController];
}

-(void) gotoNext {
    //
}

#pragma mark- Goto Review

-(void) gotoPhotoReviewViewController{
    if (selectedImages.count < 1) {
        return;
    }
    
    XYPhotosReviewViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:kPhotoReviewViewController];
    vc.images = selectedImages;
    vc.sizeInfoIndex = 0;
    XYNavigationController *nv = [[XYNavigationController alloc] initWithRootViewController:vc];
    [self.flipboardNavigationController pushViewController:nv];
}

#pragma mark- Grid View
- (void)createGridView {
    PSUICollectionViewFlowLayout *layout = [[PSUICollectionViewFlowLayout alloc] init];

    _gridView = [[PSUICollectionView alloc] initWithFrame:[self.view bounds] collectionViewLayout:layout];
    layout.minimumInteritemSpacing = 1;
    layout.minimumLineSpacing = 1;
    _gridView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _gridView.delegate = self;
    _gridView.dataSource = self;
    
    _gridView.backgroundColor = [UIColor whiteColor];
    [_gridView registerClass:[XYPhotoGridCell class] forCellWithReuseIdentifier:CollectionViewCellIdentifier];
    _gridView.allowsMultipleSelection = YES;
    
    [self.view addSubview:_gridView];
}


#pragma mark -
#pragma mark Collection View Data Source

- (int)formatIndexPath:(NSIndexPath *)indexPath {
    int n = indexPath.section  + indexPath.row;
    return n;
}

- (PSUICollectionViewCell *)collectionView:(PSUICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XYPhotoGridCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellIdentifier forIndexPath:indexPath];
    int index = [self formatIndexPath:indexPath];
    ALAsset *image = [images objectAtIndex:index];
    //cell.label.text = [self formatIndexPath:indexPath];
    
    // load the image for this cell
    //NSString *imageToLoad = [NSString stringWithFormat:@"%d.JPG", indexPath.row];
    cell.imageView.image = [UIImage imageWithCGImage:image.thumbnail];
    return cell;
}

- (CGSize)collectionView:(PSUICollectionView *)collectionView layout:(PSUICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CollectionViewCellSize;
}

- (NSInteger)collectionView:(PSUICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return images.count;
}

#pragma mark -
#pragma mark Collection View Delegate

- (void)collectionView:(PSTCollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
   // NSLog(@"Delegate cell %d : HIGHLIGHTED", [self formatIndexPath:indexPath]);
}

- (void)collectionView:(PSTCollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"Delegate cell %d : UNHIGHLIGHTED", [self formatIndexPath:indexPath]);
}

- (void)collectionView:(PSTCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"Delegate cell %d : SELECTED", [self formatIndexPath:indexPath]);
    ALAsset *image = [images objectAtIndex:[self formatIndexPath:indexPath]];
    
    NSLog(@"select: %@", image);
    
    [selectedImages addObject:image];
    NSLog(@"%@", selectedImages);
}

- (void)collectionView:(PSTCollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"Delegate cell %d : DESELECTED", [self formatIndexPath:indexPath]);
    ALAsset *image = [images objectAtIndex:[self formatIndexPath:indexPath]];
    NSLog(@"deselect: %@", image);
    [selectedImages removeObject:image];
    NSLog(@"%@", selectedImages);
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"Check delegate: should cell %d highlight?", [self formatIndexPath:indexPath]);
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   // NSLog(@"Check delegate: should cell %d be selected?", [self formatIndexPath:indexPath]);
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"Check delegate: should cell %d be deselected?", [self formatIndexPath:indexPath]);
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}
@end
