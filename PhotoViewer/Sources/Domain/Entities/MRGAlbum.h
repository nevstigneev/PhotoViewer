//
//  MRGAlbum.h
//  PhotoViewer
//
//  Created by Nikolay Evstigneev on 26.03.16.
//  Copyright © 2016 Nikolay Evstigneev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PHFetchResult<ObjectType>, PHAsset;

@interface MRGAlbum : NSObject

@property (copy, nonatomic, readonly) NSString *title;
@property (assign, nonatomic, readonly) NSUInteger photoCount;
@property (strong, nonatomic, readonly) PHFetchResult<PHAsset *> *photoAssets;
@property (strong, nonatomic, readonly) PHAsset *lastPhotoAsset;

- (instancetype)initWithAssets:(PHFetchResult<PHAsset *> *)assets title:(NSString *)title;

@end
