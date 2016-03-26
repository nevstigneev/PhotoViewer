//
//  MRGAppAssembly.m
//  PhotoViewer
//
//  Created by Nikolay Evstigneev on 26.03.16.
//  Copyright © 2016 Nikolay Evstigneev. All rights reserved.
//

#import "MRGAppAssembly.h"
#import "MRGAlbumFetcher.h"

@implementation MRGAppAssembly

- (instancetype)init {
    self = [super init];
    if (self) {
        _albumFetcher = [MRGAlbumFetcher new];
    }
    return self;
}

@end
