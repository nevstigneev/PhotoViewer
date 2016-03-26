//
//  MRGAppAssembly.h
//  PhotoViewer
//
//  Created by Nikolay Evstigneev on 26.03.16.
//  Copyright © 2016 Nikolay Evstigneev. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MRGAlbumFetcher;

@interface MRGAppAssembly : NSObject

@property (strong, nonatomic, readonly) id<MRGAlbumFetcher> albumFetcher;

@end
