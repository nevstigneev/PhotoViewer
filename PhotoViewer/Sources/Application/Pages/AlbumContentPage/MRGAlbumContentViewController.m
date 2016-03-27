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
#import "MRGPhotoPreviewViewController.h"
#import <Photos/Photos.h>

@interface MRGAlbumContentViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

static NSString *const kPhotoPreviewSegue = @"MRGPhotoPreviewSegue";

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
    CGSize size = cell.bounds.size;
    cell.tag = [imageManager requestImageForAsset:asset targetSize:mrg_sizeInPixels(size) contentMode:PHImageContentModeAspectFit options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        cell.thumbnailView.image = result;
    }];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [self performSegueWithIdentifier:kPhotoPreviewSegue sender:cell];
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kPhotoPreviewSegue]) {
        MRGPhotoPreviewViewController *vc = segue.destinationViewController;
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
        PHAsset *asset = self.album.photoAssets[indexPath.row];
        vc.asset = asset;
        vc.assembly = self.assembly;
    }
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
