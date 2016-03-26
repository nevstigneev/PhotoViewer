//
//  MRGAlbumFetcher.h
//  PhotoViewer
//
//  Created by Nikolay Evstigneev on 26.03.16.
//  Copyright © 2016 Nikolay Evstigneev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MRGAlbum;

typedef void(^MRGCompletionHandlerWithAlbums)(NSArray<MRGAlbum *> *albums);

@protocol MRGAlbumFetcher <NSObject>

- (void)fetchAlbumsWithCompletion:(MRGCompletionHandlerWithAlbums)completionHandler;

@end

@interface MRGAlbumFetcher : NSObject <MRGAlbumFetcher>

@end
