//
//  MRGAlbumListViewController.m
//  PhotoViewer
//
//  Created by Nikolay Evstigneev on 26.03.16.
//  Copyright © 2016 Nikolay Evstigneev. All rights reserved.
//

#import "MRGAlbumListViewController.h"
#import "MRGAppAssembly.h"
#import "MRGAlbumFetcher.h"
#import "MRGAlbum.h"
#import "MRGAlbumCell.h"
#import <Photos/Photos.h>

@interface MRGAlbumListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray<MRGAlbum *> *albums;
@property (assign, nonatomic) PHImageRequestID requestID;

@end

static const CGFloat kRowHeight = 76.0;
static const CGFloat kImageSize = 60.0;

@implementation MRGAlbumListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setupViews];
    [self p_updateData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.albums.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MRGAlbumCell *cell = [tableView dequeueReusableCellWithIdentifier:[MRGAlbumCell reuseIdentifier] forIndexPath:indexPath];
    MRGAlbum *album = self.albums[indexPath.row];
    cell.titleLabel.text = album.title;
    cell.photoCountLabel.text = [NSString stringWithFormat:@"%ld", album.photoCount];
    PHImageManager *imageManager = self.assembly.imageManager;
    [imageManager cancelImageRequest:self.requestID];
    cell.thumbnailView.image = nil;
    self.requestID = [imageManager requestImageForAsset:album.lastPhotoAsset targetSize:CGSizeMake(kImageSize, kImageSize) contentMode:PHImageContentModeAspectFit options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        cell.thumbnailView.image = result;
    }];
    return cell;
}

#pragma mark - UITableViewDelegate

#pragma mark - Private 

- (void)setAlbums:(NSArray<MRGAlbum *> *)albums {
    _albums = albums;
    [self.tableView reloadData];
}

- (void)p_setupViews {
    self.tableView.rowHeight = kRowHeight;
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerNib:[MRGAlbumCell nib] forCellReuseIdentifier:[MRGAlbumCell reuseIdentifier]];
}

- (void)p_updateData {
    id<MRGAlbumFetcher> albumFetcher = self.assembly.albumFetcher;
    [albumFetcher fetchAlbumsWithCompletion:^(NSArray<MRGAlbum *> *albums) {
        self.albums = albums;
    }];
}

@end
