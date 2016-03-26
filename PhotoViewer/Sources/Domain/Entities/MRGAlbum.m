//
//  MRGAlbum.m
//  PhotoViewer
//
//  Created by Nikolay Evstigneev on 26.03.16.
//  Copyright © 2016 Nikolay Evstigneev. All rights reserved.
//

#import "MRGAlbum.h"
#import <Photos/Photos.h>

@implementation MRGAlbum

- (instancetype)init {
    @throw [NSException
            exceptionWithName:NSInternalInconsistencyException
            reason:[NSString stringWithFormat:@"Unexpected deadly init invocation '%@', use %@ instead.",
                    NSStringFromSelector(_cmd),
                    NSStringFromSelector(@selector(initWithAssets:title:))]
            userInfo:nil];
}

- (instancetype)initWithAssets:(PHFetchResult<PHAsset *> *)assets title:(NSString *)title {
    self = [super init];
    if (self) {
        _photoAssets = assets;
        _title = [title copy];
    }
    return self;
}

- (NSUInteger)photoCount {
    return self.photoAssets.count;
}

- (PHAsset *)lastPhotoAsset {
    return self.photoAssets.lastObject;
}

@end
