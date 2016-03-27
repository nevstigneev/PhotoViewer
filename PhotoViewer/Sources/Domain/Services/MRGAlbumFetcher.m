//
//  MRGAlbumFetcher.m
//  PhotoViewer
//
//  Created by Nikolay Evstigneev on 26.03.16.
//  Copyright © 2016 Nikolay Evstigneev. All rights reserved.
//

#import "MRGAlbumFetcher.h"
#import "MRGAlbum.h"
#import <Photos/Photos.h>

@interface MRGAlbumFetcher ()

@property (strong, nonatomic, readonly) dispatch_queue_t resultQueue;

@end

@implementation MRGAlbumFetcher

- (instancetype)initWithResultQueue:(dispatch_queue_t)resultQueue {
    self = [super init];
    if (self) {
        _resultQueue = resultQueue;
    }
    return self;
}

- (instancetype)init {
    return [self initWithResultQueue:dispatch_get_main_queue()];
}

#pragma mark - MRGAlbumFetcher

- (void)fetchAlbumsWithCompletion:(MRGCompletionHandlerWithAlbums)completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableArray<MRGAlbum *> *albums = [NSMutableArray new];
        PHFetchResult<PHAssetCollection *> *smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum
                                                                                                   subtype:PHAssetCollectionSubtypeSmartAlbumUserLibrary options:nil];
        [smartAlbums enumerateObjectsUsingBlock:^(PHAssetCollection * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            MRGAlbum *album = [self p_fetchAlbumFromCollection:obj];
            [albums addObject:album];
        }];
        PHFetchResult<PHAssetCollection *> *userAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
        [userAlbums enumerateObjectsUsingBlock:^(PHAssetCollection * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            MRGAlbum *album = [self p_fetchAlbumFromCollection:obj];
            [albums addObject:album];
        }];
        dispatch_async(self.resultQueue, ^{
            if (completionHandler) {
                completionHandler(albums);
            }
        });
    });
}

#pragma mark - Private

- (MRGAlbum *)p_fetchAlbumFromCollection:(PHAssetCollection *)collection {
    PHFetchOptions *fetchOptions = [PHFetchOptions new];
    fetchOptions.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:YES]];
    fetchOptions.predicate = [NSPredicate predicateWithFormat:@"mediaType == %ld", PHAssetMediaTypeImage];
    PHFetchResult<PHAsset *> *assets = [PHAsset fetchAssetsInAssetCollection:collection options:fetchOptions];
    MRGAlbum *album = [[MRGAlbum alloc] initWithAssets:assets title:collection.localizedTitle];
    return album;
}

@end
