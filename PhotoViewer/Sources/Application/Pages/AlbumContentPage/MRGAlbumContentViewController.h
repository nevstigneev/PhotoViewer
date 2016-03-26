//
//  MRGAlbumContentViewController.h
//  PhotoViewer
//
//  Created by Nikolay Evstigneev on 26.03.16.
//  Copyright © 2016 Nikolay Evstigneev. All rights reserved.
//

#import "MRGBaseViewController.h"

@class MRGAlbum;

@interface MRGAlbumContentViewController : MRGBaseViewController

@property (strong, nonatomic) MRGAlbum *album;

@end
