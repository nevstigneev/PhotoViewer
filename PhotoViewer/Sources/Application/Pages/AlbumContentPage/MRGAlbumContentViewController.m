//
//  MRGAlbumContentViewController.m
//  PhotoViewer
//
//  Created by Nikolay Evstigneev on 26.03.16.
//  Copyright © 2016 Nikolay Evstigneev. All rights reserved.
//

#import "MRGAlbumContentViewController.h"
#import "MRGPhotoCell.h"
#import "MRGAlbum.h"
#import "MRGAppAssembly.h"
#import "MRGPresentationHelper.h"
#import <Photos/Photos.h>

@interface MRGAlbumContentViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

static const CGFloat kImageSize = 78.0;

@implementation MRGAlbumContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setupNavigationBar];
    [self p_setupViews];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.album.photoCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MRGPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[MRGPhotoCell reuseIdentifier] forIndexPath:indexPath];
    PHAsset *asset = self.album.photoAssets[indexPath.row];
    PHImageManager *imageManager = self.assembly.imageManager;
    if (cell.tag) {
        [imageManager cancelImageRequest:(PHImageRequestID)cell.tag];
    }
    cell.tag = [imageManager requestImageForAsset:asset targetSize:sizeInPixels(kImageSize) contentMode:PHImageContentModeAspectFit options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        cell.thumbnailView.image = result;
        NSLog(@"%@", NSStringFromCGSize(result.size));
    }];
    return cell;
}

#pragma mark - Private 

- (void)p_setupViews {
    [self.collectionView registerNib:[MRGPhotoCell nib] forCellWithReuseIdentifier:[MRGPhotoCell reuseIdentifier]];
}

- (void)p_setupNavigationBar {
    UIBarButtonItem *barButton = [UIBarButtonItem new];
    barButton.title = @"";
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
    self.navigationItem.title = self.album.title;
}

@end
